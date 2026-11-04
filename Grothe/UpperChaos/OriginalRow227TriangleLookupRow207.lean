import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2025
import Grothe.UpperChaos.OriginalRow227TriangleData2026
import Grothe.UpperChaos.OriginalRow227TriangleData2027

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow207

open ConditionalTableLookup

def values2025 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2025.coefficient207_206,
  OriginalRow227TriangleData2025.coefficient207_207,
  OriginalRow227TriangleData2025.coefficient207_208,
  OriginalRow227TriangleData2025.coefficient207_209,
  OriginalRow227TriangleData2025.coefficient207_210,
  OriginalRow227TriangleData2025.coefficient207_211,
  OriginalRow227TriangleData2025.coefficient207_212,
  OriginalRow227TriangleData2025.coefficient207_213,
  OriginalRow227TriangleData2025.coefficient207_214,
  OriginalRow227TriangleData2025.coefficient207_215,
  OriginalRow227TriangleData2025.coefficient207_216,
  OriginalRow227TriangleData2025.coefficient207_217,
  OriginalRow227TriangleData2025.coefficient207_218,
  OriginalRow227TriangleData2025.coefficient207_219,
  OriginalRow227TriangleData2025.coefficient207_220,
  OriginalRow227TriangleData2025.coefficient207_221,
  OriginalRow227TriangleData2025.coefficient207_222,
  OriginalRow227TriangleData2025.coefficient207_223,
  OriginalRow227TriangleData2025.coefficient207_224,
  OriginalRow227TriangleData2025.coefficient207_225,
  OriginalRow227TriangleData2025.coefficient207_226,
  OriginalRow227TriangleData2025.coefficient207_227,
  OriginalRow227TriangleData2025.coefficient207_228,
  OriginalRow227TriangleData2025.coefficient207_229,
  OriginalRow227TriangleData2025.coefficient207_230,
  OriginalRow227TriangleData2025.coefficient207_231,
  OriginalRow227TriangleData2025.coefficient207_232,
  OriginalRow227TriangleData2025.coefficient207_233,
  OriginalRow227TriangleData2025.coefficient207_234,
  OriginalRow227TriangleData2025.coefficient207_235,
  OriginalRow227TriangleData2025.coefficient207_236,
  OriginalRow227TriangleData2025.coefficient207_237
]

theorem values2025_size : values2025.size = 32 := rfl

def block2025 : ℕ → Option IntervalDyadic := segment 206 values2025

theorem block2025_domain : ExactDomain block2025 206 238 := by
  simpa only [values2025_size] using segment_domain 206 values2025

theorem block2025_get (i : Fin 32) :
    block2025 (206 + i.val) = some (values2025[i.val]'(by rw [values2025_size]; exact i.isLt)) := by
  exact segment_get 206 values2025 ⟨i.val, by rw [values2025_size]; exact i.isLt⟩

def values2026 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2026.coefficient207_238,
  OriginalRow227TriangleData2026.coefficient207_239,
  OriginalRow227TriangleData2026.coefficient207_240,
  OriginalRow227TriangleData2026.coefficient207_241,
  OriginalRow227TriangleData2026.coefficient207_242,
  OriginalRow227TriangleData2026.coefficient207_243,
  OriginalRow227TriangleData2026.coefficient207_244,
  OriginalRow227TriangleData2026.coefficient207_245,
  OriginalRow227TriangleData2026.coefficient207_246,
  OriginalRow227TriangleData2026.coefficient207_247,
  OriginalRow227TriangleData2026.coefficient207_248,
  OriginalRow227TriangleData2026.coefficient207_249,
  OriginalRow227TriangleData2026.coefficient207_250,
  OriginalRow227TriangleData2026.coefficient207_251,
  OriginalRow227TriangleData2026.coefficient207_252,
  OriginalRow227TriangleData2026.coefficient207_253,
  OriginalRow227TriangleData2026.coefficient207_254,
  OriginalRow227TriangleData2026.coefficient207_255,
  OriginalRow227TriangleData2026.coefficient207_256,
  OriginalRow227TriangleData2026.coefficient207_257,
  OriginalRow227TriangleData2026.coefficient207_258,
  OriginalRow227TriangleData2026.coefficient207_259,
  OriginalRow227TriangleData2026.coefficient207_260,
  OriginalRow227TriangleData2026.coefficient207_261,
  OriginalRow227TriangleData2026.coefficient207_262,
  OriginalRow227TriangleData2026.coefficient207_263,
  OriginalRow227TriangleData2026.coefficient207_264,
  OriginalRow227TriangleData2026.coefficient207_265,
  OriginalRow227TriangleData2026.coefficient207_266,
  OriginalRow227TriangleData2026.coefficient207_267,
  OriginalRow227TriangleData2026.coefficient207_268,
  OriginalRow227TriangleData2026.coefficient207_269
]

theorem values2026_size : values2026.size = 32 := rfl

def block2026 : ℕ → Option IntervalDyadic := segment 238 values2026

theorem block2026_domain : ExactDomain block2026 238 270 := by
  simpa only [values2026_size] using segment_domain 238 values2026

theorem block2026_get (i : Fin 32) :
    block2026 (238 + i.val) = some (values2026[i.val]'(by rw [values2026_size]; exact i.isLt)) := by
  exact segment_get 238 values2026 ⟨i.val, by rw [values2026_size]; exact i.isLt⟩

def values2027 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2027.coefficient207_270,
  OriginalRow227TriangleData2027.coefficient207_271,
  OriginalRow227TriangleData2027.coefficient207_272,
  OriginalRow227TriangleData2027.coefficient207_273,
  OriginalRow227TriangleData2027.coefficient207_274,
  OriginalRow227TriangleData2027.coefficient207_275,
  OriginalRow227TriangleData2027.coefficient207_276,
  OriginalRow227TriangleData2027.coefficient207_277,
  OriginalRow227TriangleData2027.coefficient207_278,
  OriginalRow227TriangleData2027.coefficient207_279,
  OriginalRow227TriangleData2027.coefficient207_280,
  OriginalRow227TriangleData2027.coefficient207_281,
  OriginalRow227TriangleData2027.coefficient207_282,
  OriginalRow227TriangleData2027.coefficient207_283,
  OriginalRow227TriangleData2027.coefficient207_284,
  OriginalRow227TriangleData2027.coefficient207_285,
  OriginalRow227TriangleData2027.coefficient207_286,
  OriginalRow227TriangleData2027.coefficient207_287,
  OriginalRow227TriangleData2027.coefficient207_288,
  OriginalRow227TriangleData2027.coefficient207_289,
  OriginalRow227TriangleData2027.coefficient207_290,
  OriginalRow227TriangleData2027.coefficient207_291,
  OriginalRow227TriangleData2027.coefficient207_292,
  OriginalRow227TriangleData2027.coefficient207_293,
  OriginalRow227TriangleData2027.coefficient207_294
]

theorem values2027_size : values2027.size = 25 := rfl

def block2027 : ℕ → Option IntervalDyadic := segment 270 values2027

theorem block2027_domain : ExactDomain block2027 270 295 := by
  simpa only [values2027_size] using segment_domain 270 values2027

theorem block2027_get (i : Fin 25) :
    block2027 (270 + i.val) = some (values2027[i.val]'(by rw [values2027_size]; exact i.isLt)) := by
  exact segment_get 270 values2027 ⟨i.val, by rw [values2027_size]; exact i.isLt⟩

def node0238_0295 : ℕ → Option IntervalDyadic := split 270 block2026 block2027

theorem node0238_0295_domain : ExactDomain node0238_0295 238 295 := by
  exact split_domain (by decide) (by decide) block2026_domain block2027_domain

def node0206_0295 : ℕ → Option IntervalDyadic := split 238 block2025 node0238_0295

theorem node0206_0295_domain : ExactDomain node0206_0295 206 295 := by
  exact split_domain (by decide) (by decide) block2025_domain node0238_0295_domain

def lookup : ℕ → Option IntervalDyadic := node0206_0295

theorem lookup_domain : ExactDomain lookup 206 295 :=
  node0206_0295_domain

theorem block2025_lookup (i : Fin 32) :
    lookup (206 + i.val) = some (values2025[i.val]'(by rw [values2025_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0206_0295 (206 + i.val) = _
  rw [node0206_0295, split_left 238 block2025 node0238_0295 (by omega)]
  exact block2025_get i

theorem block2026_lookup (i : Fin 32) :
    lookup (238 + i.val) = some (values2026[i.val]'(by rw [values2026_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0206_0295 (238 + i.val) = _
  rw [node0206_0295, split_right 238 block2025 node0238_0295 (by omega)]
  rw [node0238_0295, split_left 270 block2026 block2027 (by omega)]
  exact block2026_get i

theorem block2027_lookup (i : Fin 25) :
    lookup (270 + i.val) = some (values2027[i.val]'(by rw [values2027_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0206_0295 (270 + i.val) = _
  rw [node0206_0295, split_right 238 block2025 node0238_0295 (by omega)]
  rw [node0238_0295, split_right 270 block2026 block2027 (by omega)]
  exact block2027_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2025_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2025_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2026_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2026_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2027_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2027_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2025_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2026_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow207.block2027_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow207
