import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2061
import Grothe.UpperChaos.OriginalRow227TriangleData2062
import Grothe.UpperChaos.OriginalRow227TriangleData2063

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow219

open ConditionalTableLookup

def values2061 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2061.coefficient219_218,
  OriginalRow227TriangleData2061.coefficient219_219,
  OriginalRow227TriangleData2061.coefficient219_220,
  OriginalRow227TriangleData2061.coefficient219_221,
  OriginalRow227TriangleData2061.coefficient219_222,
  OriginalRow227TriangleData2061.coefficient219_223,
  OriginalRow227TriangleData2061.coefficient219_224,
  OriginalRow227TriangleData2061.coefficient219_225,
  OriginalRow227TriangleData2061.coefficient219_226,
  OriginalRow227TriangleData2061.coefficient219_227,
  OriginalRow227TriangleData2061.coefficient219_228,
  OriginalRow227TriangleData2061.coefficient219_229,
  OriginalRow227TriangleData2061.coefficient219_230,
  OriginalRow227TriangleData2061.coefficient219_231,
  OriginalRow227TriangleData2061.coefficient219_232,
  OriginalRow227TriangleData2061.coefficient219_233,
  OriginalRow227TriangleData2061.coefficient219_234,
  OriginalRow227TriangleData2061.coefficient219_235,
  OriginalRow227TriangleData2061.coefficient219_236,
  OriginalRow227TriangleData2061.coefficient219_237,
  OriginalRow227TriangleData2061.coefficient219_238,
  OriginalRow227TriangleData2061.coefficient219_239,
  OriginalRow227TriangleData2061.coefficient219_240,
  OriginalRow227TriangleData2061.coefficient219_241,
  OriginalRow227TriangleData2061.coefficient219_242,
  OriginalRow227TriangleData2061.coefficient219_243,
  OriginalRow227TriangleData2061.coefficient219_244,
  OriginalRow227TriangleData2061.coefficient219_245,
  OriginalRow227TriangleData2061.coefficient219_246,
  OriginalRow227TriangleData2061.coefficient219_247,
  OriginalRow227TriangleData2061.coefficient219_248,
  OriginalRow227TriangleData2061.coefficient219_249
]

theorem values2061_size : values2061.size = 32 := rfl

def block2061 : ℕ → Option IntervalDyadic := segment 218 values2061

theorem block2061_domain : ExactDomain block2061 218 250 := by
  simpa only [values2061_size] using segment_domain 218 values2061

theorem block2061_get (i : Fin 32) :
    block2061 (218 + i.val) = some (values2061[i.val]'(by rw [values2061_size]; exact i.isLt)) := by
  exact segment_get 218 values2061 ⟨i.val, by rw [values2061_size]; exact i.isLt⟩

def values2062 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2062.coefficient219_250,
  OriginalRow227TriangleData2062.coefficient219_251,
  OriginalRow227TriangleData2062.coefficient219_252,
  OriginalRow227TriangleData2062.coefficient219_253,
  OriginalRow227TriangleData2062.coefficient219_254,
  OriginalRow227TriangleData2062.coefficient219_255,
  OriginalRow227TriangleData2062.coefficient219_256,
  OriginalRow227TriangleData2062.coefficient219_257,
  OriginalRow227TriangleData2062.coefficient219_258,
  OriginalRow227TriangleData2062.coefficient219_259,
  OriginalRow227TriangleData2062.coefficient219_260,
  OriginalRow227TriangleData2062.coefficient219_261,
  OriginalRow227TriangleData2062.coefficient219_262,
  OriginalRow227TriangleData2062.coefficient219_263,
  OriginalRow227TriangleData2062.coefficient219_264,
  OriginalRow227TriangleData2062.coefficient219_265,
  OriginalRow227TriangleData2062.coefficient219_266,
  OriginalRow227TriangleData2062.coefficient219_267,
  OriginalRow227TriangleData2062.coefficient219_268,
  OriginalRow227TriangleData2062.coefficient219_269,
  OriginalRow227TriangleData2062.coefficient219_270,
  OriginalRow227TriangleData2062.coefficient219_271,
  OriginalRow227TriangleData2062.coefficient219_272,
  OriginalRow227TriangleData2062.coefficient219_273,
  OriginalRow227TriangleData2062.coefficient219_274,
  OriginalRow227TriangleData2062.coefficient219_275,
  OriginalRow227TriangleData2062.coefficient219_276,
  OriginalRow227TriangleData2062.coefficient219_277,
  OriginalRow227TriangleData2062.coefficient219_278,
  OriginalRow227TriangleData2062.coefficient219_279,
  OriginalRow227TriangleData2062.coefficient219_280,
  OriginalRow227TriangleData2062.coefficient219_281
]

theorem values2062_size : values2062.size = 32 := rfl

def block2062 : ℕ → Option IntervalDyadic := segment 250 values2062

theorem block2062_domain : ExactDomain block2062 250 282 := by
  simpa only [values2062_size] using segment_domain 250 values2062

theorem block2062_get (i : Fin 32) :
    block2062 (250 + i.val) = some (values2062[i.val]'(by rw [values2062_size]; exact i.isLt)) := by
  exact segment_get 250 values2062 ⟨i.val, by rw [values2062_size]; exact i.isLt⟩

def values2063 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2063.coefficient219_282
]

theorem values2063_size : values2063.size = 1 := rfl

def block2063 : ℕ → Option IntervalDyadic := segment 282 values2063

theorem block2063_domain : ExactDomain block2063 282 283 := by
  simpa only [values2063_size] using segment_domain 282 values2063

theorem block2063_get (i : Fin 1) :
    block2063 (282 + i.val) = some (values2063[i.val]'(by rw [values2063_size]; exact i.isLt)) := by
  exact segment_get 282 values2063 ⟨i.val, by rw [values2063_size]; exact i.isLt⟩

def node0250_0283 : ℕ → Option IntervalDyadic := split 282 block2062 block2063

theorem node0250_0283_domain : ExactDomain node0250_0283 250 283 := by
  exact split_domain (by decide) (by decide) block2062_domain block2063_domain

def node0218_0283 : ℕ → Option IntervalDyadic := split 250 block2061 node0250_0283

theorem node0218_0283_domain : ExactDomain node0218_0283 218 283 := by
  exact split_domain (by decide) (by decide) block2061_domain node0250_0283_domain

def lookup : ℕ → Option IntervalDyadic := node0218_0283

theorem lookup_domain : ExactDomain lookup 218 283 :=
  node0218_0283_domain

theorem block2061_lookup (i : Fin 32) :
    lookup (218 + i.val) = some (values2061[i.val]'(by rw [values2061_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0218_0283 (218 + i.val) = _
  rw [node0218_0283, split_left 250 block2061 node0250_0283 (by omega)]
  exact block2061_get i

theorem block2062_lookup (i : Fin 32) :
    lookup (250 + i.val) = some (values2062[i.val]'(by rw [values2062_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0218_0283 (250 + i.val) = _
  rw [node0218_0283, split_right 250 block2061 node0250_0283 (by omega)]
  rw [node0250_0283, split_left 282 block2062 block2063 (by omega)]
  exact block2062_get i

theorem block2063_lookup (i : Fin 1) :
    lookup (282 + i.val) = some (values2063[i.val]'(by rw [values2063_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0218_0283 (282 + i.val) = _
  rw [node0218_0283, split_right 250 block2061 node0250_0283 (by omega)]
  rw [node0250_0283, split_right 282 block2062 block2063 (by omega)]
  exact block2063_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2061_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2061_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2062_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2062_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2063_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2063_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2061_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2062_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow219.block2063_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow219
