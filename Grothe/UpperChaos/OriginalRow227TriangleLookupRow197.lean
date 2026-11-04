import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1988
import Grothe.UpperChaos.OriginalRow227TriangleData1989
import Grothe.UpperChaos.OriginalRow227TriangleData1990
import Grothe.UpperChaos.OriginalRow227TriangleData1991

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow197

open ConditionalTableLookup

def values1988 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1988.coefficient197_196,
  OriginalRow227TriangleData1988.coefficient197_197,
  OriginalRow227TriangleData1988.coefficient197_198,
  OriginalRow227TriangleData1988.coefficient197_199,
  OriginalRow227TriangleData1988.coefficient197_200,
  OriginalRow227TriangleData1988.coefficient197_201,
  OriginalRow227TriangleData1988.coefficient197_202,
  OriginalRow227TriangleData1988.coefficient197_203,
  OriginalRow227TriangleData1988.coefficient197_204,
  OriginalRow227TriangleData1988.coefficient197_205,
  OriginalRow227TriangleData1988.coefficient197_206,
  OriginalRow227TriangleData1988.coefficient197_207,
  OriginalRow227TriangleData1988.coefficient197_208,
  OriginalRow227TriangleData1988.coefficient197_209,
  OriginalRow227TriangleData1988.coefficient197_210,
  OriginalRow227TriangleData1988.coefficient197_211,
  OriginalRow227TriangleData1988.coefficient197_212,
  OriginalRow227TriangleData1988.coefficient197_213,
  OriginalRow227TriangleData1988.coefficient197_214,
  OriginalRow227TriangleData1988.coefficient197_215,
  OriginalRow227TriangleData1988.coefficient197_216,
  OriginalRow227TriangleData1988.coefficient197_217,
  OriginalRow227TriangleData1988.coefficient197_218,
  OriginalRow227TriangleData1988.coefficient197_219,
  OriginalRow227TriangleData1988.coefficient197_220,
  OriginalRow227TriangleData1988.coefficient197_221,
  OriginalRow227TriangleData1988.coefficient197_222,
  OriginalRow227TriangleData1988.coefficient197_223,
  OriginalRow227TriangleData1988.coefficient197_224,
  OriginalRow227TriangleData1988.coefficient197_225,
  OriginalRow227TriangleData1988.coefficient197_226,
  OriginalRow227TriangleData1988.coefficient197_227
]

theorem values1988_size : values1988.size = 32 := rfl

def block1988 : ℕ → Option IntervalDyadic := segment 196 values1988

theorem block1988_domain : ExactDomain block1988 196 228 := by
  simpa only [values1988_size] using segment_domain 196 values1988

theorem block1988_get (i : Fin 32) :
    block1988 (196 + i.val) = some (values1988[i.val]'(by rw [values1988_size]; exact i.isLt)) := by
  exact segment_get 196 values1988 ⟨i.val, by rw [values1988_size]; exact i.isLt⟩

def values1989 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1989.coefficient197_228,
  OriginalRow227TriangleData1989.coefficient197_229,
  OriginalRow227TriangleData1989.coefficient197_230,
  OriginalRow227TriangleData1989.coefficient197_231,
  OriginalRow227TriangleData1989.coefficient197_232,
  OriginalRow227TriangleData1989.coefficient197_233,
  OriginalRow227TriangleData1989.coefficient197_234,
  OriginalRow227TriangleData1989.coefficient197_235,
  OriginalRow227TriangleData1989.coefficient197_236,
  OriginalRow227TriangleData1989.coefficient197_237,
  OriginalRow227TriangleData1989.coefficient197_238,
  OriginalRow227TriangleData1989.coefficient197_239,
  OriginalRow227TriangleData1989.coefficient197_240,
  OriginalRow227TriangleData1989.coefficient197_241,
  OriginalRow227TriangleData1989.coefficient197_242,
  OriginalRow227TriangleData1989.coefficient197_243,
  OriginalRow227TriangleData1989.coefficient197_244,
  OriginalRow227TriangleData1989.coefficient197_245,
  OriginalRow227TriangleData1989.coefficient197_246,
  OriginalRow227TriangleData1989.coefficient197_247,
  OriginalRow227TriangleData1989.coefficient197_248,
  OriginalRow227TriangleData1989.coefficient197_249,
  OriginalRow227TriangleData1989.coefficient197_250,
  OriginalRow227TriangleData1989.coefficient197_251,
  OriginalRow227TriangleData1989.coefficient197_252,
  OriginalRow227TriangleData1989.coefficient197_253,
  OriginalRow227TriangleData1989.coefficient197_254,
  OriginalRow227TriangleData1989.coefficient197_255,
  OriginalRow227TriangleData1989.coefficient197_256,
  OriginalRow227TriangleData1989.coefficient197_257,
  OriginalRow227TriangleData1989.coefficient197_258,
  OriginalRow227TriangleData1989.coefficient197_259
]

theorem values1989_size : values1989.size = 32 := rfl

def block1989 : ℕ → Option IntervalDyadic := segment 228 values1989

theorem block1989_domain : ExactDomain block1989 228 260 := by
  simpa only [values1989_size] using segment_domain 228 values1989

theorem block1989_get (i : Fin 32) :
    block1989 (228 + i.val) = some (values1989[i.val]'(by rw [values1989_size]; exact i.isLt)) := by
  exact segment_get 228 values1989 ⟨i.val, by rw [values1989_size]; exact i.isLt⟩

def values1990 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1990.coefficient197_260,
  OriginalRow227TriangleData1990.coefficient197_261,
  OriginalRow227TriangleData1990.coefficient197_262,
  OriginalRow227TriangleData1990.coefficient197_263,
  OriginalRow227TriangleData1990.coefficient197_264,
  OriginalRow227TriangleData1990.coefficient197_265,
  OriginalRow227TriangleData1990.coefficient197_266,
  OriginalRow227TriangleData1990.coefficient197_267,
  OriginalRow227TriangleData1990.coefficient197_268,
  OriginalRow227TriangleData1990.coefficient197_269,
  OriginalRow227TriangleData1990.coefficient197_270,
  OriginalRow227TriangleData1990.coefficient197_271,
  OriginalRow227TriangleData1990.coefficient197_272,
  OriginalRow227TriangleData1990.coefficient197_273,
  OriginalRow227TriangleData1990.coefficient197_274,
  OriginalRow227TriangleData1990.coefficient197_275,
  OriginalRow227TriangleData1990.coefficient197_276,
  OriginalRow227TriangleData1990.coefficient197_277,
  OriginalRow227TriangleData1990.coefficient197_278,
  OriginalRow227TriangleData1990.coefficient197_279,
  OriginalRow227TriangleData1990.coefficient197_280,
  OriginalRow227TriangleData1990.coefficient197_281,
  OriginalRow227TriangleData1990.coefficient197_282,
  OriginalRow227TriangleData1990.coefficient197_283,
  OriginalRow227TriangleData1990.coefficient197_284,
  OriginalRow227TriangleData1990.coefficient197_285,
  OriginalRow227TriangleData1990.coefficient197_286,
  OriginalRow227TriangleData1990.coefficient197_287,
  OriginalRow227TriangleData1990.coefficient197_288,
  OriginalRow227TriangleData1990.coefficient197_289,
  OriginalRow227TriangleData1990.coefficient197_290,
  OriginalRow227TriangleData1990.coefficient197_291
]

theorem values1990_size : values1990.size = 32 := rfl

def block1990 : ℕ → Option IntervalDyadic := segment 260 values1990

theorem block1990_domain : ExactDomain block1990 260 292 := by
  simpa only [values1990_size] using segment_domain 260 values1990

theorem block1990_get (i : Fin 32) :
    block1990 (260 + i.val) = some (values1990[i.val]'(by rw [values1990_size]; exact i.isLt)) := by
  exact segment_get 260 values1990 ⟨i.val, by rw [values1990_size]; exact i.isLt⟩

def values1991 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1991.coefficient197_292,
  OriginalRow227TriangleData1991.coefficient197_293,
  OriginalRow227TriangleData1991.coefficient197_294,
  OriginalRow227TriangleData1991.coefficient197_295,
  OriginalRow227TriangleData1991.coefficient197_296,
  OriginalRow227TriangleData1991.coefficient197_297,
  OriginalRow227TriangleData1991.coefficient197_298,
  OriginalRow227TriangleData1991.coefficient197_299,
  OriginalRow227TriangleData1991.coefficient197_300,
  OriginalRow227TriangleData1991.coefficient197_301,
  OriginalRow227TriangleData1991.coefficient197_302,
  OriginalRow227TriangleData1991.coefficient197_303,
  OriginalRow227TriangleData1991.coefficient197_304
]

theorem values1991_size : values1991.size = 13 := rfl

def block1991 : ℕ → Option IntervalDyadic := segment 292 values1991

theorem block1991_domain : ExactDomain block1991 292 305 := by
  simpa only [values1991_size] using segment_domain 292 values1991

theorem block1991_get (i : Fin 13) :
    block1991 (292 + i.val) = some (values1991[i.val]'(by rw [values1991_size]; exact i.isLt)) := by
  exact segment_get 292 values1991 ⟨i.val, by rw [values1991_size]; exact i.isLt⟩

def node0196_0260 : ℕ → Option IntervalDyadic := split 228 block1988 block1989

theorem node0196_0260_domain : ExactDomain node0196_0260 196 260 := by
  exact split_domain (by decide) (by decide) block1988_domain block1989_domain

def node0260_0305 : ℕ → Option IntervalDyadic := split 292 block1990 block1991

theorem node0260_0305_domain : ExactDomain node0260_0305 260 305 := by
  exact split_domain (by decide) (by decide) block1990_domain block1991_domain

def node0196_0305 : ℕ → Option IntervalDyadic := split 260 node0196_0260 node0260_0305

theorem node0196_0305_domain : ExactDomain node0196_0305 196 305 := by
  exact split_domain (by decide) (by decide) node0196_0260_domain node0260_0305_domain

def lookup : ℕ → Option IntervalDyadic := node0196_0305

theorem lookup_domain : ExactDomain lookup 196 305 :=
  node0196_0305_domain

theorem block1988_lookup (i : Fin 32) :
    lookup (196 + i.val) = some (values1988[i.val]'(by rw [values1988_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0196_0305 (196 + i.val) = _
  rw [node0196_0305, split_left 260 node0196_0260 node0260_0305 (by omega)]
  rw [node0196_0260, split_left 228 block1988 block1989 (by omega)]
  exact block1988_get i

theorem block1989_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values1989[i.val]'(by rw [values1989_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0196_0305 (228 + i.val) = _
  rw [node0196_0305, split_left 260 node0196_0260 node0260_0305 (by omega)]
  rw [node0196_0260, split_right 228 block1988 block1989 (by omega)]
  exact block1989_get i

theorem block1990_lookup (i : Fin 32) :
    lookup (260 + i.val) = some (values1990[i.val]'(by rw [values1990_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0196_0305 (260 + i.val) = _
  rw [node0196_0305, split_right 260 node0196_0260 node0260_0305 (by omega)]
  rw [node0260_0305, split_left 292 block1990 block1991 (by omega)]
  exact block1990_get i

theorem block1991_lookup (i : Fin 13) :
    lookup (292 + i.val) = some (values1991[i.val]'(by rw [values1991_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0196_0305 (292 + i.val) = _
  rw [node0196_0305, split_right 260 node0196_0260 node0260_0305 (by omega)]
  rw [node0260_0305, split_right 292 block1990 block1991 (by omega)]
  exact block1991_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1988_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1988_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1989_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1989_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1990_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1990_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1991_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1991_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1988_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1989_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1990_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow197.block1991_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow197
