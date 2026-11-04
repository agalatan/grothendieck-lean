import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1952
import Grothe.UpperChaos.OriginalRow227TriangleData1953
import Grothe.UpperChaos.OriginalRow227TriangleData1954
import Grothe.UpperChaos.OriginalRow227TriangleData1955

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow188

open ConditionalTableLookup

def values1952 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1952.coefficient188_187,
  OriginalRow227TriangleData1952.coefficient188_188,
  OriginalRow227TriangleData1952.coefficient188_189,
  OriginalRow227TriangleData1952.coefficient188_190,
  OriginalRow227TriangleData1952.coefficient188_191,
  OriginalRow227TriangleData1952.coefficient188_192,
  OriginalRow227TriangleData1952.coefficient188_193,
  OriginalRow227TriangleData1952.coefficient188_194,
  OriginalRow227TriangleData1952.coefficient188_195,
  OriginalRow227TriangleData1952.coefficient188_196,
  OriginalRow227TriangleData1952.coefficient188_197,
  OriginalRow227TriangleData1952.coefficient188_198,
  OriginalRow227TriangleData1952.coefficient188_199,
  OriginalRow227TriangleData1952.coefficient188_200,
  OriginalRow227TriangleData1952.coefficient188_201,
  OriginalRow227TriangleData1952.coefficient188_202,
  OriginalRow227TriangleData1952.coefficient188_203,
  OriginalRow227TriangleData1952.coefficient188_204,
  OriginalRow227TriangleData1952.coefficient188_205,
  OriginalRow227TriangleData1952.coefficient188_206,
  OriginalRow227TriangleData1952.coefficient188_207,
  OriginalRow227TriangleData1952.coefficient188_208,
  OriginalRow227TriangleData1952.coefficient188_209,
  OriginalRow227TriangleData1952.coefficient188_210,
  OriginalRow227TriangleData1952.coefficient188_211,
  OriginalRow227TriangleData1952.coefficient188_212,
  OriginalRow227TriangleData1952.coefficient188_213,
  OriginalRow227TriangleData1952.coefficient188_214,
  OriginalRow227TriangleData1952.coefficient188_215,
  OriginalRow227TriangleData1952.coefficient188_216,
  OriginalRow227TriangleData1952.coefficient188_217,
  OriginalRow227TriangleData1952.coefficient188_218
]

theorem values1952_size : values1952.size = 32 := rfl

def block1952 : ℕ → Option IntervalDyadic := segment 187 values1952

theorem block1952_domain : ExactDomain block1952 187 219 := by
  simpa only [values1952_size] using segment_domain 187 values1952

theorem block1952_get (i : Fin 32) :
    block1952 (187 + i.val) = some (values1952[i.val]'(by rw [values1952_size]; exact i.isLt)) := by
  exact segment_get 187 values1952 ⟨i.val, by rw [values1952_size]; exact i.isLt⟩

def values1953 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1953.coefficient188_219,
  OriginalRow227TriangleData1953.coefficient188_220,
  OriginalRow227TriangleData1953.coefficient188_221,
  OriginalRow227TriangleData1953.coefficient188_222,
  OriginalRow227TriangleData1953.coefficient188_223,
  OriginalRow227TriangleData1953.coefficient188_224,
  OriginalRow227TriangleData1953.coefficient188_225,
  OriginalRow227TriangleData1953.coefficient188_226,
  OriginalRow227TriangleData1953.coefficient188_227,
  OriginalRow227TriangleData1953.coefficient188_228,
  OriginalRow227TriangleData1953.coefficient188_229,
  OriginalRow227TriangleData1953.coefficient188_230,
  OriginalRow227TriangleData1953.coefficient188_231,
  OriginalRow227TriangleData1953.coefficient188_232,
  OriginalRow227TriangleData1953.coefficient188_233,
  OriginalRow227TriangleData1953.coefficient188_234,
  OriginalRow227TriangleData1953.coefficient188_235,
  OriginalRow227TriangleData1953.coefficient188_236,
  OriginalRow227TriangleData1953.coefficient188_237,
  OriginalRow227TriangleData1953.coefficient188_238,
  OriginalRow227TriangleData1953.coefficient188_239,
  OriginalRow227TriangleData1953.coefficient188_240,
  OriginalRow227TriangleData1953.coefficient188_241,
  OriginalRow227TriangleData1953.coefficient188_242,
  OriginalRow227TriangleData1953.coefficient188_243,
  OriginalRow227TriangleData1953.coefficient188_244,
  OriginalRow227TriangleData1953.coefficient188_245,
  OriginalRow227TriangleData1953.coefficient188_246,
  OriginalRow227TriangleData1953.coefficient188_247,
  OriginalRow227TriangleData1953.coefficient188_248,
  OriginalRow227TriangleData1953.coefficient188_249,
  OriginalRow227TriangleData1953.coefficient188_250
]

theorem values1953_size : values1953.size = 32 := rfl

def block1953 : ℕ → Option IntervalDyadic := segment 219 values1953

theorem block1953_domain : ExactDomain block1953 219 251 := by
  simpa only [values1953_size] using segment_domain 219 values1953

theorem block1953_get (i : Fin 32) :
    block1953 (219 + i.val) = some (values1953[i.val]'(by rw [values1953_size]; exact i.isLt)) := by
  exact segment_get 219 values1953 ⟨i.val, by rw [values1953_size]; exact i.isLt⟩

def values1954 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1954.coefficient188_251,
  OriginalRow227TriangleData1954.coefficient188_252,
  OriginalRow227TriangleData1954.coefficient188_253,
  OriginalRow227TriangleData1954.coefficient188_254,
  OriginalRow227TriangleData1954.coefficient188_255,
  OriginalRow227TriangleData1954.coefficient188_256,
  OriginalRow227TriangleData1954.coefficient188_257,
  OriginalRow227TriangleData1954.coefficient188_258,
  OriginalRow227TriangleData1954.coefficient188_259,
  OriginalRow227TriangleData1954.coefficient188_260,
  OriginalRow227TriangleData1954.coefficient188_261,
  OriginalRow227TriangleData1954.coefficient188_262,
  OriginalRow227TriangleData1954.coefficient188_263,
  OriginalRow227TriangleData1954.coefficient188_264,
  OriginalRow227TriangleData1954.coefficient188_265,
  OriginalRow227TriangleData1954.coefficient188_266,
  OriginalRow227TriangleData1954.coefficient188_267,
  OriginalRow227TriangleData1954.coefficient188_268,
  OriginalRow227TriangleData1954.coefficient188_269,
  OriginalRow227TriangleData1954.coefficient188_270,
  OriginalRow227TriangleData1954.coefficient188_271,
  OriginalRow227TriangleData1954.coefficient188_272,
  OriginalRow227TriangleData1954.coefficient188_273,
  OriginalRow227TriangleData1954.coefficient188_274,
  OriginalRow227TriangleData1954.coefficient188_275,
  OriginalRow227TriangleData1954.coefficient188_276,
  OriginalRow227TriangleData1954.coefficient188_277,
  OriginalRow227TriangleData1954.coefficient188_278,
  OriginalRow227TriangleData1954.coefficient188_279,
  OriginalRow227TriangleData1954.coefficient188_280,
  OriginalRow227TriangleData1954.coefficient188_281,
  OriginalRow227TriangleData1954.coefficient188_282
]

theorem values1954_size : values1954.size = 32 := rfl

def block1954 : ℕ → Option IntervalDyadic := segment 251 values1954

theorem block1954_domain : ExactDomain block1954 251 283 := by
  simpa only [values1954_size] using segment_domain 251 values1954

theorem block1954_get (i : Fin 32) :
    block1954 (251 + i.val) = some (values1954[i.val]'(by rw [values1954_size]; exact i.isLt)) := by
  exact segment_get 251 values1954 ⟨i.val, by rw [values1954_size]; exact i.isLt⟩

def values1955 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1955.coefficient188_283,
  OriginalRow227TriangleData1955.coefficient188_284,
  OriginalRow227TriangleData1955.coefficient188_285,
  OriginalRow227TriangleData1955.coefficient188_286,
  OriginalRow227TriangleData1955.coefficient188_287,
  OriginalRow227TriangleData1955.coefficient188_288,
  OriginalRow227TriangleData1955.coefficient188_289,
  OriginalRow227TriangleData1955.coefficient188_290,
  OriginalRow227TriangleData1955.coefficient188_291,
  OriginalRow227TriangleData1955.coefficient188_292,
  OriginalRow227TriangleData1955.coefficient188_293,
  OriginalRow227TriangleData1955.coefficient188_294,
  OriginalRow227TriangleData1955.coefficient188_295,
  OriginalRow227TriangleData1955.coefficient188_296,
  OriginalRow227TriangleData1955.coefficient188_297,
  OriginalRow227TriangleData1955.coefficient188_298,
  OriginalRow227TriangleData1955.coefficient188_299,
  OriginalRow227TriangleData1955.coefficient188_300,
  OriginalRow227TriangleData1955.coefficient188_301,
  OriginalRow227TriangleData1955.coefficient188_302,
  OriginalRow227TriangleData1955.coefficient188_303,
  OriginalRow227TriangleData1955.coefficient188_304,
  OriginalRow227TriangleData1955.coefficient188_305,
  OriginalRow227TriangleData1955.coefficient188_306,
  OriginalRow227TriangleData1955.coefficient188_307,
  OriginalRow227TriangleData1955.coefficient188_308,
  OriginalRow227TriangleData1955.coefficient188_309,
  OriginalRow227TriangleData1955.coefficient188_310,
  OriginalRow227TriangleData1955.coefficient188_311,
  OriginalRow227TriangleData1955.coefficient188_312,
  OriginalRow227TriangleData1955.coefficient188_313
]

theorem values1955_size : values1955.size = 31 := rfl

def block1955 : ℕ → Option IntervalDyadic := segment 283 values1955

theorem block1955_domain : ExactDomain block1955 283 314 := by
  simpa only [values1955_size] using segment_domain 283 values1955

theorem block1955_get (i : Fin 31) :
    block1955 (283 + i.val) = some (values1955[i.val]'(by rw [values1955_size]; exact i.isLt)) := by
  exact segment_get 283 values1955 ⟨i.val, by rw [values1955_size]; exact i.isLt⟩

def node0187_0251 : ℕ → Option IntervalDyadic := split 219 block1952 block1953

theorem node0187_0251_domain : ExactDomain node0187_0251 187 251 := by
  exact split_domain (by decide) (by decide) block1952_domain block1953_domain

def node0251_0314 : ℕ → Option IntervalDyadic := split 283 block1954 block1955

theorem node0251_0314_domain : ExactDomain node0251_0314 251 314 := by
  exact split_domain (by decide) (by decide) block1954_domain block1955_domain

def node0187_0314 : ℕ → Option IntervalDyadic := split 251 node0187_0251 node0251_0314

theorem node0187_0314_domain : ExactDomain node0187_0314 187 314 := by
  exact split_domain (by decide) (by decide) node0187_0251_domain node0251_0314_domain

def lookup : ℕ → Option IntervalDyadic := node0187_0314

theorem lookup_domain : ExactDomain lookup 187 314 :=
  node0187_0314_domain

theorem block1952_lookup (i : Fin 32) :
    lookup (187 + i.val) = some (values1952[i.val]'(by rw [values1952_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0187_0314 (187 + i.val) = _
  rw [node0187_0314, split_left 251 node0187_0251 node0251_0314 (by omega)]
  rw [node0187_0251, split_left 219 block1952 block1953 (by omega)]
  exact block1952_get i

theorem block1953_lookup (i : Fin 32) :
    lookup (219 + i.val) = some (values1953[i.val]'(by rw [values1953_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0187_0314 (219 + i.val) = _
  rw [node0187_0314, split_left 251 node0187_0251 node0251_0314 (by omega)]
  rw [node0187_0251, split_right 219 block1952 block1953 (by omega)]
  exact block1953_get i

theorem block1954_lookup (i : Fin 32) :
    lookup (251 + i.val) = some (values1954[i.val]'(by rw [values1954_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0187_0314 (251 + i.val) = _
  rw [node0187_0314, split_right 251 node0187_0251 node0251_0314 (by omega)]
  rw [node0251_0314, split_left 283 block1954 block1955 (by omega)]
  exact block1954_get i

theorem block1955_lookup (i : Fin 31) :
    lookup (283 + i.val) = some (values1955[i.val]'(by rw [values1955_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0187_0314 (283 + i.val) = _
  rw [node0187_0314, split_right 251 node0187_0251 node0251_0314 (by omega)]
  rw [node0251_0314, split_right 283 block1954 block1955 (by omega)]
  exact block1955_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1952_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1952_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1953_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1953_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1954_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1954_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1955_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1955_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1952_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1953_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1954_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow188.block1955_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow188
