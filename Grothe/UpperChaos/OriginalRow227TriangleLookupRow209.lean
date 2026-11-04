import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2031
import Grothe.UpperChaos.OriginalRow227TriangleData2032
import Grothe.UpperChaos.OriginalRow227TriangleData2033

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow209

open ConditionalTableLookup

def values2031 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2031.coefficient209_208,
  OriginalRow227TriangleData2031.coefficient209_209,
  OriginalRow227TriangleData2031.coefficient209_210,
  OriginalRow227TriangleData2031.coefficient209_211,
  OriginalRow227TriangleData2031.coefficient209_212,
  OriginalRow227TriangleData2031.coefficient209_213,
  OriginalRow227TriangleData2031.coefficient209_214,
  OriginalRow227TriangleData2031.coefficient209_215,
  OriginalRow227TriangleData2031.coefficient209_216,
  OriginalRow227TriangleData2031.coefficient209_217,
  OriginalRow227TriangleData2031.coefficient209_218,
  OriginalRow227TriangleData2031.coefficient209_219,
  OriginalRow227TriangleData2031.coefficient209_220,
  OriginalRow227TriangleData2031.coefficient209_221,
  OriginalRow227TriangleData2031.coefficient209_222,
  OriginalRow227TriangleData2031.coefficient209_223,
  OriginalRow227TriangleData2031.coefficient209_224,
  OriginalRow227TriangleData2031.coefficient209_225,
  OriginalRow227TriangleData2031.coefficient209_226,
  OriginalRow227TriangleData2031.coefficient209_227,
  OriginalRow227TriangleData2031.coefficient209_228,
  OriginalRow227TriangleData2031.coefficient209_229,
  OriginalRow227TriangleData2031.coefficient209_230,
  OriginalRow227TriangleData2031.coefficient209_231,
  OriginalRow227TriangleData2031.coefficient209_232,
  OriginalRow227TriangleData2031.coefficient209_233,
  OriginalRow227TriangleData2031.coefficient209_234,
  OriginalRow227TriangleData2031.coefficient209_235,
  OriginalRow227TriangleData2031.coefficient209_236,
  OriginalRow227TriangleData2031.coefficient209_237,
  OriginalRow227TriangleData2031.coefficient209_238,
  OriginalRow227TriangleData2031.coefficient209_239
]

theorem values2031_size : values2031.size = 32 := rfl

def block2031 : ℕ → Option IntervalDyadic := segment 208 values2031

theorem block2031_domain : ExactDomain block2031 208 240 := by
  simpa only [values2031_size] using segment_domain 208 values2031

theorem block2031_get (i : Fin 32) :
    block2031 (208 + i.val) = some (values2031[i.val]'(by rw [values2031_size]; exact i.isLt)) := by
  exact segment_get 208 values2031 ⟨i.val, by rw [values2031_size]; exact i.isLt⟩

def values2032 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2032.coefficient209_240,
  OriginalRow227TriangleData2032.coefficient209_241,
  OriginalRow227TriangleData2032.coefficient209_242,
  OriginalRow227TriangleData2032.coefficient209_243,
  OriginalRow227TriangleData2032.coefficient209_244,
  OriginalRow227TriangleData2032.coefficient209_245,
  OriginalRow227TriangleData2032.coefficient209_246,
  OriginalRow227TriangleData2032.coefficient209_247,
  OriginalRow227TriangleData2032.coefficient209_248,
  OriginalRow227TriangleData2032.coefficient209_249,
  OriginalRow227TriangleData2032.coefficient209_250,
  OriginalRow227TriangleData2032.coefficient209_251,
  OriginalRow227TriangleData2032.coefficient209_252,
  OriginalRow227TriangleData2032.coefficient209_253,
  OriginalRow227TriangleData2032.coefficient209_254,
  OriginalRow227TriangleData2032.coefficient209_255,
  OriginalRow227TriangleData2032.coefficient209_256,
  OriginalRow227TriangleData2032.coefficient209_257,
  OriginalRow227TriangleData2032.coefficient209_258,
  OriginalRow227TriangleData2032.coefficient209_259,
  OriginalRow227TriangleData2032.coefficient209_260,
  OriginalRow227TriangleData2032.coefficient209_261,
  OriginalRow227TriangleData2032.coefficient209_262,
  OriginalRow227TriangleData2032.coefficient209_263,
  OriginalRow227TriangleData2032.coefficient209_264,
  OriginalRow227TriangleData2032.coefficient209_265,
  OriginalRow227TriangleData2032.coefficient209_266,
  OriginalRow227TriangleData2032.coefficient209_267,
  OriginalRow227TriangleData2032.coefficient209_268,
  OriginalRow227TriangleData2032.coefficient209_269,
  OriginalRow227TriangleData2032.coefficient209_270,
  OriginalRow227TriangleData2032.coefficient209_271
]

theorem values2032_size : values2032.size = 32 := rfl

def block2032 : ℕ → Option IntervalDyadic := segment 240 values2032

theorem block2032_domain : ExactDomain block2032 240 272 := by
  simpa only [values2032_size] using segment_domain 240 values2032

theorem block2032_get (i : Fin 32) :
    block2032 (240 + i.val) = some (values2032[i.val]'(by rw [values2032_size]; exact i.isLt)) := by
  exact segment_get 240 values2032 ⟨i.val, by rw [values2032_size]; exact i.isLt⟩

def values2033 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2033.coefficient209_272,
  OriginalRow227TriangleData2033.coefficient209_273,
  OriginalRow227TriangleData2033.coefficient209_274,
  OriginalRow227TriangleData2033.coefficient209_275,
  OriginalRow227TriangleData2033.coefficient209_276,
  OriginalRow227TriangleData2033.coefficient209_277,
  OriginalRow227TriangleData2033.coefficient209_278,
  OriginalRow227TriangleData2033.coefficient209_279,
  OriginalRow227TriangleData2033.coefficient209_280,
  OriginalRow227TriangleData2033.coefficient209_281,
  OriginalRow227TriangleData2033.coefficient209_282,
  OriginalRow227TriangleData2033.coefficient209_283,
  OriginalRow227TriangleData2033.coefficient209_284,
  OriginalRow227TriangleData2033.coefficient209_285,
  OriginalRow227TriangleData2033.coefficient209_286,
  OriginalRow227TriangleData2033.coefficient209_287,
  OriginalRow227TriangleData2033.coefficient209_288,
  OriginalRow227TriangleData2033.coefficient209_289,
  OriginalRow227TriangleData2033.coefficient209_290,
  OriginalRow227TriangleData2033.coefficient209_291,
  OriginalRow227TriangleData2033.coefficient209_292
]

theorem values2033_size : values2033.size = 21 := rfl

def block2033 : ℕ → Option IntervalDyadic := segment 272 values2033

theorem block2033_domain : ExactDomain block2033 272 293 := by
  simpa only [values2033_size] using segment_domain 272 values2033

theorem block2033_get (i : Fin 21) :
    block2033 (272 + i.val) = some (values2033[i.val]'(by rw [values2033_size]; exact i.isLt)) := by
  exact segment_get 272 values2033 ⟨i.val, by rw [values2033_size]; exact i.isLt⟩

def node0240_0293 : ℕ → Option IntervalDyadic := split 272 block2032 block2033

theorem node0240_0293_domain : ExactDomain node0240_0293 240 293 := by
  exact split_domain (by decide) (by decide) block2032_domain block2033_domain

def node0208_0293 : ℕ → Option IntervalDyadic := split 240 block2031 node0240_0293

theorem node0208_0293_domain : ExactDomain node0208_0293 208 293 := by
  exact split_domain (by decide) (by decide) block2031_domain node0240_0293_domain

def lookup : ℕ → Option IntervalDyadic := node0208_0293

theorem lookup_domain : ExactDomain lookup 208 293 :=
  node0208_0293_domain

theorem block2031_lookup (i : Fin 32) :
    lookup (208 + i.val) = some (values2031[i.val]'(by rw [values2031_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0208_0293 (208 + i.val) = _
  rw [node0208_0293, split_left 240 block2031 node0240_0293 (by omega)]
  exact block2031_get i

theorem block2032_lookup (i : Fin 32) :
    lookup (240 + i.val) = some (values2032[i.val]'(by rw [values2032_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0208_0293 (240 + i.val) = _
  rw [node0208_0293, split_right 240 block2031 node0240_0293 (by omega)]
  rw [node0240_0293, split_left 272 block2032 block2033 (by omega)]
  exact block2032_get i

theorem block2033_lookup (i : Fin 21) :
    lookup (272 + i.val) = some (values2033[i.val]'(by rw [values2033_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0208_0293 (272 + i.val) = _
  rw [node0208_0293, split_right 240 block2031 node0240_0293 (by omega)]
  rw [node0240_0293, split_right 272 block2032 block2033 (by omega)]
  exact block2033_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2031_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2031_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2032_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2032_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2033_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2033_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2031_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2032_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow209.block2033_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow209
