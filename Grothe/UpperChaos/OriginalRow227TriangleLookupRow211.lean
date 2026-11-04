import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2037
import Grothe.UpperChaos.OriginalRow227TriangleData2038
import Grothe.UpperChaos.OriginalRow227TriangleData2039

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow211

open ConditionalTableLookup

def values2037 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2037.coefficient211_210,
  OriginalRow227TriangleData2037.coefficient211_211,
  OriginalRow227TriangleData2037.coefficient211_212,
  OriginalRow227TriangleData2037.coefficient211_213,
  OriginalRow227TriangleData2037.coefficient211_214,
  OriginalRow227TriangleData2037.coefficient211_215,
  OriginalRow227TriangleData2037.coefficient211_216,
  OriginalRow227TriangleData2037.coefficient211_217,
  OriginalRow227TriangleData2037.coefficient211_218,
  OriginalRow227TriangleData2037.coefficient211_219,
  OriginalRow227TriangleData2037.coefficient211_220,
  OriginalRow227TriangleData2037.coefficient211_221,
  OriginalRow227TriangleData2037.coefficient211_222,
  OriginalRow227TriangleData2037.coefficient211_223,
  OriginalRow227TriangleData2037.coefficient211_224,
  OriginalRow227TriangleData2037.coefficient211_225,
  OriginalRow227TriangleData2037.coefficient211_226,
  OriginalRow227TriangleData2037.coefficient211_227,
  OriginalRow227TriangleData2037.coefficient211_228,
  OriginalRow227TriangleData2037.coefficient211_229,
  OriginalRow227TriangleData2037.coefficient211_230,
  OriginalRow227TriangleData2037.coefficient211_231,
  OriginalRow227TriangleData2037.coefficient211_232,
  OriginalRow227TriangleData2037.coefficient211_233,
  OriginalRow227TriangleData2037.coefficient211_234,
  OriginalRow227TriangleData2037.coefficient211_235,
  OriginalRow227TriangleData2037.coefficient211_236,
  OriginalRow227TriangleData2037.coefficient211_237,
  OriginalRow227TriangleData2037.coefficient211_238,
  OriginalRow227TriangleData2037.coefficient211_239,
  OriginalRow227TriangleData2037.coefficient211_240,
  OriginalRow227TriangleData2037.coefficient211_241
]

theorem values2037_size : values2037.size = 32 := rfl

def block2037 : ℕ → Option IntervalDyadic := segment 210 values2037

theorem block2037_domain : ExactDomain block2037 210 242 := by
  simpa only [values2037_size] using segment_domain 210 values2037

theorem block2037_get (i : Fin 32) :
    block2037 (210 + i.val) = some (values2037[i.val]'(by rw [values2037_size]; exact i.isLt)) := by
  exact segment_get 210 values2037 ⟨i.val, by rw [values2037_size]; exact i.isLt⟩

def values2038 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2038.coefficient211_242,
  OriginalRow227TriangleData2038.coefficient211_243,
  OriginalRow227TriangleData2038.coefficient211_244,
  OriginalRow227TriangleData2038.coefficient211_245,
  OriginalRow227TriangleData2038.coefficient211_246,
  OriginalRow227TriangleData2038.coefficient211_247,
  OriginalRow227TriangleData2038.coefficient211_248,
  OriginalRow227TriangleData2038.coefficient211_249,
  OriginalRow227TriangleData2038.coefficient211_250,
  OriginalRow227TriangleData2038.coefficient211_251,
  OriginalRow227TriangleData2038.coefficient211_252,
  OriginalRow227TriangleData2038.coefficient211_253,
  OriginalRow227TriangleData2038.coefficient211_254,
  OriginalRow227TriangleData2038.coefficient211_255,
  OriginalRow227TriangleData2038.coefficient211_256,
  OriginalRow227TriangleData2038.coefficient211_257,
  OriginalRow227TriangleData2038.coefficient211_258,
  OriginalRow227TriangleData2038.coefficient211_259,
  OriginalRow227TriangleData2038.coefficient211_260,
  OriginalRow227TriangleData2038.coefficient211_261,
  OriginalRow227TriangleData2038.coefficient211_262,
  OriginalRow227TriangleData2038.coefficient211_263,
  OriginalRow227TriangleData2038.coefficient211_264,
  OriginalRow227TriangleData2038.coefficient211_265,
  OriginalRow227TriangleData2038.coefficient211_266,
  OriginalRow227TriangleData2038.coefficient211_267,
  OriginalRow227TriangleData2038.coefficient211_268,
  OriginalRow227TriangleData2038.coefficient211_269,
  OriginalRow227TriangleData2038.coefficient211_270,
  OriginalRow227TriangleData2038.coefficient211_271,
  OriginalRow227TriangleData2038.coefficient211_272,
  OriginalRow227TriangleData2038.coefficient211_273
]

theorem values2038_size : values2038.size = 32 := rfl

def block2038 : ℕ → Option IntervalDyadic := segment 242 values2038

theorem block2038_domain : ExactDomain block2038 242 274 := by
  simpa only [values2038_size] using segment_domain 242 values2038

theorem block2038_get (i : Fin 32) :
    block2038 (242 + i.val) = some (values2038[i.val]'(by rw [values2038_size]; exact i.isLt)) := by
  exact segment_get 242 values2038 ⟨i.val, by rw [values2038_size]; exact i.isLt⟩

def values2039 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2039.coefficient211_274,
  OriginalRow227TriangleData2039.coefficient211_275,
  OriginalRow227TriangleData2039.coefficient211_276,
  OriginalRow227TriangleData2039.coefficient211_277,
  OriginalRow227TriangleData2039.coefficient211_278,
  OriginalRow227TriangleData2039.coefficient211_279,
  OriginalRow227TriangleData2039.coefficient211_280,
  OriginalRow227TriangleData2039.coefficient211_281,
  OriginalRow227TriangleData2039.coefficient211_282,
  OriginalRow227TriangleData2039.coefficient211_283,
  OriginalRow227TriangleData2039.coefficient211_284,
  OriginalRow227TriangleData2039.coefficient211_285,
  OriginalRow227TriangleData2039.coefficient211_286,
  OriginalRow227TriangleData2039.coefficient211_287,
  OriginalRow227TriangleData2039.coefficient211_288,
  OriginalRow227TriangleData2039.coefficient211_289,
  OriginalRow227TriangleData2039.coefficient211_290
]

theorem values2039_size : values2039.size = 17 := rfl

def block2039 : ℕ → Option IntervalDyadic := segment 274 values2039

theorem block2039_domain : ExactDomain block2039 274 291 := by
  simpa only [values2039_size] using segment_domain 274 values2039

theorem block2039_get (i : Fin 17) :
    block2039 (274 + i.val) = some (values2039[i.val]'(by rw [values2039_size]; exact i.isLt)) := by
  exact segment_get 274 values2039 ⟨i.val, by rw [values2039_size]; exact i.isLt⟩

def node0242_0291 : ℕ → Option IntervalDyadic := split 274 block2038 block2039

theorem node0242_0291_domain : ExactDomain node0242_0291 242 291 := by
  exact split_domain (by decide) (by decide) block2038_domain block2039_domain

def node0210_0291 : ℕ → Option IntervalDyadic := split 242 block2037 node0242_0291

theorem node0210_0291_domain : ExactDomain node0210_0291 210 291 := by
  exact split_domain (by decide) (by decide) block2037_domain node0242_0291_domain

def lookup : ℕ → Option IntervalDyadic := node0210_0291

theorem lookup_domain : ExactDomain lookup 210 291 :=
  node0210_0291_domain

theorem block2037_lookup (i : Fin 32) :
    lookup (210 + i.val) = some (values2037[i.val]'(by rw [values2037_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0210_0291 (210 + i.val) = _
  rw [node0210_0291, split_left 242 block2037 node0242_0291 (by omega)]
  exact block2037_get i

theorem block2038_lookup (i : Fin 32) :
    lookup (242 + i.val) = some (values2038[i.val]'(by rw [values2038_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0210_0291 (242 + i.val) = _
  rw [node0210_0291, split_right 242 block2037 node0242_0291 (by omega)]
  rw [node0242_0291, split_left 274 block2038 block2039 (by omega)]
  exact block2038_get i

theorem block2039_lookup (i : Fin 17) :
    lookup (274 + i.val) = some (values2039[i.val]'(by rw [values2039_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0210_0291 (274 + i.val) = _
  rw [node0210_0291, split_right 242 block2037 node0242_0291 (by omega)]
  rw [node0242_0291, split_right 274 block2038 block2039 (by omega)]
  exact block2039_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2037_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2037_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2038_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2038_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2039_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2039_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2037_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2038_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow211.block2039_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow211
