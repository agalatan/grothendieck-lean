import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2052
import Grothe.UpperChaos.OriginalRow227TriangleData2053
import Grothe.UpperChaos.OriginalRow227TriangleData2054

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow216

open ConditionalTableLookup

def values2052 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2052.coefficient216_215,
  OriginalRow227TriangleData2052.coefficient216_216,
  OriginalRow227TriangleData2052.coefficient216_217,
  OriginalRow227TriangleData2052.coefficient216_218,
  OriginalRow227TriangleData2052.coefficient216_219,
  OriginalRow227TriangleData2052.coefficient216_220,
  OriginalRow227TriangleData2052.coefficient216_221,
  OriginalRow227TriangleData2052.coefficient216_222,
  OriginalRow227TriangleData2052.coefficient216_223,
  OriginalRow227TriangleData2052.coefficient216_224,
  OriginalRow227TriangleData2052.coefficient216_225,
  OriginalRow227TriangleData2052.coefficient216_226,
  OriginalRow227TriangleData2052.coefficient216_227,
  OriginalRow227TriangleData2052.coefficient216_228,
  OriginalRow227TriangleData2052.coefficient216_229,
  OriginalRow227TriangleData2052.coefficient216_230,
  OriginalRow227TriangleData2052.coefficient216_231,
  OriginalRow227TriangleData2052.coefficient216_232,
  OriginalRow227TriangleData2052.coefficient216_233,
  OriginalRow227TriangleData2052.coefficient216_234,
  OriginalRow227TriangleData2052.coefficient216_235,
  OriginalRow227TriangleData2052.coefficient216_236,
  OriginalRow227TriangleData2052.coefficient216_237,
  OriginalRow227TriangleData2052.coefficient216_238,
  OriginalRow227TriangleData2052.coefficient216_239,
  OriginalRow227TriangleData2052.coefficient216_240,
  OriginalRow227TriangleData2052.coefficient216_241,
  OriginalRow227TriangleData2052.coefficient216_242,
  OriginalRow227TriangleData2052.coefficient216_243,
  OriginalRow227TriangleData2052.coefficient216_244,
  OriginalRow227TriangleData2052.coefficient216_245,
  OriginalRow227TriangleData2052.coefficient216_246
]

theorem values2052_size : values2052.size = 32 := rfl

def block2052 : ℕ → Option IntervalDyadic := segment 215 values2052

theorem block2052_domain : ExactDomain block2052 215 247 := by
  simpa only [values2052_size] using segment_domain 215 values2052

theorem block2052_get (i : Fin 32) :
    block2052 (215 + i.val) = some (values2052[i.val]'(by rw [values2052_size]; exact i.isLt)) := by
  exact segment_get 215 values2052 ⟨i.val, by rw [values2052_size]; exact i.isLt⟩

def values2053 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2053.coefficient216_247,
  OriginalRow227TriangleData2053.coefficient216_248,
  OriginalRow227TriangleData2053.coefficient216_249,
  OriginalRow227TriangleData2053.coefficient216_250,
  OriginalRow227TriangleData2053.coefficient216_251,
  OriginalRow227TriangleData2053.coefficient216_252,
  OriginalRow227TriangleData2053.coefficient216_253,
  OriginalRow227TriangleData2053.coefficient216_254,
  OriginalRow227TriangleData2053.coefficient216_255,
  OriginalRow227TriangleData2053.coefficient216_256,
  OriginalRow227TriangleData2053.coefficient216_257,
  OriginalRow227TriangleData2053.coefficient216_258,
  OriginalRow227TriangleData2053.coefficient216_259,
  OriginalRow227TriangleData2053.coefficient216_260,
  OriginalRow227TriangleData2053.coefficient216_261,
  OriginalRow227TriangleData2053.coefficient216_262,
  OriginalRow227TriangleData2053.coefficient216_263,
  OriginalRow227TriangleData2053.coefficient216_264,
  OriginalRow227TriangleData2053.coefficient216_265,
  OriginalRow227TriangleData2053.coefficient216_266,
  OriginalRow227TriangleData2053.coefficient216_267,
  OriginalRow227TriangleData2053.coefficient216_268,
  OriginalRow227TriangleData2053.coefficient216_269,
  OriginalRow227TriangleData2053.coefficient216_270,
  OriginalRow227TriangleData2053.coefficient216_271,
  OriginalRow227TriangleData2053.coefficient216_272,
  OriginalRow227TriangleData2053.coefficient216_273,
  OriginalRow227TriangleData2053.coefficient216_274,
  OriginalRow227TriangleData2053.coefficient216_275,
  OriginalRow227TriangleData2053.coefficient216_276,
  OriginalRow227TriangleData2053.coefficient216_277,
  OriginalRow227TriangleData2053.coefficient216_278
]

theorem values2053_size : values2053.size = 32 := rfl

def block2053 : ℕ → Option IntervalDyadic := segment 247 values2053

theorem block2053_domain : ExactDomain block2053 247 279 := by
  simpa only [values2053_size] using segment_domain 247 values2053

theorem block2053_get (i : Fin 32) :
    block2053 (247 + i.val) = some (values2053[i.val]'(by rw [values2053_size]; exact i.isLt)) := by
  exact segment_get 247 values2053 ⟨i.val, by rw [values2053_size]; exact i.isLt⟩

def values2054 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2054.coefficient216_279,
  OriginalRow227TriangleData2054.coefficient216_280,
  OriginalRow227TriangleData2054.coefficient216_281,
  OriginalRow227TriangleData2054.coefficient216_282,
  OriginalRow227TriangleData2054.coefficient216_283,
  OriginalRow227TriangleData2054.coefficient216_284,
  OriginalRow227TriangleData2054.coefficient216_285
]

theorem values2054_size : values2054.size = 7 := rfl

def block2054 : ℕ → Option IntervalDyadic := segment 279 values2054

theorem block2054_domain : ExactDomain block2054 279 286 := by
  simpa only [values2054_size] using segment_domain 279 values2054

theorem block2054_get (i : Fin 7) :
    block2054 (279 + i.val) = some (values2054[i.val]'(by rw [values2054_size]; exact i.isLt)) := by
  exact segment_get 279 values2054 ⟨i.val, by rw [values2054_size]; exact i.isLt⟩

def node0247_0286 : ℕ → Option IntervalDyadic := split 279 block2053 block2054

theorem node0247_0286_domain : ExactDomain node0247_0286 247 286 := by
  exact split_domain (by decide) (by decide) block2053_domain block2054_domain

def node0215_0286 : ℕ → Option IntervalDyadic := split 247 block2052 node0247_0286

theorem node0215_0286_domain : ExactDomain node0215_0286 215 286 := by
  exact split_domain (by decide) (by decide) block2052_domain node0247_0286_domain

def lookup : ℕ → Option IntervalDyadic := node0215_0286

theorem lookup_domain : ExactDomain lookup 215 286 :=
  node0215_0286_domain

theorem block2052_lookup (i : Fin 32) :
    lookup (215 + i.val) = some (values2052[i.val]'(by rw [values2052_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0215_0286 (215 + i.val) = _
  rw [node0215_0286, split_left 247 block2052 node0247_0286 (by omega)]
  exact block2052_get i

theorem block2053_lookup (i : Fin 32) :
    lookup (247 + i.val) = some (values2053[i.val]'(by rw [values2053_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0215_0286 (247 + i.val) = _
  rw [node0215_0286, split_right 247 block2052 node0247_0286 (by omega)]
  rw [node0247_0286, split_left 279 block2053 block2054 (by omega)]
  exact block2053_get i

theorem block2054_lookup (i : Fin 7) :
    lookup (279 + i.val) = some (values2054[i.val]'(by rw [values2054_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0215_0286 (279 + i.val) = _
  rw [node0215_0286, split_right 247 block2052 node0247_0286 (by omega)]
  rw [node0247_0286, split_right 279 block2053 block2054 (by omega)]
  exact block2054_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2052_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2052_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2053_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2053_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2054_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2054_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2052_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2053_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow216.block2054_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow216
