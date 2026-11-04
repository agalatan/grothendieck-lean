import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2064
import Grothe.UpperChaos.OriginalRow227TriangleData2065

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow220

open ConditionalTableLookup

def values2064 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2064.coefficient220_219,
  OriginalRow227TriangleData2064.coefficient220_220,
  OriginalRow227TriangleData2064.coefficient220_221,
  OriginalRow227TriangleData2064.coefficient220_222,
  OriginalRow227TriangleData2064.coefficient220_223,
  OriginalRow227TriangleData2064.coefficient220_224,
  OriginalRow227TriangleData2064.coefficient220_225,
  OriginalRow227TriangleData2064.coefficient220_226,
  OriginalRow227TriangleData2064.coefficient220_227,
  OriginalRow227TriangleData2064.coefficient220_228,
  OriginalRow227TriangleData2064.coefficient220_229,
  OriginalRow227TriangleData2064.coefficient220_230,
  OriginalRow227TriangleData2064.coefficient220_231,
  OriginalRow227TriangleData2064.coefficient220_232,
  OriginalRow227TriangleData2064.coefficient220_233,
  OriginalRow227TriangleData2064.coefficient220_234,
  OriginalRow227TriangleData2064.coefficient220_235,
  OriginalRow227TriangleData2064.coefficient220_236,
  OriginalRow227TriangleData2064.coefficient220_237,
  OriginalRow227TriangleData2064.coefficient220_238,
  OriginalRow227TriangleData2064.coefficient220_239,
  OriginalRow227TriangleData2064.coefficient220_240,
  OriginalRow227TriangleData2064.coefficient220_241,
  OriginalRow227TriangleData2064.coefficient220_242,
  OriginalRow227TriangleData2064.coefficient220_243,
  OriginalRow227TriangleData2064.coefficient220_244,
  OriginalRow227TriangleData2064.coefficient220_245,
  OriginalRow227TriangleData2064.coefficient220_246,
  OriginalRow227TriangleData2064.coefficient220_247,
  OriginalRow227TriangleData2064.coefficient220_248,
  OriginalRow227TriangleData2064.coefficient220_249,
  OriginalRow227TriangleData2064.coefficient220_250
]

theorem values2064_size : values2064.size = 32 := rfl

def block2064 : ℕ → Option IntervalDyadic := segment 219 values2064

theorem block2064_domain : ExactDomain block2064 219 251 := by
  simpa only [values2064_size] using segment_domain 219 values2064

theorem block2064_get (i : Fin 32) :
    block2064 (219 + i.val) = some (values2064[i.val]'(by rw [values2064_size]; exact i.isLt)) := by
  exact segment_get 219 values2064 ⟨i.val, by rw [values2064_size]; exact i.isLt⟩

def values2065 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2065.coefficient220_251,
  OriginalRow227TriangleData2065.coefficient220_252,
  OriginalRow227TriangleData2065.coefficient220_253,
  OriginalRow227TriangleData2065.coefficient220_254,
  OriginalRow227TriangleData2065.coefficient220_255,
  OriginalRow227TriangleData2065.coefficient220_256,
  OriginalRow227TriangleData2065.coefficient220_257,
  OriginalRow227TriangleData2065.coefficient220_258,
  OriginalRow227TriangleData2065.coefficient220_259,
  OriginalRow227TriangleData2065.coefficient220_260,
  OriginalRow227TriangleData2065.coefficient220_261,
  OriginalRow227TriangleData2065.coefficient220_262,
  OriginalRow227TriangleData2065.coefficient220_263,
  OriginalRow227TriangleData2065.coefficient220_264,
  OriginalRow227TriangleData2065.coefficient220_265,
  OriginalRow227TriangleData2065.coefficient220_266,
  OriginalRow227TriangleData2065.coefficient220_267,
  OriginalRow227TriangleData2065.coefficient220_268,
  OriginalRow227TriangleData2065.coefficient220_269,
  OriginalRow227TriangleData2065.coefficient220_270,
  OriginalRow227TriangleData2065.coefficient220_271,
  OriginalRow227TriangleData2065.coefficient220_272,
  OriginalRow227TriangleData2065.coefficient220_273,
  OriginalRow227TriangleData2065.coefficient220_274,
  OriginalRow227TriangleData2065.coefficient220_275,
  OriginalRow227TriangleData2065.coefficient220_276,
  OriginalRow227TriangleData2065.coefficient220_277,
  OriginalRow227TriangleData2065.coefficient220_278,
  OriginalRow227TriangleData2065.coefficient220_279,
  OriginalRow227TriangleData2065.coefficient220_280,
  OriginalRow227TriangleData2065.coefficient220_281
]

theorem values2065_size : values2065.size = 31 := rfl

def block2065 : ℕ → Option IntervalDyadic := segment 251 values2065

theorem block2065_domain : ExactDomain block2065 251 282 := by
  simpa only [values2065_size] using segment_domain 251 values2065

theorem block2065_get (i : Fin 31) :
    block2065 (251 + i.val) = some (values2065[i.val]'(by rw [values2065_size]; exact i.isLt)) := by
  exact segment_get 251 values2065 ⟨i.val, by rw [values2065_size]; exact i.isLt⟩

def node0219_0282 : ℕ → Option IntervalDyadic := split 251 block2064 block2065

theorem node0219_0282_domain : ExactDomain node0219_0282 219 282 := by
  exact split_domain (by decide) (by decide) block2064_domain block2065_domain

def lookup : ℕ → Option IntervalDyadic := node0219_0282

theorem lookup_domain : ExactDomain lookup 219 282 :=
  node0219_0282_domain

theorem block2064_lookup (i : Fin 32) :
    lookup (219 + i.val) = some (values2064[i.val]'(by rw [values2064_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0219_0282 (219 + i.val) = _
  rw [node0219_0282, split_left 251 block2064 block2065 (by omega)]
  exact block2064_get i

theorem block2065_lookup (i : Fin 31) :
    lookup (251 + i.val) = some (values2065[i.val]'(by rw [values2065_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0219_0282 (251 + i.val) = _
  rw [node0219_0282, split_right 251 block2064 block2065 (by omega)]
  exact block2065_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow220.block2064_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow220.block2064_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow220.block2065_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow220.block2065_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow220.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow220.block2064_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow220.block2065_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow220
