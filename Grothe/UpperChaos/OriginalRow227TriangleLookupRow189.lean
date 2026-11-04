import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1956
import Grothe.UpperChaos.OriginalRow227TriangleData1957
import Grothe.UpperChaos.OriginalRow227TriangleData1958
import Grothe.UpperChaos.OriginalRow227TriangleData1959

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow189

open ConditionalTableLookup

def values1956 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1956.coefficient189_188,
  OriginalRow227TriangleData1956.coefficient189_189,
  OriginalRow227TriangleData1956.coefficient189_190,
  OriginalRow227TriangleData1956.coefficient189_191,
  OriginalRow227TriangleData1956.coefficient189_192,
  OriginalRow227TriangleData1956.coefficient189_193,
  OriginalRow227TriangleData1956.coefficient189_194,
  OriginalRow227TriangleData1956.coefficient189_195,
  OriginalRow227TriangleData1956.coefficient189_196,
  OriginalRow227TriangleData1956.coefficient189_197,
  OriginalRow227TriangleData1956.coefficient189_198,
  OriginalRow227TriangleData1956.coefficient189_199,
  OriginalRow227TriangleData1956.coefficient189_200,
  OriginalRow227TriangleData1956.coefficient189_201,
  OriginalRow227TriangleData1956.coefficient189_202,
  OriginalRow227TriangleData1956.coefficient189_203,
  OriginalRow227TriangleData1956.coefficient189_204,
  OriginalRow227TriangleData1956.coefficient189_205,
  OriginalRow227TriangleData1956.coefficient189_206,
  OriginalRow227TriangleData1956.coefficient189_207,
  OriginalRow227TriangleData1956.coefficient189_208,
  OriginalRow227TriangleData1956.coefficient189_209,
  OriginalRow227TriangleData1956.coefficient189_210,
  OriginalRow227TriangleData1956.coefficient189_211,
  OriginalRow227TriangleData1956.coefficient189_212,
  OriginalRow227TriangleData1956.coefficient189_213,
  OriginalRow227TriangleData1956.coefficient189_214,
  OriginalRow227TriangleData1956.coefficient189_215,
  OriginalRow227TriangleData1956.coefficient189_216,
  OriginalRow227TriangleData1956.coefficient189_217,
  OriginalRow227TriangleData1956.coefficient189_218,
  OriginalRow227TriangleData1956.coefficient189_219
]

theorem values1956_size : values1956.size = 32 := rfl

def block1956 : ℕ → Option IntervalDyadic := segment 188 values1956

theorem block1956_domain : ExactDomain block1956 188 220 := by
  simpa only [values1956_size] using segment_domain 188 values1956

theorem block1956_get (i : Fin 32) :
    block1956 (188 + i.val) = some (values1956[i.val]'(by rw [values1956_size]; exact i.isLt)) := by
  exact segment_get 188 values1956 ⟨i.val, by rw [values1956_size]; exact i.isLt⟩

def values1957 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1957.coefficient189_220,
  OriginalRow227TriangleData1957.coefficient189_221,
  OriginalRow227TriangleData1957.coefficient189_222,
  OriginalRow227TriangleData1957.coefficient189_223,
  OriginalRow227TriangleData1957.coefficient189_224,
  OriginalRow227TriangleData1957.coefficient189_225,
  OriginalRow227TriangleData1957.coefficient189_226,
  OriginalRow227TriangleData1957.coefficient189_227,
  OriginalRow227TriangleData1957.coefficient189_228,
  OriginalRow227TriangleData1957.coefficient189_229,
  OriginalRow227TriangleData1957.coefficient189_230,
  OriginalRow227TriangleData1957.coefficient189_231,
  OriginalRow227TriangleData1957.coefficient189_232,
  OriginalRow227TriangleData1957.coefficient189_233,
  OriginalRow227TriangleData1957.coefficient189_234,
  OriginalRow227TriangleData1957.coefficient189_235,
  OriginalRow227TriangleData1957.coefficient189_236,
  OriginalRow227TriangleData1957.coefficient189_237,
  OriginalRow227TriangleData1957.coefficient189_238,
  OriginalRow227TriangleData1957.coefficient189_239,
  OriginalRow227TriangleData1957.coefficient189_240,
  OriginalRow227TriangleData1957.coefficient189_241,
  OriginalRow227TriangleData1957.coefficient189_242,
  OriginalRow227TriangleData1957.coefficient189_243,
  OriginalRow227TriangleData1957.coefficient189_244,
  OriginalRow227TriangleData1957.coefficient189_245,
  OriginalRow227TriangleData1957.coefficient189_246,
  OriginalRow227TriangleData1957.coefficient189_247,
  OriginalRow227TriangleData1957.coefficient189_248,
  OriginalRow227TriangleData1957.coefficient189_249,
  OriginalRow227TriangleData1957.coefficient189_250,
  OriginalRow227TriangleData1957.coefficient189_251
]

theorem values1957_size : values1957.size = 32 := rfl

def block1957 : ℕ → Option IntervalDyadic := segment 220 values1957

theorem block1957_domain : ExactDomain block1957 220 252 := by
  simpa only [values1957_size] using segment_domain 220 values1957

theorem block1957_get (i : Fin 32) :
    block1957 (220 + i.val) = some (values1957[i.val]'(by rw [values1957_size]; exact i.isLt)) := by
  exact segment_get 220 values1957 ⟨i.val, by rw [values1957_size]; exact i.isLt⟩

def values1958 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1958.coefficient189_252,
  OriginalRow227TriangleData1958.coefficient189_253,
  OriginalRow227TriangleData1958.coefficient189_254,
  OriginalRow227TriangleData1958.coefficient189_255,
  OriginalRow227TriangleData1958.coefficient189_256,
  OriginalRow227TriangleData1958.coefficient189_257,
  OriginalRow227TriangleData1958.coefficient189_258,
  OriginalRow227TriangleData1958.coefficient189_259,
  OriginalRow227TriangleData1958.coefficient189_260,
  OriginalRow227TriangleData1958.coefficient189_261,
  OriginalRow227TriangleData1958.coefficient189_262,
  OriginalRow227TriangleData1958.coefficient189_263,
  OriginalRow227TriangleData1958.coefficient189_264,
  OriginalRow227TriangleData1958.coefficient189_265,
  OriginalRow227TriangleData1958.coefficient189_266,
  OriginalRow227TriangleData1958.coefficient189_267,
  OriginalRow227TriangleData1958.coefficient189_268,
  OriginalRow227TriangleData1958.coefficient189_269,
  OriginalRow227TriangleData1958.coefficient189_270,
  OriginalRow227TriangleData1958.coefficient189_271,
  OriginalRow227TriangleData1958.coefficient189_272,
  OriginalRow227TriangleData1958.coefficient189_273,
  OriginalRow227TriangleData1958.coefficient189_274,
  OriginalRow227TriangleData1958.coefficient189_275,
  OriginalRow227TriangleData1958.coefficient189_276,
  OriginalRow227TriangleData1958.coefficient189_277,
  OriginalRow227TriangleData1958.coefficient189_278,
  OriginalRow227TriangleData1958.coefficient189_279,
  OriginalRow227TriangleData1958.coefficient189_280,
  OriginalRow227TriangleData1958.coefficient189_281,
  OriginalRow227TriangleData1958.coefficient189_282,
  OriginalRow227TriangleData1958.coefficient189_283
]

theorem values1958_size : values1958.size = 32 := rfl

def block1958 : ℕ → Option IntervalDyadic := segment 252 values1958

theorem block1958_domain : ExactDomain block1958 252 284 := by
  simpa only [values1958_size] using segment_domain 252 values1958

theorem block1958_get (i : Fin 32) :
    block1958 (252 + i.val) = some (values1958[i.val]'(by rw [values1958_size]; exact i.isLt)) := by
  exact segment_get 252 values1958 ⟨i.val, by rw [values1958_size]; exact i.isLt⟩

def values1959 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1959.coefficient189_284,
  OriginalRow227TriangleData1959.coefficient189_285,
  OriginalRow227TriangleData1959.coefficient189_286,
  OriginalRow227TriangleData1959.coefficient189_287,
  OriginalRow227TriangleData1959.coefficient189_288,
  OriginalRow227TriangleData1959.coefficient189_289,
  OriginalRow227TriangleData1959.coefficient189_290,
  OriginalRow227TriangleData1959.coefficient189_291,
  OriginalRow227TriangleData1959.coefficient189_292,
  OriginalRow227TriangleData1959.coefficient189_293,
  OriginalRow227TriangleData1959.coefficient189_294,
  OriginalRow227TriangleData1959.coefficient189_295,
  OriginalRow227TriangleData1959.coefficient189_296,
  OriginalRow227TriangleData1959.coefficient189_297,
  OriginalRow227TriangleData1959.coefficient189_298,
  OriginalRow227TriangleData1959.coefficient189_299,
  OriginalRow227TriangleData1959.coefficient189_300,
  OriginalRow227TriangleData1959.coefficient189_301,
  OriginalRow227TriangleData1959.coefficient189_302,
  OriginalRow227TriangleData1959.coefficient189_303,
  OriginalRow227TriangleData1959.coefficient189_304,
  OriginalRow227TriangleData1959.coefficient189_305,
  OriginalRow227TriangleData1959.coefficient189_306,
  OriginalRow227TriangleData1959.coefficient189_307,
  OriginalRow227TriangleData1959.coefficient189_308,
  OriginalRow227TriangleData1959.coefficient189_309,
  OriginalRow227TriangleData1959.coefficient189_310,
  OriginalRow227TriangleData1959.coefficient189_311,
  OriginalRow227TriangleData1959.coefficient189_312
]

theorem values1959_size : values1959.size = 29 := rfl

def block1959 : ℕ → Option IntervalDyadic := segment 284 values1959

theorem block1959_domain : ExactDomain block1959 284 313 := by
  simpa only [values1959_size] using segment_domain 284 values1959

theorem block1959_get (i : Fin 29) :
    block1959 (284 + i.val) = some (values1959[i.val]'(by rw [values1959_size]; exact i.isLt)) := by
  exact segment_get 284 values1959 ⟨i.val, by rw [values1959_size]; exact i.isLt⟩

def node0188_0252 : ℕ → Option IntervalDyadic := split 220 block1956 block1957

theorem node0188_0252_domain : ExactDomain node0188_0252 188 252 := by
  exact split_domain (by decide) (by decide) block1956_domain block1957_domain

def node0252_0313 : ℕ → Option IntervalDyadic := split 284 block1958 block1959

theorem node0252_0313_domain : ExactDomain node0252_0313 252 313 := by
  exact split_domain (by decide) (by decide) block1958_domain block1959_domain

def node0188_0313 : ℕ → Option IntervalDyadic := split 252 node0188_0252 node0252_0313

theorem node0188_0313_domain : ExactDomain node0188_0313 188 313 := by
  exact split_domain (by decide) (by decide) node0188_0252_domain node0252_0313_domain

def lookup : ℕ → Option IntervalDyadic := node0188_0313

theorem lookup_domain : ExactDomain lookup 188 313 :=
  node0188_0313_domain

theorem block1956_lookup (i : Fin 32) :
    lookup (188 + i.val) = some (values1956[i.val]'(by rw [values1956_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0188_0313 (188 + i.val) = _
  rw [node0188_0313, split_left 252 node0188_0252 node0252_0313 (by omega)]
  rw [node0188_0252, split_left 220 block1956 block1957 (by omega)]
  exact block1956_get i

theorem block1957_lookup (i : Fin 32) :
    lookup (220 + i.val) = some (values1957[i.val]'(by rw [values1957_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0188_0313 (220 + i.val) = _
  rw [node0188_0313, split_left 252 node0188_0252 node0252_0313 (by omega)]
  rw [node0188_0252, split_right 220 block1956 block1957 (by omega)]
  exact block1957_get i

theorem block1958_lookup (i : Fin 32) :
    lookup (252 + i.val) = some (values1958[i.val]'(by rw [values1958_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0188_0313 (252 + i.val) = _
  rw [node0188_0313, split_right 252 node0188_0252 node0252_0313 (by omega)]
  rw [node0252_0313, split_left 284 block1958 block1959 (by omega)]
  exact block1958_get i

theorem block1959_lookup (i : Fin 29) :
    lookup (284 + i.val) = some (values1959[i.val]'(by rw [values1959_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0188_0313 (284 + i.val) = _
  rw [node0188_0313, split_right 252 node0188_0252 node0252_0313 (by omega)]
  rw [node0252_0313, split_right 284 block1958 block1959 (by omega)]
  exact block1959_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1956_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1956_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1957_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1957_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1958_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1958_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1959_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1959_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1956_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1957_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1958_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow189.block1959_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow189
