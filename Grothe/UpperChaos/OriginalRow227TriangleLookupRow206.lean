import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2022
import Grothe.UpperChaos.OriginalRow227TriangleData2023
import Grothe.UpperChaos.OriginalRow227TriangleData2024

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow206

open ConditionalTableLookup

def values2022 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2022.coefficient206_205,
  OriginalRow227TriangleData2022.coefficient206_206,
  OriginalRow227TriangleData2022.coefficient206_207,
  OriginalRow227TriangleData2022.coefficient206_208,
  OriginalRow227TriangleData2022.coefficient206_209,
  OriginalRow227TriangleData2022.coefficient206_210,
  OriginalRow227TriangleData2022.coefficient206_211,
  OriginalRow227TriangleData2022.coefficient206_212,
  OriginalRow227TriangleData2022.coefficient206_213,
  OriginalRow227TriangleData2022.coefficient206_214,
  OriginalRow227TriangleData2022.coefficient206_215,
  OriginalRow227TriangleData2022.coefficient206_216,
  OriginalRow227TriangleData2022.coefficient206_217,
  OriginalRow227TriangleData2022.coefficient206_218,
  OriginalRow227TriangleData2022.coefficient206_219,
  OriginalRow227TriangleData2022.coefficient206_220,
  OriginalRow227TriangleData2022.coefficient206_221,
  OriginalRow227TriangleData2022.coefficient206_222,
  OriginalRow227TriangleData2022.coefficient206_223,
  OriginalRow227TriangleData2022.coefficient206_224,
  OriginalRow227TriangleData2022.coefficient206_225,
  OriginalRow227TriangleData2022.coefficient206_226,
  OriginalRow227TriangleData2022.coefficient206_227,
  OriginalRow227TriangleData2022.coefficient206_228,
  OriginalRow227TriangleData2022.coefficient206_229,
  OriginalRow227TriangleData2022.coefficient206_230,
  OriginalRow227TriangleData2022.coefficient206_231,
  OriginalRow227TriangleData2022.coefficient206_232,
  OriginalRow227TriangleData2022.coefficient206_233,
  OriginalRow227TriangleData2022.coefficient206_234,
  OriginalRow227TriangleData2022.coefficient206_235,
  OriginalRow227TriangleData2022.coefficient206_236
]

theorem values2022_size : values2022.size = 32 := rfl

def block2022 : ℕ → Option IntervalDyadic := segment 205 values2022

theorem block2022_domain : ExactDomain block2022 205 237 := by
  simpa only [values2022_size] using segment_domain 205 values2022

theorem block2022_get (i : Fin 32) :
    block2022 (205 + i.val) = some (values2022[i.val]'(by rw [values2022_size]; exact i.isLt)) := by
  exact segment_get 205 values2022 ⟨i.val, by rw [values2022_size]; exact i.isLt⟩

def values2023 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2023.coefficient206_237,
  OriginalRow227TriangleData2023.coefficient206_238,
  OriginalRow227TriangleData2023.coefficient206_239,
  OriginalRow227TriangleData2023.coefficient206_240,
  OriginalRow227TriangleData2023.coefficient206_241,
  OriginalRow227TriangleData2023.coefficient206_242,
  OriginalRow227TriangleData2023.coefficient206_243,
  OriginalRow227TriangleData2023.coefficient206_244,
  OriginalRow227TriangleData2023.coefficient206_245,
  OriginalRow227TriangleData2023.coefficient206_246,
  OriginalRow227TriangleData2023.coefficient206_247,
  OriginalRow227TriangleData2023.coefficient206_248,
  OriginalRow227TriangleData2023.coefficient206_249,
  OriginalRow227TriangleData2023.coefficient206_250,
  OriginalRow227TriangleData2023.coefficient206_251,
  OriginalRow227TriangleData2023.coefficient206_252,
  OriginalRow227TriangleData2023.coefficient206_253,
  OriginalRow227TriangleData2023.coefficient206_254,
  OriginalRow227TriangleData2023.coefficient206_255,
  OriginalRow227TriangleData2023.coefficient206_256,
  OriginalRow227TriangleData2023.coefficient206_257,
  OriginalRow227TriangleData2023.coefficient206_258,
  OriginalRow227TriangleData2023.coefficient206_259,
  OriginalRow227TriangleData2023.coefficient206_260,
  OriginalRow227TriangleData2023.coefficient206_261,
  OriginalRow227TriangleData2023.coefficient206_262,
  OriginalRow227TriangleData2023.coefficient206_263,
  OriginalRow227TriangleData2023.coefficient206_264,
  OriginalRow227TriangleData2023.coefficient206_265,
  OriginalRow227TriangleData2023.coefficient206_266,
  OriginalRow227TriangleData2023.coefficient206_267,
  OriginalRow227TriangleData2023.coefficient206_268
]

theorem values2023_size : values2023.size = 32 := rfl

def block2023 : ℕ → Option IntervalDyadic := segment 237 values2023

theorem block2023_domain : ExactDomain block2023 237 269 := by
  simpa only [values2023_size] using segment_domain 237 values2023

theorem block2023_get (i : Fin 32) :
    block2023 (237 + i.val) = some (values2023[i.val]'(by rw [values2023_size]; exact i.isLt)) := by
  exact segment_get 237 values2023 ⟨i.val, by rw [values2023_size]; exact i.isLt⟩

def values2024 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2024.coefficient206_269,
  OriginalRow227TriangleData2024.coefficient206_270,
  OriginalRow227TriangleData2024.coefficient206_271,
  OriginalRow227TriangleData2024.coefficient206_272,
  OriginalRow227TriangleData2024.coefficient206_273,
  OriginalRow227TriangleData2024.coefficient206_274,
  OriginalRow227TriangleData2024.coefficient206_275,
  OriginalRow227TriangleData2024.coefficient206_276,
  OriginalRow227TriangleData2024.coefficient206_277,
  OriginalRow227TriangleData2024.coefficient206_278,
  OriginalRow227TriangleData2024.coefficient206_279,
  OriginalRow227TriangleData2024.coefficient206_280,
  OriginalRow227TriangleData2024.coefficient206_281,
  OriginalRow227TriangleData2024.coefficient206_282,
  OriginalRow227TriangleData2024.coefficient206_283,
  OriginalRow227TriangleData2024.coefficient206_284,
  OriginalRow227TriangleData2024.coefficient206_285,
  OriginalRow227TriangleData2024.coefficient206_286,
  OriginalRow227TriangleData2024.coefficient206_287,
  OriginalRow227TriangleData2024.coefficient206_288,
  OriginalRow227TriangleData2024.coefficient206_289,
  OriginalRow227TriangleData2024.coefficient206_290,
  OriginalRow227TriangleData2024.coefficient206_291,
  OriginalRow227TriangleData2024.coefficient206_292,
  OriginalRow227TriangleData2024.coefficient206_293,
  OriginalRow227TriangleData2024.coefficient206_294,
  OriginalRow227TriangleData2024.coefficient206_295
]

theorem values2024_size : values2024.size = 27 := rfl

def block2024 : ℕ → Option IntervalDyadic := segment 269 values2024

theorem block2024_domain : ExactDomain block2024 269 296 := by
  simpa only [values2024_size] using segment_domain 269 values2024

theorem block2024_get (i : Fin 27) :
    block2024 (269 + i.val) = some (values2024[i.val]'(by rw [values2024_size]; exact i.isLt)) := by
  exact segment_get 269 values2024 ⟨i.val, by rw [values2024_size]; exact i.isLt⟩

def node0237_0296 : ℕ → Option IntervalDyadic := split 269 block2023 block2024

theorem node0237_0296_domain : ExactDomain node0237_0296 237 296 := by
  exact split_domain (by decide) (by decide) block2023_domain block2024_domain

def node0205_0296 : ℕ → Option IntervalDyadic := split 237 block2022 node0237_0296

theorem node0205_0296_domain : ExactDomain node0205_0296 205 296 := by
  exact split_domain (by decide) (by decide) block2022_domain node0237_0296_domain

def lookup : ℕ → Option IntervalDyadic := node0205_0296

theorem lookup_domain : ExactDomain lookup 205 296 :=
  node0205_0296_domain

theorem block2022_lookup (i : Fin 32) :
    lookup (205 + i.val) = some (values2022[i.val]'(by rw [values2022_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0205_0296 (205 + i.val) = _
  rw [node0205_0296, split_left 237 block2022 node0237_0296 (by omega)]
  exact block2022_get i

theorem block2023_lookup (i : Fin 32) :
    lookup (237 + i.val) = some (values2023[i.val]'(by rw [values2023_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0205_0296 (237 + i.val) = _
  rw [node0205_0296, split_right 237 block2022 node0237_0296 (by omega)]
  rw [node0237_0296, split_left 269 block2023 block2024 (by omega)]
  exact block2023_get i

theorem block2024_lookup (i : Fin 27) :
    lookup (269 + i.val) = some (values2024[i.val]'(by rw [values2024_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0205_0296 (269 + i.val) = _
  rw [node0205_0296, split_right 237 block2022 node0237_0296 (by omega)]
  rw [node0237_0296, split_right 269 block2023 block2024 (by omega)]
  exact block2024_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2022_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2022_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2023_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2023_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2024_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2024_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2022_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2023_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow206.block2024_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow206
