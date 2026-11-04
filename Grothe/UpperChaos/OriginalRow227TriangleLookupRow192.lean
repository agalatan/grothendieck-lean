import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1968
import Grothe.UpperChaos.OriginalRow227TriangleData1969
import Grothe.UpperChaos.OriginalRow227TriangleData1970
import Grothe.UpperChaos.OriginalRow227TriangleData1971

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow192

open ConditionalTableLookup

def values1968 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1968.coefficient192_191,
  OriginalRow227TriangleData1968.coefficient192_192,
  OriginalRow227TriangleData1968.coefficient192_193,
  OriginalRow227TriangleData1968.coefficient192_194,
  OriginalRow227TriangleData1968.coefficient192_195,
  OriginalRow227TriangleData1968.coefficient192_196,
  OriginalRow227TriangleData1968.coefficient192_197,
  OriginalRow227TriangleData1968.coefficient192_198,
  OriginalRow227TriangleData1968.coefficient192_199,
  OriginalRow227TriangleData1968.coefficient192_200,
  OriginalRow227TriangleData1968.coefficient192_201,
  OriginalRow227TriangleData1968.coefficient192_202,
  OriginalRow227TriangleData1968.coefficient192_203,
  OriginalRow227TriangleData1968.coefficient192_204,
  OriginalRow227TriangleData1968.coefficient192_205,
  OriginalRow227TriangleData1968.coefficient192_206,
  OriginalRow227TriangleData1968.coefficient192_207,
  OriginalRow227TriangleData1968.coefficient192_208,
  OriginalRow227TriangleData1968.coefficient192_209,
  OriginalRow227TriangleData1968.coefficient192_210,
  OriginalRow227TriangleData1968.coefficient192_211,
  OriginalRow227TriangleData1968.coefficient192_212,
  OriginalRow227TriangleData1968.coefficient192_213,
  OriginalRow227TriangleData1968.coefficient192_214,
  OriginalRow227TriangleData1968.coefficient192_215,
  OriginalRow227TriangleData1968.coefficient192_216,
  OriginalRow227TriangleData1968.coefficient192_217,
  OriginalRow227TriangleData1968.coefficient192_218,
  OriginalRow227TriangleData1968.coefficient192_219,
  OriginalRow227TriangleData1968.coefficient192_220,
  OriginalRow227TriangleData1968.coefficient192_221,
  OriginalRow227TriangleData1968.coefficient192_222
]

theorem values1968_size : values1968.size = 32 := rfl

def block1968 : ℕ → Option IntervalDyadic := segment 191 values1968

theorem block1968_domain : ExactDomain block1968 191 223 := by
  simpa only [values1968_size] using segment_domain 191 values1968

theorem block1968_get (i : Fin 32) :
    block1968 (191 + i.val) = some (values1968[i.val]'(by rw [values1968_size]; exact i.isLt)) := by
  exact segment_get 191 values1968 ⟨i.val, by rw [values1968_size]; exact i.isLt⟩

def values1969 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1969.coefficient192_223,
  OriginalRow227TriangleData1969.coefficient192_224,
  OriginalRow227TriangleData1969.coefficient192_225,
  OriginalRow227TriangleData1969.coefficient192_226,
  OriginalRow227TriangleData1969.coefficient192_227,
  OriginalRow227TriangleData1969.coefficient192_228,
  OriginalRow227TriangleData1969.coefficient192_229,
  OriginalRow227TriangleData1969.coefficient192_230,
  OriginalRow227TriangleData1969.coefficient192_231,
  OriginalRow227TriangleData1969.coefficient192_232,
  OriginalRow227TriangleData1969.coefficient192_233,
  OriginalRow227TriangleData1969.coefficient192_234,
  OriginalRow227TriangleData1969.coefficient192_235,
  OriginalRow227TriangleData1969.coefficient192_236,
  OriginalRow227TriangleData1969.coefficient192_237,
  OriginalRow227TriangleData1969.coefficient192_238,
  OriginalRow227TriangleData1969.coefficient192_239,
  OriginalRow227TriangleData1969.coefficient192_240,
  OriginalRow227TriangleData1969.coefficient192_241,
  OriginalRow227TriangleData1969.coefficient192_242,
  OriginalRow227TriangleData1969.coefficient192_243,
  OriginalRow227TriangleData1969.coefficient192_244,
  OriginalRow227TriangleData1969.coefficient192_245,
  OriginalRow227TriangleData1969.coefficient192_246,
  OriginalRow227TriangleData1969.coefficient192_247,
  OriginalRow227TriangleData1969.coefficient192_248,
  OriginalRow227TriangleData1969.coefficient192_249,
  OriginalRow227TriangleData1969.coefficient192_250,
  OriginalRow227TriangleData1969.coefficient192_251,
  OriginalRow227TriangleData1969.coefficient192_252,
  OriginalRow227TriangleData1969.coefficient192_253,
  OriginalRow227TriangleData1969.coefficient192_254
]

theorem values1969_size : values1969.size = 32 := rfl

def block1969 : ℕ → Option IntervalDyadic := segment 223 values1969

theorem block1969_domain : ExactDomain block1969 223 255 := by
  simpa only [values1969_size] using segment_domain 223 values1969

theorem block1969_get (i : Fin 32) :
    block1969 (223 + i.val) = some (values1969[i.val]'(by rw [values1969_size]; exact i.isLt)) := by
  exact segment_get 223 values1969 ⟨i.val, by rw [values1969_size]; exact i.isLt⟩

def values1970 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1970.coefficient192_255,
  OriginalRow227TriangleData1970.coefficient192_256,
  OriginalRow227TriangleData1970.coefficient192_257,
  OriginalRow227TriangleData1970.coefficient192_258,
  OriginalRow227TriangleData1970.coefficient192_259,
  OriginalRow227TriangleData1970.coefficient192_260,
  OriginalRow227TriangleData1970.coefficient192_261,
  OriginalRow227TriangleData1970.coefficient192_262,
  OriginalRow227TriangleData1970.coefficient192_263,
  OriginalRow227TriangleData1970.coefficient192_264,
  OriginalRow227TriangleData1970.coefficient192_265,
  OriginalRow227TriangleData1970.coefficient192_266,
  OriginalRow227TriangleData1970.coefficient192_267,
  OriginalRow227TriangleData1970.coefficient192_268,
  OriginalRow227TriangleData1970.coefficient192_269,
  OriginalRow227TriangleData1970.coefficient192_270,
  OriginalRow227TriangleData1970.coefficient192_271,
  OriginalRow227TriangleData1970.coefficient192_272,
  OriginalRow227TriangleData1970.coefficient192_273,
  OriginalRow227TriangleData1970.coefficient192_274,
  OriginalRow227TriangleData1970.coefficient192_275,
  OriginalRow227TriangleData1970.coefficient192_276,
  OriginalRow227TriangleData1970.coefficient192_277,
  OriginalRow227TriangleData1970.coefficient192_278,
  OriginalRow227TriangleData1970.coefficient192_279,
  OriginalRow227TriangleData1970.coefficient192_280,
  OriginalRow227TriangleData1970.coefficient192_281,
  OriginalRow227TriangleData1970.coefficient192_282,
  OriginalRow227TriangleData1970.coefficient192_283,
  OriginalRow227TriangleData1970.coefficient192_284,
  OriginalRow227TriangleData1970.coefficient192_285,
  OriginalRow227TriangleData1970.coefficient192_286
]

theorem values1970_size : values1970.size = 32 := rfl

def block1970 : ℕ → Option IntervalDyadic := segment 255 values1970

theorem block1970_domain : ExactDomain block1970 255 287 := by
  simpa only [values1970_size] using segment_domain 255 values1970

theorem block1970_get (i : Fin 32) :
    block1970 (255 + i.val) = some (values1970[i.val]'(by rw [values1970_size]; exact i.isLt)) := by
  exact segment_get 255 values1970 ⟨i.val, by rw [values1970_size]; exact i.isLt⟩

def values1971 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1971.coefficient192_287,
  OriginalRow227TriangleData1971.coefficient192_288,
  OriginalRow227TriangleData1971.coefficient192_289,
  OriginalRow227TriangleData1971.coefficient192_290,
  OriginalRow227TriangleData1971.coefficient192_291,
  OriginalRow227TriangleData1971.coefficient192_292,
  OriginalRow227TriangleData1971.coefficient192_293,
  OriginalRow227TriangleData1971.coefficient192_294,
  OriginalRow227TriangleData1971.coefficient192_295,
  OriginalRow227TriangleData1971.coefficient192_296,
  OriginalRow227TriangleData1971.coefficient192_297,
  OriginalRow227TriangleData1971.coefficient192_298,
  OriginalRow227TriangleData1971.coefficient192_299,
  OriginalRow227TriangleData1971.coefficient192_300,
  OriginalRow227TriangleData1971.coefficient192_301,
  OriginalRow227TriangleData1971.coefficient192_302,
  OriginalRow227TriangleData1971.coefficient192_303,
  OriginalRow227TriangleData1971.coefficient192_304,
  OriginalRow227TriangleData1971.coefficient192_305,
  OriginalRow227TriangleData1971.coefficient192_306,
  OriginalRow227TriangleData1971.coefficient192_307,
  OriginalRow227TriangleData1971.coefficient192_308,
  OriginalRow227TriangleData1971.coefficient192_309
]

theorem values1971_size : values1971.size = 23 := rfl

def block1971 : ℕ → Option IntervalDyadic := segment 287 values1971

theorem block1971_domain : ExactDomain block1971 287 310 := by
  simpa only [values1971_size] using segment_domain 287 values1971

theorem block1971_get (i : Fin 23) :
    block1971 (287 + i.val) = some (values1971[i.val]'(by rw [values1971_size]; exact i.isLt)) := by
  exact segment_get 287 values1971 ⟨i.val, by rw [values1971_size]; exact i.isLt⟩

def node0191_0255 : ℕ → Option IntervalDyadic := split 223 block1968 block1969

theorem node0191_0255_domain : ExactDomain node0191_0255 191 255 := by
  exact split_domain (by decide) (by decide) block1968_domain block1969_domain

def node0255_0310 : ℕ → Option IntervalDyadic := split 287 block1970 block1971

theorem node0255_0310_domain : ExactDomain node0255_0310 255 310 := by
  exact split_domain (by decide) (by decide) block1970_domain block1971_domain

def node0191_0310 : ℕ → Option IntervalDyadic := split 255 node0191_0255 node0255_0310

theorem node0191_0310_domain : ExactDomain node0191_0310 191 310 := by
  exact split_domain (by decide) (by decide) node0191_0255_domain node0255_0310_domain

def lookup : ℕ → Option IntervalDyadic := node0191_0310

theorem lookup_domain : ExactDomain lookup 191 310 :=
  node0191_0310_domain

theorem block1968_lookup (i : Fin 32) :
    lookup (191 + i.val) = some (values1968[i.val]'(by rw [values1968_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0191_0310 (191 + i.val) = _
  rw [node0191_0310, split_left 255 node0191_0255 node0255_0310 (by omega)]
  rw [node0191_0255, split_left 223 block1968 block1969 (by omega)]
  exact block1968_get i

theorem block1969_lookup (i : Fin 32) :
    lookup (223 + i.val) = some (values1969[i.val]'(by rw [values1969_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0191_0310 (223 + i.val) = _
  rw [node0191_0310, split_left 255 node0191_0255 node0255_0310 (by omega)]
  rw [node0191_0255, split_right 223 block1968 block1969 (by omega)]
  exact block1969_get i

theorem block1970_lookup (i : Fin 32) :
    lookup (255 + i.val) = some (values1970[i.val]'(by rw [values1970_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0191_0310 (255 + i.val) = _
  rw [node0191_0310, split_right 255 node0191_0255 node0255_0310 (by omega)]
  rw [node0255_0310, split_left 287 block1970 block1971 (by omega)]
  exact block1970_get i

theorem block1971_lookup (i : Fin 23) :
    lookup (287 + i.val) = some (values1971[i.val]'(by rw [values1971_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0191_0310 (287 + i.val) = _
  rw [node0191_0310, split_right 255 node0191_0255 node0255_0310 (by omega)]
  rw [node0255_0310, split_right 287 block1970 block1971 (by omega)]
  exact block1971_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1968_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1968_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1969_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1969_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1970_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1970_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1971_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1971_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1968_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1969_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1970_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow192.block1971_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow192
