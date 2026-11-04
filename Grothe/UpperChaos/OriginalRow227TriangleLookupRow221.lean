import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2066
import Grothe.UpperChaos.OriginalRow227TriangleData2067

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow221

open ConditionalTableLookup

def values2066 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2066.coefficient221_220,
  OriginalRow227TriangleData2066.coefficient221_221,
  OriginalRow227TriangleData2066.coefficient221_222,
  OriginalRow227TriangleData2066.coefficient221_223,
  OriginalRow227TriangleData2066.coefficient221_224,
  OriginalRow227TriangleData2066.coefficient221_225,
  OriginalRow227TriangleData2066.coefficient221_226,
  OriginalRow227TriangleData2066.coefficient221_227,
  OriginalRow227TriangleData2066.coefficient221_228,
  OriginalRow227TriangleData2066.coefficient221_229,
  OriginalRow227TriangleData2066.coefficient221_230,
  OriginalRow227TriangleData2066.coefficient221_231,
  OriginalRow227TriangleData2066.coefficient221_232,
  OriginalRow227TriangleData2066.coefficient221_233,
  OriginalRow227TriangleData2066.coefficient221_234,
  OriginalRow227TriangleData2066.coefficient221_235,
  OriginalRow227TriangleData2066.coefficient221_236,
  OriginalRow227TriangleData2066.coefficient221_237,
  OriginalRow227TriangleData2066.coefficient221_238,
  OriginalRow227TriangleData2066.coefficient221_239,
  OriginalRow227TriangleData2066.coefficient221_240,
  OriginalRow227TriangleData2066.coefficient221_241,
  OriginalRow227TriangleData2066.coefficient221_242,
  OriginalRow227TriangleData2066.coefficient221_243,
  OriginalRow227TriangleData2066.coefficient221_244,
  OriginalRow227TriangleData2066.coefficient221_245,
  OriginalRow227TriangleData2066.coefficient221_246,
  OriginalRow227TriangleData2066.coefficient221_247,
  OriginalRow227TriangleData2066.coefficient221_248,
  OriginalRow227TriangleData2066.coefficient221_249,
  OriginalRow227TriangleData2066.coefficient221_250,
  OriginalRow227TriangleData2066.coefficient221_251
]

theorem values2066_size : values2066.size = 32 := rfl

def block2066 : ℕ → Option IntervalDyadic := segment 220 values2066

theorem block2066_domain : ExactDomain block2066 220 252 := by
  simpa only [values2066_size] using segment_domain 220 values2066

theorem block2066_get (i : Fin 32) :
    block2066 (220 + i.val) = some (values2066[i.val]'(by rw [values2066_size]; exact i.isLt)) := by
  exact segment_get 220 values2066 ⟨i.val, by rw [values2066_size]; exact i.isLt⟩

def values2067 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2067.coefficient221_252,
  OriginalRow227TriangleData2067.coefficient221_253,
  OriginalRow227TriangleData2067.coefficient221_254,
  OriginalRow227TriangleData2067.coefficient221_255,
  OriginalRow227TriangleData2067.coefficient221_256,
  OriginalRow227TriangleData2067.coefficient221_257,
  OriginalRow227TriangleData2067.coefficient221_258,
  OriginalRow227TriangleData2067.coefficient221_259,
  OriginalRow227TriangleData2067.coefficient221_260,
  OriginalRow227TriangleData2067.coefficient221_261,
  OriginalRow227TriangleData2067.coefficient221_262,
  OriginalRow227TriangleData2067.coefficient221_263,
  OriginalRow227TriangleData2067.coefficient221_264,
  OriginalRow227TriangleData2067.coefficient221_265,
  OriginalRow227TriangleData2067.coefficient221_266,
  OriginalRow227TriangleData2067.coefficient221_267,
  OriginalRow227TriangleData2067.coefficient221_268,
  OriginalRow227TriangleData2067.coefficient221_269,
  OriginalRow227TriangleData2067.coefficient221_270,
  OriginalRow227TriangleData2067.coefficient221_271,
  OriginalRow227TriangleData2067.coefficient221_272,
  OriginalRow227TriangleData2067.coefficient221_273,
  OriginalRow227TriangleData2067.coefficient221_274,
  OriginalRow227TriangleData2067.coefficient221_275,
  OriginalRow227TriangleData2067.coefficient221_276,
  OriginalRow227TriangleData2067.coefficient221_277,
  OriginalRow227TriangleData2067.coefficient221_278,
  OriginalRow227TriangleData2067.coefficient221_279,
  OriginalRow227TriangleData2067.coefficient221_280
]

theorem values2067_size : values2067.size = 29 := rfl

def block2067 : ℕ → Option IntervalDyadic := segment 252 values2067

theorem block2067_domain : ExactDomain block2067 252 281 := by
  simpa only [values2067_size] using segment_domain 252 values2067

theorem block2067_get (i : Fin 29) :
    block2067 (252 + i.val) = some (values2067[i.val]'(by rw [values2067_size]; exact i.isLt)) := by
  exact segment_get 252 values2067 ⟨i.val, by rw [values2067_size]; exact i.isLt⟩

def node0220_0281 : ℕ → Option IntervalDyadic := split 252 block2066 block2067

theorem node0220_0281_domain : ExactDomain node0220_0281 220 281 := by
  exact split_domain (by decide) (by decide) block2066_domain block2067_domain

def lookup : ℕ → Option IntervalDyadic := node0220_0281

theorem lookup_domain : ExactDomain lookup 220 281 :=
  node0220_0281_domain

theorem block2066_lookup (i : Fin 32) :
    lookup (220 + i.val) = some (values2066[i.val]'(by rw [values2066_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0220_0281 (220 + i.val) = _
  rw [node0220_0281, split_left 252 block2066 block2067 (by omega)]
  exact block2066_get i

theorem block2067_lookup (i : Fin 29) :
    lookup (252 + i.val) = some (values2067[i.val]'(by rw [values2067_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0220_0281 (252 + i.val) = _
  rw [node0220_0281, split_right 252 block2066 block2067 (by omega)]
  exact block2067_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow221.block2066_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow221.block2066_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow221.block2067_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow221.block2067_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow221.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow221.block2066_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow221.block2067_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow221
