import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2040
import Grothe.UpperChaos.OriginalRow227TriangleData2041
import Grothe.UpperChaos.OriginalRow227TriangleData2042

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow212

open ConditionalTableLookup

def values2040 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2040.coefficient212_211,
  OriginalRow227TriangleData2040.coefficient212_212,
  OriginalRow227TriangleData2040.coefficient212_213,
  OriginalRow227TriangleData2040.coefficient212_214,
  OriginalRow227TriangleData2040.coefficient212_215,
  OriginalRow227TriangleData2040.coefficient212_216,
  OriginalRow227TriangleData2040.coefficient212_217,
  OriginalRow227TriangleData2040.coefficient212_218,
  OriginalRow227TriangleData2040.coefficient212_219,
  OriginalRow227TriangleData2040.coefficient212_220,
  OriginalRow227TriangleData2040.coefficient212_221,
  OriginalRow227TriangleData2040.coefficient212_222,
  OriginalRow227TriangleData2040.coefficient212_223,
  OriginalRow227TriangleData2040.coefficient212_224,
  OriginalRow227TriangleData2040.coefficient212_225,
  OriginalRow227TriangleData2040.coefficient212_226,
  OriginalRow227TriangleData2040.coefficient212_227,
  OriginalRow227TriangleData2040.coefficient212_228,
  OriginalRow227TriangleData2040.coefficient212_229,
  OriginalRow227TriangleData2040.coefficient212_230,
  OriginalRow227TriangleData2040.coefficient212_231,
  OriginalRow227TriangleData2040.coefficient212_232,
  OriginalRow227TriangleData2040.coefficient212_233,
  OriginalRow227TriangleData2040.coefficient212_234,
  OriginalRow227TriangleData2040.coefficient212_235,
  OriginalRow227TriangleData2040.coefficient212_236,
  OriginalRow227TriangleData2040.coefficient212_237,
  OriginalRow227TriangleData2040.coefficient212_238,
  OriginalRow227TriangleData2040.coefficient212_239,
  OriginalRow227TriangleData2040.coefficient212_240,
  OriginalRow227TriangleData2040.coefficient212_241,
  OriginalRow227TriangleData2040.coefficient212_242
]

theorem values2040_size : values2040.size = 32 := rfl

def block2040 : ℕ → Option IntervalDyadic := segment 211 values2040

theorem block2040_domain : ExactDomain block2040 211 243 := by
  simpa only [values2040_size] using segment_domain 211 values2040

theorem block2040_get (i : Fin 32) :
    block2040 (211 + i.val) = some (values2040[i.val]'(by rw [values2040_size]; exact i.isLt)) := by
  exact segment_get 211 values2040 ⟨i.val, by rw [values2040_size]; exact i.isLt⟩

def values2041 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2041.coefficient212_243,
  OriginalRow227TriangleData2041.coefficient212_244,
  OriginalRow227TriangleData2041.coefficient212_245,
  OriginalRow227TriangleData2041.coefficient212_246,
  OriginalRow227TriangleData2041.coefficient212_247,
  OriginalRow227TriangleData2041.coefficient212_248,
  OriginalRow227TriangleData2041.coefficient212_249,
  OriginalRow227TriangleData2041.coefficient212_250,
  OriginalRow227TriangleData2041.coefficient212_251,
  OriginalRow227TriangleData2041.coefficient212_252,
  OriginalRow227TriangleData2041.coefficient212_253,
  OriginalRow227TriangleData2041.coefficient212_254,
  OriginalRow227TriangleData2041.coefficient212_255,
  OriginalRow227TriangleData2041.coefficient212_256,
  OriginalRow227TriangleData2041.coefficient212_257,
  OriginalRow227TriangleData2041.coefficient212_258,
  OriginalRow227TriangleData2041.coefficient212_259,
  OriginalRow227TriangleData2041.coefficient212_260,
  OriginalRow227TriangleData2041.coefficient212_261,
  OriginalRow227TriangleData2041.coefficient212_262,
  OriginalRow227TriangleData2041.coefficient212_263,
  OriginalRow227TriangleData2041.coefficient212_264,
  OriginalRow227TriangleData2041.coefficient212_265,
  OriginalRow227TriangleData2041.coefficient212_266,
  OriginalRow227TriangleData2041.coefficient212_267,
  OriginalRow227TriangleData2041.coefficient212_268,
  OriginalRow227TriangleData2041.coefficient212_269,
  OriginalRow227TriangleData2041.coefficient212_270,
  OriginalRow227TriangleData2041.coefficient212_271,
  OriginalRow227TriangleData2041.coefficient212_272,
  OriginalRow227TriangleData2041.coefficient212_273,
  OriginalRow227TriangleData2041.coefficient212_274
]

theorem values2041_size : values2041.size = 32 := rfl

def block2041 : ℕ → Option IntervalDyadic := segment 243 values2041

theorem block2041_domain : ExactDomain block2041 243 275 := by
  simpa only [values2041_size] using segment_domain 243 values2041

theorem block2041_get (i : Fin 32) :
    block2041 (243 + i.val) = some (values2041[i.val]'(by rw [values2041_size]; exact i.isLt)) := by
  exact segment_get 243 values2041 ⟨i.val, by rw [values2041_size]; exact i.isLt⟩

def values2042 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2042.coefficient212_275,
  OriginalRow227TriangleData2042.coefficient212_276,
  OriginalRow227TriangleData2042.coefficient212_277,
  OriginalRow227TriangleData2042.coefficient212_278,
  OriginalRow227TriangleData2042.coefficient212_279,
  OriginalRow227TriangleData2042.coefficient212_280,
  OriginalRow227TriangleData2042.coefficient212_281,
  OriginalRow227TriangleData2042.coefficient212_282,
  OriginalRow227TriangleData2042.coefficient212_283,
  OriginalRow227TriangleData2042.coefficient212_284,
  OriginalRow227TriangleData2042.coefficient212_285,
  OriginalRow227TriangleData2042.coefficient212_286,
  OriginalRow227TriangleData2042.coefficient212_287,
  OriginalRow227TriangleData2042.coefficient212_288,
  OriginalRow227TriangleData2042.coefficient212_289
]

theorem values2042_size : values2042.size = 15 := rfl

def block2042 : ℕ → Option IntervalDyadic := segment 275 values2042

theorem block2042_domain : ExactDomain block2042 275 290 := by
  simpa only [values2042_size] using segment_domain 275 values2042

theorem block2042_get (i : Fin 15) :
    block2042 (275 + i.val) = some (values2042[i.val]'(by rw [values2042_size]; exact i.isLt)) := by
  exact segment_get 275 values2042 ⟨i.val, by rw [values2042_size]; exact i.isLt⟩

def node0243_0290 : ℕ → Option IntervalDyadic := split 275 block2041 block2042

theorem node0243_0290_domain : ExactDomain node0243_0290 243 290 := by
  exact split_domain (by decide) (by decide) block2041_domain block2042_domain

def node0211_0290 : ℕ → Option IntervalDyadic := split 243 block2040 node0243_0290

theorem node0211_0290_domain : ExactDomain node0211_0290 211 290 := by
  exact split_domain (by decide) (by decide) block2040_domain node0243_0290_domain

def lookup : ℕ → Option IntervalDyadic := node0211_0290

theorem lookup_domain : ExactDomain lookup 211 290 :=
  node0211_0290_domain

theorem block2040_lookup (i : Fin 32) :
    lookup (211 + i.val) = some (values2040[i.val]'(by rw [values2040_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0211_0290 (211 + i.val) = _
  rw [node0211_0290, split_left 243 block2040 node0243_0290 (by omega)]
  exact block2040_get i

theorem block2041_lookup (i : Fin 32) :
    lookup (243 + i.val) = some (values2041[i.val]'(by rw [values2041_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0211_0290 (243 + i.val) = _
  rw [node0211_0290, split_right 243 block2040 node0243_0290 (by omega)]
  rw [node0243_0290, split_left 275 block2041 block2042 (by omega)]
  exact block2041_get i

theorem block2042_lookup (i : Fin 15) :
    lookup (275 + i.val) = some (values2042[i.val]'(by rw [values2042_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0211_0290 (275 + i.val) = _
  rw [node0211_0290, split_right 243 block2040 node0243_0290 (by omega)]
  rw [node0243_0290, split_right 275 block2041 block2042 (by omega)]
  exact block2042_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2040_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2040_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2041_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2041_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2042_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2042_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2040_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2041_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow212.block2042_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow212
