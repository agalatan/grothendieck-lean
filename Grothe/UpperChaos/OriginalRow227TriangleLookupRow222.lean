import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2068
import Grothe.UpperChaos.OriginalRow227TriangleData2069

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow222

open ConditionalTableLookup

def values2068 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2068.coefficient222_221,
  OriginalRow227TriangleData2068.coefficient222_222,
  OriginalRow227TriangleData2068.coefficient222_223,
  OriginalRow227TriangleData2068.coefficient222_224,
  OriginalRow227TriangleData2068.coefficient222_225,
  OriginalRow227TriangleData2068.coefficient222_226,
  OriginalRow227TriangleData2068.coefficient222_227,
  OriginalRow227TriangleData2068.coefficient222_228,
  OriginalRow227TriangleData2068.coefficient222_229,
  OriginalRow227TriangleData2068.coefficient222_230,
  OriginalRow227TriangleData2068.coefficient222_231,
  OriginalRow227TriangleData2068.coefficient222_232,
  OriginalRow227TriangleData2068.coefficient222_233,
  OriginalRow227TriangleData2068.coefficient222_234,
  OriginalRow227TriangleData2068.coefficient222_235,
  OriginalRow227TriangleData2068.coefficient222_236,
  OriginalRow227TriangleData2068.coefficient222_237,
  OriginalRow227TriangleData2068.coefficient222_238,
  OriginalRow227TriangleData2068.coefficient222_239,
  OriginalRow227TriangleData2068.coefficient222_240,
  OriginalRow227TriangleData2068.coefficient222_241,
  OriginalRow227TriangleData2068.coefficient222_242,
  OriginalRow227TriangleData2068.coefficient222_243,
  OriginalRow227TriangleData2068.coefficient222_244,
  OriginalRow227TriangleData2068.coefficient222_245,
  OriginalRow227TriangleData2068.coefficient222_246,
  OriginalRow227TriangleData2068.coefficient222_247,
  OriginalRow227TriangleData2068.coefficient222_248,
  OriginalRow227TriangleData2068.coefficient222_249,
  OriginalRow227TriangleData2068.coefficient222_250,
  OriginalRow227TriangleData2068.coefficient222_251,
  OriginalRow227TriangleData2068.coefficient222_252
]

theorem values2068_size : values2068.size = 32 := rfl

def block2068 : ℕ → Option IntervalDyadic := segment 221 values2068

theorem block2068_domain : ExactDomain block2068 221 253 := by
  simpa only [values2068_size] using segment_domain 221 values2068

theorem block2068_get (i : Fin 32) :
    block2068 (221 + i.val) = some (values2068[i.val]'(by rw [values2068_size]; exact i.isLt)) := by
  exact segment_get 221 values2068 ⟨i.val, by rw [values2068_size]; exact i.isLt⟩

def values2069 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2069.coefficient222_253,
  OriginalRow227TriangleData2069.coefficient222_254,
  OriginalRow227TriangleData2069.coefficient222_255,
  OriginalRow227TriangleData2069.coefficient222_256,
  OriginalRow227TriangleData2069.coefficient222_257,
  OriginalRow227TriangleData2069.coefficient222_258,
  OriginalRow227TriangleData2069.coefficient222_259,
  OriginalRow227TriangleData2069.coefficient222_260,
  OriginalRow227TriangleData2069.coefficient222_261,
  OriginalRow227TriangleData2069.coefficient222_262,
  OriginalRow227TriangleData2069.coefficient222_263,
  OriginalRow227TriangleData2069.coefficient222_264,
  OriginalRow227TriangleData2069.coefficient222_265,
  OriginalRow227TriangleData2069.coefficient222_266,
  OriginalRow227TriangleData2069.coefficient222_267,
  OriginalRow227TriangleData2069.coefficient222_268,
  OriginalRow227TriangleData2069.coefficient222_269,
  OriginalRow227TriangleData2069.coefficient222_270,
  OriginalRow227TriangleData2069.coefficient222_271,
  OriginalRow227TriangleData2069.coefficient222_272,
  OriginalRow227TriangleData2069.coefficient222_273,
  OriginalRow227TriangleData2069.coefficient222_274,
  OriginalRow227TriangleData2069.coefficient222_275,
  OriginalRow227TriangleData2069.coefficient222_276,
  OriginalRow227TriangleData2069.coefficient222_277,
  OriginalRow227TriangleData2069.coefficient222_278,
  OriginalRow227TriangleData2069.coefficient222_279
]

theorem values2069_size : values2069.size = 27 := rfl

def block2069 : ℕ → Option IntervalDyadic := segment 253 values2069

theorem block2069_domain : ExactDomain block2069 253 280 := by
  simpa only [values2069_size] using segment_domain 253 values2069

theorem block2069_get (i : Fin 27) :
    block2069 (253 + i.val) = some (values2069[i.val]'(by rw [values2069_size]; exact i.isLt)) := by
  exact segment_get 253 values2069 ⟨i.val, by rw [values2069_size]; exact i.isLt⟩

def node0221_0280 : ℕ → Option IntervalDyadic := split 253 block2068 block2069

theorem node0221_0280_domain : ExactDomain node0221_0280 221 280 := by
  exact split_domain (by decide) (by decide) block2068_domain block2069_domain

def lookup : ℕ → Option IntervalDyadic := node0221_0280

theorem lookup_domain : ExactDomain lookup 221 280 :=
  node0221_0280_domain

theorem block2068_lookup (i : Fin 32) :
    lookup (221 + i.val) = some (values2068[i.val]'(by rw [values2068_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0221_0280 (221 + i.val) = _
  rw [node0221_0280, split_left 253 block2068 block2069 (by omega)]
  exact block2068_get i

theorem block2069_lookup (i : Fin 27) :
    lookup (253 + i.val) = some (values2069[i.val]'(by rw [values2069_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0221_0280 (253 + i.val) = _
  rw [node0221_0280, split_right 253 block2068 block2069 (by omega)]
  exact block2069_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow222.block2068_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow222.block2068_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow222.block2069_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow222.block2069_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow222.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow222.block2068_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow222.block2069_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow222
