import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1964
import Grothe.UpperChaos.OriginalRow227TriangleData1965
import Grothe.UpperChaos.OriginalRow227TriangleData1966
import Grothe.UpperChaos.OriginalRow227TriangleData1967

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow191

open ConditionalTableLookup

def values1964 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1964.coefficient191_190,
  OriginalRow227TriangleData1964.coefficient191_191,
  OriginalRow227TriangleData1964.coefficient191_192,
  OriginalRow227TriangleData1964.coefficient191_193,
  OriginalRow227TriangleData1964.coefficient191_194,
  OriginalRow227TriangleData1964.coefficient191_195,
  OriginalRow227TriangleData1964.coefficient191_196,
  OriginalRow227TriangleData1964.coefficient191_197,
  OriginalRow227TriangleData1964.coefficient191_198,
  OriginalRow227TriangleData1964.coefficient191_199,
  OriginalRow227TriangleData1964.coefficient191_200,
  OriginalRow227TriangleData1964.coefficient191_201,
  OriginalRow227TriangleData1964.coefficient191_202,
  OriginalRow227TriangleData1964.coefficient191_203,
  OriginalRow227TriangleData1964.coefficient191_204,
  OriginalRow227TriangleData1964.coefficient191_205,
  OriginalRow227TriangleData1964.coefficient191_206,
  OriginalRow227TriangleData1964.coefficient191_207,
  OriginalRow227TriangleData1964.coefficient191_208,
  OriginalRow227TriangleData1964.coefficient191_209,
  OriginalRow227TriangleData1964.coefficient191_210,
  OriginalRow227TriangleData1964.coefficient191_211,
  OriginalRow227TriangleData1964.coefficient191_212,
  OriginalRow227TriangleData1964.coefficient191_213,
  OriginalRow227TriangleData1964.coefficient191_214,
  OriginalRow227TriangleData1964.coefficient191_215,
  OriginalRow227TriangleData1964.coefficient191_216,
  OriginalRow227TriangleData1964.coefficient191_217,
  OriginalRow227TriangleData1964.coefficient191_218,
  OriginalRow227TriangleData1964.coefficient191_219,
  OriginalRow227TriangleData1964.coefficient191_220,
  OriginalRow227TriangleData1964.coefficient191_221
]

theorem values1964_size : values1964.size = 32 := rfl

def block1964 : ℕ → Option IntervalDyadic := segment 190 values1964

theorem block1964_domain : ExactDomain block1964 190 222 := by
  simpa only [values1964_size] using segment_domain 190 values1964

theorem block1964_get (i : Fin 32) :
    block1964 (190 + i.val) = some (values1964[i.val]'(by rw [values1964_size]; exact i.isLt)) := by
  exact segment_get 190 values1964 ⟨i.val, by rw [values1964_size]; exact i.isLt⟩

def values1965 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1965.coefficient191_222,
  OriginalRow227TriangleData1965.coefficient191_223,
  OriginalRow227TriangleData1965.coefficient191_224,
  OriginalRow227TriangleData1965.coefficient191_225,
  OriginalRow227TriangleData1965.coefficient191_226,
  OriginalRow227TriangleData1965.coefficient191_227,
  OriginalRow227TriangleData1965.coefficient191_228,
  OriginalRow227TriangleData1965.coefficient191_229,
  OriginalRow227TriangleData1965.coefficient191_230,
  OriginalRow227TriangleData1965.coefficient191_231,
  OriginalRow227TriangleData1965.coefficient191_232,
  OriginalRow227TriangleData1965.coefficient191_233,
  OriginalRow227TriangleData1965.coefficient191_234,
  OriginalRow227TriangleData1965.coefficient191_235,
  OriginalRow227TriangleData1965.coefficient191_236,
  OriginalRow227TriangleData1965.coefficient191_237,
  OriginalRow227TriangleData1965.coefficient191_238,
  OriginalRow227TriangleData1965.coefficient191_239,
  OriginalRow227TriangleData1965.coefficient191_240,
  OriginalRow227TriangleData1965.coefficient191_241,
  OriginalRow227TriangleData1965.coefficient191_242,
  OriginalRow227TriangleData1965.coefficient191_243,
  OriginalRow227TriangleData1965.coefficient191_244,
  OriginalRow227TriangleData1965.coefficient191_245,
  OriginalRow227TriangleData1965.coefficient191_246,
  OriginalRow227TriangleData1965.coefficient191_247,
  OriginalRow227TriangleData1965.coefficient191_248,
  OriginalRow227TriangleData1965.coefficient191_249,
  OriginalRow227TriangleData1965.coefficient191_250,
  OriginalRow227TriangleData1965.coefficient191_251,
  OriginalRow227TriangleData1965.coefficient191_252,
  OriginalRow227TriangleData1965.coefficient191_253
]

theorem values1965_size : values1965.size = 32 := rfl

def block1965 : ℕ → Option IntervalDyadic := segment 222 values1965

theorem block1965_domain : ExactDomain block1965 222 254 := by
  simpa only [values1965_size] using segment_domain 222 values1965

theorem block1965_get (i : Fin 32) :
    block1965 (222 + i.val) = some (values1965[i.val]'(by rw [values1965_size]; exact i.isLt)) := by
  exact segment_get 222 values1965 ⟨i.val, by rw [values1965_size]; exact i.isLt⟩

def values1966 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1966.coefficient191_254,
  OriginalRow227TriangleData1966.coefficient191_255,
  OriginalRow227TriangleData1966.coefficient191_256,
  OriginalRow227TriangleData1966.coefficient191_257,
  OriginalRow227TriangleData1966.coefficient191_258,
  OriginalRow227TriangleData1966.coefficient191_259,
  OriginalRow227TriangleData1966.coefficient191_260,
  OriginalRow227TriangleData1966.coefficient191_261,
  OriginalRow227TriangleData1966.coefficient191_262,
  OriginalRow227TriangleData1966.coefficient191_263,
  OriginalRow227TriangleData1966.coefficient191_264,
  OriginalRow227TriangleData1966.coefficient191_265,
  OriginalRow227TriangleData1966.coefficient191_266,
  OriginalRow227TriangleData1966.coefficient191_267,
  OriginalRow227TriangleData1966.coefficient191_268,
  OriginalRow227TriangleData1966.coefficient191_269,
  OriginalRow227TriangleData1966.coefficient191_270,
  OriginalRow227TriangleData1966.coefficient191_271,
  OriginalRow227TriangleData1966.coefficient191_272,
  OriginalRow227TriangleData1966.coefficient191_273,
  OriginalRow227TriangleData1966.coefficient191_274,
  OriginalRow227TriangleData1966.coefficient191_275,
  OriginalRow227TriangleData1966.coefficient191_276,
  OriginalRow227TriangleData1966.coefficient191_277,
  OriginalRow227TriangleData1966.coefficient191_278,
  OriginalRow227TriangleData1966.coefficient191_279,
  OriginalRow227TriangleData1966.coefficient191_280,
  OriginalRow227TriangleData1966.coefficient191_281,
  OriginalRow227TriangleData1966.coefficient191_282,
  OriginalRow227TriangleData1966.coefficient191_283,
  OriginalRow227TriangleData1966.coefficient191_284,
  OriginalRow227TriangleData1966.coefficient191_285
]

theorem values1966_size : values1966.size = 32 := rfl

def block1966 : ℕ → Option IntervalDyadic := segment 254 values1966

theorem block1966_domain : ExactDomain block1966 254 286 := by
  simpa only [values1966_size] using segment_domain 254 values1966

theorem block1966_get (i : Fin 32) :
    block1966 (254 + i.val) = some (values1966[i.val]'(by rw [values1966_size]; exact i.isLt)) := by
  exact segment_get 254 values1966 ⟨i.val, by rw [values1966_size]; exact i.isLt⟩

def values1967 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1967.coefficient191_286,
  OriginalRow227TriangleData1967.coefficient191_287,
  OriginalRow227TriangleData1967.coefficient191_288,
  OriginalRow227TriangleData1967.coefficient191_289,
  OriginalRow227TriangleData1967.coefficient191_290,
  OriginalRow227TriangleData1967.coefficient191_291,
  OriginalRow227TriangleData1967.coefficient191_292,
  OriginalRow227TriangleData1967.coefficient191_293,
  OriginalRow227TriangleData1967.coefficient191_294,
  OriginalRow227TriangleData1967.coefficient191_295,
  OriginalRow227TriangleData1967.coefficient191_296,
  OriginalRow227TriangleData1967.coefficient191_297,
  OriginalRow227TriangleData1967.coefficient191_298,
  OriginalRow227TriangleData1967.coefficient191_299,
  OriginalRow227TriangleData1967.coefficient191_300,
  OriginalRow227TriangleData1967.coefficient191_301,
  OriginalRow227TriangleData1967.coefficient191_302,
  OriginalRow227TriangleData1967.coefficient191_303,
  OriginalRow227TriangleData1967.coefficient191_304,
  OriginalRow227TriangleData1967.coefficient191_305,
  OriginalRow227TriangleData1967.coefficient191_306,
  OriginalRow227TriangleData1967.coefficient191_307,
  OriginalRow227TriangleData1967.coefficient191_308,
  OriginalRow227TriangleData1967.coefficient191_309,
  OriginalRow227TriangleData1967.coefficient191_310
]

theorem values1967_size : values1967.size = 25 := rfl

def block1967 : ℕ → Option IntervalDyadic := segment 286 values1967

theorem block1967_domain : ExactDomain block1967 286 311 := by
  simpa only [values1967_size] using segment_domain 286 values1967

theorem block1967_get (i : Fin 25) :
    block1967 (286 + i.val) = some (values1967[i.val]'(by rw [values1967_size]; exact i.isLt)) := by
  exact segment_get 286 values1967 ⟨i.val, by rw [values1967_size]; exact i.isLt⟩

def node0190_0254 : ℕ → Option IntervalDyadic := split 222 block1964 block1965

theorem node0190_0254_domain : ExactDomain node0190_0254 190 254 := by
  exact split_domain (by decide) (by decide) block1964_domain block1965_domain

def node0254_0311 : ℕ → Option IntervalDyadic := split 286 block1966 block1967

theorem node0254_0311_domain : ExactDomain node0254_0311 254 311 := by
  exact split_domain (by decide) (by decide) block1966_domain block1967_domain

def node0190_0311 : ℕ → Option IntervalDyadic := split 254 node0190_0254 node0254_0311

theorem node0190_0311_domain : ExactDomain node0190_0311 190 311 := by
  exact split_domain (by decide) (by decide) node0190_0254_domain node0254_0311_domain

def lookup : ℕ → Option IntervalDyadic := node0190_0311

theorem lookup_domain : ExactDomain lookup 190 311 :=
  node0190_0311_domain

theorem block1964_lookup (i : Fin 32) :
    lookup (190 + i.val) = some (values1964[i.val]'(by rw [values1964_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0190_0311 (190 + i.val) = _
  rw [node0190_0311, split_left 254 node0190_0254 node0254_0311 (by omega)]
  rw [node0190_0254, split_left 222 block1964 block1965 (by omega)]
  exact block1964_get i

theorem block1965_lookup (i : Fin 32) :
    lookup (222 + i.val) = some (values1965[i.val]'(by rw [values1965_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0190_0311 (222 + i.val) = _
  rw [node0190_0311, split_left 254 node0190_0254 node0254_0311 (by omega)]
  rw [node0190_0254, split_right 222 block1964 block1965 (by omega)]
  exact block1965_get i

theorem block1966_lookup (i : Fin 32) :
    lookup (254 + i.val) = some (values1966[i.val]'(by rw [values1966_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0190_0311 (254 + i.val) = _
  rw [node0190_0311, split_right 254 node0190_0254 node0254_0311 (by omega)]
  rw [node0254_0311, split_left 286 block1966 block1967 (by omega)]
  exact block1966_get i

theorem block1967_lookup (i : Fin 25) :
    lookup (286 + i.val) = some (values1967[i.val]'(by rw [values1967_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0190_0311 (286 + i.val) = _
  rw [node0190_0311, split_right 254 node0190_0254 node0254_0311 (by omega)]
  rw [node0254_0311, split_right 286 block1966 block1967 (by omega)]
  exact block1967_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1964_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1964_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1965_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1965_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1966_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1966_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1967_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1967_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1964_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1965_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1966_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow191.block1967_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow191
