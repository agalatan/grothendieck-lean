import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2043
import Grothe.UpperChaos.OriginalRow227TriangleData2044
import Grothe.UpperChaos.OriginalRow227TriangleData2045

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow213

open ConditionalTableLookup

def values2043 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2043.coefficient213_212,
  OriginalRow227TriangleData2043.coefficient213_213,
  OriginalRow227TriangleData2043.coefficient213_214,
  OriginalRow227TriangleData2043.coefficient213_215,
  OriginalRow227TriangleData2043.coefficient213_216,
  OriginalRow227TriangleData2043.coefficient213_217,
  OriginalRow227TriangleData2043.coefficient213_218,
  OriginalRow227TriangleData2043.coefficient213_219,
  OriginalRow227TriangleData2043.coefficient213_220,
  OriginalRow227TriangleData2043.coefficient213_221,
  OriginalRow227TriangleData2043.coefficient213_222,
  OriginalRow227TriangleData2043.coefficient213_223,
  OriginalRow227TriangleData2043.coefficient213_224,
  OriginalRow227TriangleData2043.coefficient213_225,
  OriginalRow227TriangleData2043.coefficient213_226,
  OriginalRow227TriangleData2043.coefficient213_227,
  OriginalRow227TriangleData2043.coefficient213_228,
  OriginalRow227TriangleData2043.coefficient213_229,
  OriginalRow227TriangleData2043.coefficient213_230,
  OriginalRow227TriangleData2043.coefficient213_231,
  OriginalRow227TriangleData2043.coefficient213_232,
  OriginalRow227TriangleData2043.coefficient213_233,
  OriginalRow227TriangleData2043.coefficient213_234,
  OriginalRow227TriangleData2043.coefficient213_235,
  OriginalRow227TriangleData2043.coefficient213_236,
  OriginalRow227TriangleData2043.coefficient213_237,
  OriginalRow227TriangleData2043.coefficient213_238,
  OriginalRow227TriangleData2043.coefficient213_239,
  OriginalRow227TriangleData2043.coefficient213_240,
  OriginalRow227TriangleData2043.coefficient213_241,
  OriginalRow227TriangleData2043.coefficient213_242,
  OriginalRow227TriangleData2043.coefficient213_243
]

theorem values2043_size : values2043.size = 32 := rfl

def block2043 : ℕ → Option IntervalDyadic := segment 212 values2043

theorem block2043_domain : ExactDomain block2043 212 244 := by
  simpa only [values2043_size] using segment_domain 212 values2043

theorem block2043_get (i : Fin 32) :
    block2043 (212 + i.val) = some (values2043[i.val]'(by rw [values2043_size]; exact i.isLt)) := by
  exact segment_get 212 values2043 ⟨i.val, by rw [values2043_size]; exact i.isLt⟩

def values2044 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2044.coefficient213_244,
  OriginalRow227TriangleData2044.coefficient213_245,
  OriginalRow227TriangleData2044.coefficient213_246,
  OriginalRow227TriangleData2044.coefficient213_247,
  OriginalRow227TriangleData2044.coefficient213_248,
  OriginalRow227TriangleData2044.coefficient213_249,
  OriginalRow227TriangleData2044.coefficient213_250,
  OriginalRow227TriangleData2044.coefficient213_251,
  OriginalRow227TriangleData2044.coefficient213_252,
  OriginalRow227TriangleData2044.coefficient213_253,
  OriginalRow227TriangleData2044.coefficient213_254,
  OriginalRow227TriangleData2044.coefficient213_255,
  OriginalRow227TriangleData2044.coefficient213_256,
  OriginalRow227TriangleData2044.coefficient213_257,
  OriginalRow227TriangleData2044.coefficient213_258,
  OriginalRow227TriangleData2044.coefficient213_259,
  OriginalRow227TriangleData2044.coefficient213_260,
  OriginalRow227TriangleData2044.coefficient213_261,
  OriginalRow227TriangleData2044.coefficient213_262,
  OriginalRow227TriangleData2044.coefficient213_263,
  OriginalRow227TriangleData2044.coefficient213_264,
  OriginalRow227TriangleData2044.coefficient213_265,
  OriginalRow227TriangleData2044.coefficient213_266,
  OriginalRow227TriangleData2044.coefficient213_267,
  OriginalRow227TriangleData2044.coefficient213_268,
  OriginalRow227TriangleData2044.coefficient213_269,
  OriginalRow227TriangleData2044.coefficient213_270,
  OriginalRow227TriangleData2044.coefficient213_271,
  OriginalRow227TriangleData2044.coefficient213_272,
  OriginalRow227TriangleData2044.coefficient213_273,
  OriginalRow227TriangleData2044.coefficient213_274,
  OriginalRow227TriangleData2044.coefficient213_275
]

theorem values2044_size : values2044.size = 32 := rfl

def block2044 : ℕ → Option IntervalDyadic := segment 244 values2044

theorem block2044_domain : ExactDomain block2044 244 276 := by
  simpa only [values2044_size] using segment_domain 244 values2044

theorem block2044_get (i : Fin 32) :
    block2044 (244 + i.val) = some (values2044[i.val]'(by rw [values2044_size]; exact i.isLt)) := by
  exact segment_get 244 values2044 ⟨i.val, by rw [values2044_size]; exact i.isLt⟩

def values2045 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2045.coefficient213_276,
  OriginalRow227TriangleData2045.coefficient213_277,
  OriginalRow227TriangleData2045.coefficient213_278,
  OriginalRow227TriangleData2045.coefficient213_279,
  OriginalRow227TriangleData2045.coefficient213_280,
  OriginalRow227TriangleData2045.coefficient213_281,
  OriginalRow227TriangleData2045.coefficient213_282,
  OriginalRow227TriangleData2045.coefficient213_283,
  OriginalRow227TriangleData2045.coefficient213_284,
  OriginalRow227TriangleData2045.coefficient213_285,
  OriginalRow227TriangleData2045.coefficient213_286,
  OriginalRow227TriangleData2045.coefficient213_287,
  OriginalRow227TriangleData2045.coefficient213_288
]

theorem values2045_size : values2045.size = 13 := rfl

def block2045 : ℕ → Option IntervalDyadic := segment 276 values2045

theorem block2045_domain : ExactDomain block2045 276 289 := by
  simpa only [values2045_size] using segment_domain 276 values2045

theorem block2045_get (i : Fin 13) :
    block2045 (276 + i.val) = some (values2045[i.val]'(by rw [values2045_size]; exact i.isLt)) := by
  exact segment_get 276 values2045 ⟨i.val, by rw [values2045_size]; exact i.isLt⟩

def node0244_0289 : ℕ → Option IntervalDyadic := split 276 block2044 block2045

theorem node0244_0289_domain : ExactDomain node0244_0289 244 289 := by
  exact split_domain (by decide) (by decide) block2044_domain block2045_domain

def node0212_0289 : ℕ → Option IntervalDyadic := split 244 block2043 node0244_0289

theorem node0212_0289_domain : ExactDomain node0212_0289 212 289 := by
  exact split_domain (by decide) (by decide) block2043_domain node0244_0289_domain

def lookup : ℕ → Option IntervalDyadic := node0212_0289

theorem lookup_domain : ExactDomain lookup 212 289 :=
  node0212_0289_domain

theorem block2043_lookup (i : Fin 32) :
    lookup (212 + i.val) = some (values2043[i.val]'(by rw [values2043_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0212_0289 (212 + i.val) = _
  rw [node0212_0289, split_left 244 block2043 node0244_0289 (by omega)]
  exact block2043_get i

theorem block2044_lookup (i : Fin 32) :
    lookup (244 + i.val) = some (values2044[i.val]'(by rw [values2044_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0212_0289 (244 + i.val) = _
  rw [node0212_0289, split_right 244 block2043 node0244_0289 (by omega)]
  rw [node0244_0289, split_left 276 block2044 block2045 (by omega)]
  exact block2044_get i

theorem block2045_lookup (i : Fin 13) :
    lookup (276 + i.val) = some (values2045[i.val]'(by rw [values2045_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0212_0289 (276 + i.val) = _
  rw [node0212_0289, split_right 244 block2043 node0244_0289 (by omega)]
  rw [node0244_0289, split_right 276 block2044 block2045 (by omega)]
  exact block2045_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2043_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2043_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2044_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2044_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2045_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2045_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2043_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2044_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow213.block2045_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow213
