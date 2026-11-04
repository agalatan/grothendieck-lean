import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1984
import Grothe.UpperChaos.OriginalRow227TriangleData1985
import Grothe.UpperChaos.OriginalRow227TriangleData1986
import Grothe.UpperChaos.OriginalRow227TriangleData1987

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow196

open ConditionalTableLookup

def values1984 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1984.coefficient196_195,
  OriginalRow227TriangleData1984.coefficient196_196,
  OriginalRow227TriangleData1984.coefficient196_197,
  OriginalRow227TriangleData1984.coefficient196_198,
  OriginalRow227TriangleData1984.coefficient196_199,
  OriginalRow227TriangleData1984.coefficient196_200,
  OriginalRow227TriangleData1984.coefficient196_201,
  OriginalRow227TriangleData1984.coefficient196_202,
  OriginalRow227TriangleData1984.coefficient196_203,
  OriginalRow227TriangleData1984.coefficient196_204,
  OriginalRow227TriangleData1984.coefficient196_205,
  OriginalRow227TriangleData1984.coefficient196_206,
  OriginalRow227TriangleData1984.coefficient196_207,
  OriginalRow227TriangleData1984.coefficient196_208,
  OriginalRow227TriangleData1984.coefficient196_209,
  OriginalRow227TriangleData1984.coefficient196_210,
  OriginalRow227TriangleData1984.coefficient196_211,
  OriginalRow227TriangleData1984.coefficient196_212,
  OriginalRow227TriangleData1984.coefficient196_213,
  OriginalRow227TriangleData1984.coefficient196_214,
  OriginalRow227TriangleData1984.coefficient196_215,
  OriginalRow227TriangleData1984.coefficient196_216,
  OriginalRow227TriangleData1984.coefficient196_217,
  OriginalRow227TriangleData1984.coefficient196_218,
  OriginalRow227TriangleData1984.coefficient196_219,
  OriginalRow227TriangleData1984.coefficient196_220,
  OriginalRow227TriangleData1984.coefficient196_221,
  OriginalRow227TriangleData1984.coefficient196_222,
  OriginalRow227TriangleData1984.coefficient196_223,
  OriginalRow227TriangleData1984.coefficient196_224,
  OriginalRow227TriangleData1984.coefficient196_225,
  OriginalRow227TriangleData1984.coefficient196_226
]

theorem values1984_size : values1984.size = 32 := rfl

def block1984 : ℕ → Option IntervalDyadic := segment 195 values1984

theorem block1984_domain : ExactDomain block1984 195 227 := by
  simpa only [values1984_size] using segment_domain 195 values1984

theorem block1984_get (i : Fin 32) :
    block1984 (195 + i.val) = some (values1984[i.val]'(by rw [values1984_size]; exact i.isLt)) := by
  exact segment_get 195 values1984 ⟨i.val, by rw [values1984_size]; exact i.isLt⟩

def values1985 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1985.coefficient196_227,
  OriginalRow227TriangleData1985.coefficient196_228,
  OriginalRow227TriangleData1985.coefficient196_229,
  OriginalRow227TriangleData1985.coefficient196_230,
  OriginalRow227TriangleData1985.coefficient196_231,
  OriginalRow227TriangleData1985.coefficient196_232,
  OriginalRow227TriangleData1985.coefficient196_233,
  OriginalRow227TriangleData1985.coefficient196_234,
  OriginalRow227TriangleData1985.coefficient196_235,
  OriginalRow227TriangleData1985.coefficient196_236,
  OriginalRow227TriangleData1985.coefficient196_237,
  OriginalRow227TriangleData1985.coefficient196_238,
  OriginalRow227TriangleData1985.coefficient196_239,
  OriginalRow227TriangleData1985.coefficient196_240,
  OriginalRow227TriangleData1985.coefficient196_241,
  OriginalRow227TriangleData1985.coefficient196_242,
  OriginalRow227TriangleData1985.coefficient196_243,
  OriginalRow227TriangleData1985.coefficient196_244,
  OriginalRow227TriangleData1985.coefficient196_245,
  OriginalRow227TriangleData1985.coefficient196_246,
  OriginalRow227TriangleData1985.coefficient196_247,
  OriginalRow227TriangleData1985.coefficient196_248,
  OriginalRow227TriangleData1985.coefficient196_249,
  OriginalRow227TriangleData1985.coefficient196_250,
  OriginalRow227TriangleData1985.coefficient196_251,
  OriginalRow227TriangleData1985.coefficient196_252,
  OriginalRow227TriangleData1985.coefficient196_253,
  OriginalRow227TriangleData1985.coefficient196_254,
  OriginalRow227TriangleData1985.coefficient196_255,
  OriginalRow227TriangleData1985.coefficient196_256,
  OriginalRow227TriangleData1985.coefficient196_257,
  OriginalRow227TriangleData1985.coefficient196_258
]

theorem values1985_size : values1985.size = 32 := rfl

def block1985 : ℕ → Option IntervalDyadic := segment 227 values1985

theorem block1985_domain : ExactDomain block1985 227 259 := by
  simpa only [values1985_size] using segment_domain 227 values1985

theorem block1985_get (i : Fin 32) :
    block1985 (227 + i.val) = some (values1985[i.val]'(by rw [values1985_size]; exact i.isLt)) := by
  exact segment_get 227 values1985 ⟨i.val, by rw [values1985_size]; exact i.isLt⟩

def values1986 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1986.coefficient196_259,
  OriginalRow227TriangleData1986.coefficient196_260,
  OriginalRow227TriangleData1986.coefficient196_261,
  OriginalRow227TriangleData1986.coefficient196_262,
  OriginalRow227TriangleData1986.coefficient196_263,
  OriginalRow227TriangleData1986.coefficient196_264,
  OriginalRow227TriangleData1986.coefficient196_265,
  OriginalRow227TriangleData1986.coefficient196_266,
  OriginalRow227TriangleData1986.coefficient196_267,
  OriginalRow227TriangleData1986.coefficient196_268,
  OriginalRow227TriangleData1986.coefficient196_269,
  OriginalRow227TriangleData1986.coefficient196_270,
  OriginalRow227TriangleData1986.coefficient196_271,
  OriginalRow227TriangleData1986.coefficient196_272,
  OriginalRow227TriangleData1986.coefficient196_273,
  OriginalRow227TriangleData1986.coefficient196_274,
  OriginalRow227TriangleData1986.coefficient196_275,
  OriginalRow227TriangleData1986.coefficient196_276,
  OriginalRow227TriangleData1986.coefficient196_277,
  OriginalRow227TriangleData1986.coefficient196_278,
  OriginalRow227TriangleData1986.coefficient196_279,
  OriginalRow227TriangleData1986.coefficient196_280,
  OriginalRow227TriangleData1986.coefficient196_281,
  OriginalRow227TriangleData1986.coefficient196_282,
  OriginalRow227TriangleData1986.coefficient196_283,
  OriginalRow227TriangleData1986.coefficient196_284,
  OriginalRow227TriangleData1986.coefficient196_285,
  OriginalRow227TriangleData1986.coefficient196_286,
  OriginalRow227TriangleData1986.coefficient196_287,
  OriginalRow227TriangleData1986.coefficient196_288,
  OriginalRow227TriangleData1986.coefficient196_289,
  OriginalRow227TriangleData1986.coefficient196_290
]

theorem values1986_size : values1986.size = 32 := rfl

def block1986 : ℕ → Option IntervalDyadic := segment 259 values1986

theorem block1986_domain : ExactDomain block1986 259 291 := by
  simpa only [values1986_size] using segment_domain 259 values1986

theorem block1986_get (i : Fin 32) :
    block1986 (259 + i.val) = some (values1986[i.val]'(by rw [values1986_size]; exact i.isLt)) := by
  exact segment_get 259 values1986 ⟨i.val, by rw [values1986_size]; exact i.isLt⟩

def values1987 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1987.coefficient196_291,
  OriginalRow227TriangleData1987.coefficient196_292,
  OriginalRow227TriangleData1987.coefficient196_293,
  OriginalRow227TriangleData1987.coefficient196_294,
  OriginalRow227TriangleData1987.coefficient196_295,
  OriginalRow227TriangleData1987.coefficient196_296,
  OriginalRow227TriangleData1987.coefficient196_297,
  OriginalRow227TriangleData1987.coefficient196_298,
  OriginalRow227TriangleData1987.coefficient196_299,
  OriginalRow227TriangleData1987.coefficient196_300,
  OriginalRow227TriangleData1987.coefficient196_301,
  OriginalRow227TriangleData1987.coefficient196_302,
  OriginalRow227TriangleData1987.coefficient196_303,
  OriginalRow227TriangleData1987.coefficient196_304,
  OriginalRow227TriangleData1987.coefficient196_305
]

theorem values1987_size : values1987.size = 15 := rfl

def block1987 : ℕ → Option IntervalDyadic := segment 291 values1987

theorem block1987_domain : ExactDomain block1987 291 306 := by
  simpa only [values1987_size] using segment_domain 291 values1987

theorem block1987_get (i : Fin 15) :
    block1987 (291 + i.val) = some (values1987[i.val]'(by rw [values1987_size]; exact i.isLt)) := by
  exact segment_get 291 values1987 ⟨i.val, by rw [values1987_size]; exact i.isLt⟩

def node0195_0259 : ℕ → Option IntervalDyadic := split 227 block1984 block1985

theorem node0195_0259_domain : ExactDomain node0195_0259 195 259 := by
  exact split_domain (by decide) (by decide) block1984_domain block1985_domain

def node0259_0306 : ℕ → Option IntervalDyadic := split 291 block1986 block1987

theorem node0259_0306_domain : ExactDomain node0259_0306 259 306 := by
  exact split_domain (by decide) (by decide) block1986_domain block1987_domain

def node0195_0306 : ℕ → Option IntervalDyadic := split 259 node0195_0259 node0259_0306

theorem node0195_0306_domain : ExactDomain node0195_0306 195 306 := by
  exact split_domain (by decide) (by decide) node0195_0259_domain node0259_0306_domain

def lookup : ℕ → Option IntervalDyadic := node0195_0306

theorem lookup_domain : ExactDomain lookup 195 306 :=
  node0195_0306_domain

theorem block1984_lookup (i : Fin 32) :
    lookup (195 + i.val) = some (values1984[i.val]'(by rw [values1984_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0195_0306 (195 + i.val) = _
  rw [node0195_0306, split_left 259 node0195_0259 node0259_0306 (by omega)]
  rw [node0195_0259, split_left 227 block1984 block1985 (by omega)]
  exact block1984_get i

theorem block1985_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values1985[i.val]'(by rw [values1985_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0195_0306 (227 + i.val) = _
  rw [node0195_0306, split_left 259 node0195_0259 node0259_0306 (by omega)]
  rw [node0195_0259, split_right 227 block1984 block1985 (by omega)]
  exact block1985_get i

theorem block1986_lookup (i : Fin 32) :
    lookup (259 + i.val) = some (values1986[i.val]'(by rw [values1986_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0195_0306 (259 + i.val) = _
  rw [node0195_0306, split_right 259 node0195_0259 node0259_0306 (by omega)]
  rw [node0259_0306, split_left 291 block1986 block1987 (by omega)]
  exact block1986_get i

theorem block1987_lookup (i : Fin 15) :
    lookup (291 + i.val) = some (values1987[i.val]'(by rw [values1987_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0195_0306 (291 + i.val) = _
  rw [node0195_0306, split_right 259 node0195_0259 node0259_0306 (by omega)]
  rw [node0259_0306, split_right 291 block1986 block1987 (by omega)]
  exact block1987_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1984_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1984_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1985_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1985_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1986_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1986_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1987_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1987_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1984_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1985_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1986_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow196.block1987_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow196
