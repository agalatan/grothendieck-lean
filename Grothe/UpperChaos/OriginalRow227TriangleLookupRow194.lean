import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1976
import Grothe.UpperChaos.OriginalRow227TriangleData1977
import Grothe.UpperChaos.OriginalRow227TriangleData1978
import Grothe.UpperChaos.OriginalRow227TriangleData1979

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow194

open ConditionalTableLookup

def values1976 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1976.coefficient194_193,
  OriginalRow227TriangleData1976.coefficient194_194,
  OriginalRow227TriangleData1976.coefficient194_195,
  OriginalRow227TriangleData1976.coefficient194_196,
  OriginalRow227TriangleData1976.coefficient194_197,
  OriginalRow227TriangleData1976.coefficient194_198,
  OriginalRow227TriangleData1976.coefficient194_199,
  OriginalRow227TriangleData1976.coefficient194_200,
  OriginalRow227TriangleData1976.coefficient194_201,
  OriginalRow227TriangleData1976.coefficient194_202,
  OriginalRow227TriangleData1976.coefficient194_203,
  OriginalRow227TriangleData1976.coefficient194_204,
  OriginalRow227TriangleData1976.coefficient194_205,
  OriginalRow227TriangleData1976.coefficient194_206,
  OriginalRow227TriangleData1976.coefficient194_207,
  OriginalRow227TriangleData1976.coefficient194_208,
  OriginalRow227TriangleData1976.coefficient194_209,
  OriginalRow227TriangleData1976.coefficient194_210,
  OriginalRow227TriangleData1976.coefficient194_211,
  OriginalRow227TriangleData1976.coefficient194_212,
  OriginalRow227TriangleData1976.coefficient194_213,
  OriginalRow227TriangleData1976.coefficient194_214,
  OriginalRow227TriangleData1976.coefficient194_215,
  OriginalRow227TriangleData1976.coefficient194_216,
  OriginalRow227TriangleData1976.coefficient194_217,
  OriginalRow227TriangleData1976.coefficient194_218,
  OriginalRow227TriangleData1976.coefficient194_219,
  OriginalRow227TriangleData1976.coefficient194_220,
  OriginalRow227TriangleData1976.coefficient194_221,
  OriginalRow227TriangleData1976.coefficient194_222,
  OriginalRow227TriangleData1976.coefficient194_223,
  OriginalRow227TriangleData1976.coefficient194_224
]

theorem values1976_size : values1976.size = 32 := rfl

def block1976 : ℕ → Option IntervalDyadic := segment 193 values1976

theorem block1976_domain : ExactDomain block1976 193 225 := by
  simpa only [values1976_size] using segment_domain 193 values1976

theorem block1976_get (i : Fin 32) :
    block1976 (193 + i.val) = some (values1976[i.val]'(by rw [values1976_size]; exact i.isLt)) := by
  exact segment_get 193 values1976 ⟨i.val, by rw [values1976_size]; exact i.isLt⟩

def values1977 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1977.coefficient194_225,
  OriginalRow227TriangleData1977.coefficient194_226,
  OriginalRow227TriangleData1977.coefficient194_227,
  OriginalRow227TriangleData1977.coefficient194_228,
  OriginalRow227TriangleData1977.coefficient194_229,
  OriginalRow227TriangleData1977.coefficient194_230,
  OriginalRow227TriangleData1977.coefficient194_231,
  OriginalRow227TriangleData1977.coefficient194_232,
  OriginalRow227TriangleData1977.coefficient194_233,
  OriginalRow227TriangleData1977.coefficient194_234,
  OriginalRow227TriangleData1977.coefficient194_235,
  OriginalRow227TriangleData1977.coefficient194_236,
  OriginalRow227TriangleData1977.coefficient194_237,
  OriginalRow227TriangleData1977.coefficient194_238,
  OriginalRow227TriangleData1977.coefficient194_239,
  OriginalRow227TriangleData1977.coefficient194_240,
  OriginalRow227TriangleData1977.coefficient194_241,
  OriginalRow227TriangleData1977.coefficient194_242,
  OriginalRow227TriangleData1977.coefficient194_243,
  OriginalRow227TriangleData1977.coefficient194_244,
  OriginalRow227TriangleData1977.coefficient194_245,
  OriginalRow227TriangleData1977.coefficient194_246,
  OriginalRow227TriangleData1977.coefficient194_247,
  OriginalRow227TriangleData1977.coefficient194_248,
  OriginalRow227TriangleData1977.coefficient194_249,
  OriginalRow227TriangleData1977.coefficient194_250,
  OriginalRow227TriangleData1977.coefficient194_251,
  OriginalRow227TriangleData1977.coefficient194_252,
  OriginalRow227TriangleData1977.coefficient194_253,
  OriginalRow227TriangleData1977.coefficient194_254,
  OriginalRow227TriangleData1977.coefficient194_255,
  OriginalRow227TriangleData1977.coefficient194_256
]

theorem values1977_size : values1977.size = 32 := rfl

def block1977 : ℕ → Option IntervalDyadic := segment 225 values1977

theorem block1977_domain : ExactDomain block1977 225 257 := by
  simpa only [values1977_size] using segment_domain 225 values1977

theorem block1977_get (i : Fin 32) :
    block1977 (225 + i.val) = some (values1977[i.val]'(by rw [values1977_size]; exact i.isLt)) := by
  exact segment_get 225 values1977 ⟨i.val, by rw [values1977_size]; exact i.isLt⟩

def values1978 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1978.coefficient194_257,
  OriginalRow227TriangleData1978.coefficient194_258,
  OriginalRow227TriangleData1978.coefficient194_259,
  OriginalRow227TriangleData1978.coefficient194_260,
  OriginalRow227TriangleData1978.coefficient194_261,
  OriginalRow227TriangleData1978.coefficient194_262,
  OriginalRow227TriangleData1978.coefficient194_263,
  OriginalRow227TriangleData1978.coefficient194_264,
  OriginalRow227TriangleData1978.coefficient194_265,
  OriginalRow227TriangleData1978.coefficient194_266,
  OriginalRow227TriangleData1978.coefficient194_267,
  OriginalRow227TriangleData1978.coefficient194_268,
  OriginalRow227TriangleData1978.coefficient194_269,
  OriginalRow227TriangleData1978.coefficient194_270,
  OriginalRow227TriangleData1978.coefficient194_271,
  OriginalRow227TriangleData1978.coefficient194_272,
  OriginalRow227TriangleData1978.coefficient194_273,
  OriginalRow227TriangleData1978.coefficient194_274,
  OriginalRow227TriangleData1978.coefficient194_275,
  OriginalRow227TriangleData1978.coefficient194_276,
  OriginalRow227TriangleData1978.coefficient194_277,
  OriginalRow227TriangleData1978.coefficient194_278,
  OriginalRow227TriangleData1978.coefficient194_279,
  OriginalRow227TriangleData1978.coefficient194_280,
  OriginalRow227TriangleData1978.coefficient194_281,
  OriginalRow227TriangleData1978.coefficient194_282,
  OriginalRow227TriangleData1978.coefficient194_283,
  OriginalRow227TriangleData1978.coefficient194_284,
  OriginalRow227TriangleData1978.coefficient194_285,
  OriginalRow227TriangleData1978.coefficient194_286,
  OriginalRow227TriangleData1978.coefficient194_287,
  OriginalRow227TriangleData1978.coefficient194_288
]

theorem values1978_size : values1978.size = 32 := rfl

def block1978 : ℕ → Option IntervalDyadic := segment 257 values1978

theorem block1978_domain : ExactDomain block1978 257 289 := by
  simpa only [values1978_size] using segment_domain 257 values1978

theorem block1978_get (i : Fin 32) :
    block1978 (257 + i.val) = some (values1978[i.val]'(by rw [values1978_size]; exact i.isLt)) := by
  exact segment_get 257 values1978 ⟨i.val, by rw [values1978_size]; exact i.isLt⟩

def values1979 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1979.coefficient194_289,
  OriginalRow227TriangleData1979.coefficient194_290,
  OriginalRow227TriangleData1979.coefficient194_291,
  OriginalRow227TriangleData1979.coefficient194_292,
  OriginalRow227TriangleData1979.coefficient194_293,
  OriginalRow227TriangleData1979.coefficient194_294,
  OriginalRow227TriangleData1979.coefficient194_295,
  OriginalRow227TriangleData1979.coefficient194_296,
  OriginalRow227TriangleData1979.coefficient194_297,
  OriginalRow227TriangleData1979.coefficient194_298,
  OriginalRow227TriangleData1979.coefficient194_299,
  OriginalRow227TriangleData1979.coefficient194_300,
  OriginalRow227TriangleData1979.coefficient194_301,
  OriginalRow227TriangleData1979.coefficient194_302,
  OriginalRow227TriangleData1979.coefficient194_303,
  OriginalRow227TriangleData1979.coefficient194_304,
  OriginalRow227TriangleData1979.coefficient194_305,
  OriginalRow227TriangleData1979.coefficient194_306,
  OriginalRow227TriangleData1979.coefficient194_307
]

theorem values1979_size : values1979.size = 19 := rfl

def block1979 : ℕ → Option IntervalDyadic := segment 289 values1979

theorem block1979_domain : ExactDomain block1979 289 308 := by
  simpa only [values1979_size] using segment_domain 289 values1979

theorem block1979_get (i : Fin 19) :
    block1979 (289 + i.val) = some (values1979[i.val]'(by rw [values1979_size]; exact i.isLt)) := by
  exact segment_get 289 values1979 ⟨i.val, by rw [values1979_size]; exact i.isLt⟩

def node0193_0257 : ℕ → Option IntervalDyadic := split 225 block1976 block1977

theorem node0193_0257_domain : ExactDomain node0193_0257 193 257 := by
  exact split_domain (by decide) (by decide) block1976_domain block1977_domain

def node0257_0308 : ℕ → Option IntervalDyadic := split 289 block1978 block1979

theorem node0257_0308_domain : ExactDomain node0257_0308 257 308 := by
  exact split_domain (by decide) (by decide) block1978_domain block1979_domain

def node0193_0308 : ℕ → Option IntervalDyadic := split 257 node0193_0257 node0257_0308

theorem node0193_0308_domain : ExactDomain node0193_0308 193 308 := by
  exact split_domain (by decide) (by decide) node0193_0257_domain node0257_0308_domain

def lookup : ℕ → Option IntervalDyadic := node0193_0308

theorem lookup_domain : ExactDomain lookup 193 308 :=
  node0193_0308_domain

theorem block1976_lookup (i : Fin 32) :
    lookup (193 + i.val) = some (values1976[i.val]'(by rw [values1976_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0193_0308 (193 + i.val) = _
  rw [node0193_0308, split_left 257 node0193_0257 node0257_0308 (by omega)]
  rw [node0193_0257, split_left 225 block1976 block1977 (by omega)]
  exact block1976_get i

theorem block1977_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values1977[i.val]'(by rw [values1977_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0193_0308 (225 + i.val) = _
  rw [node0193_0308, split_left 257 node0193_0257 node0257_0308 (by omega)]
  rw [node0193_0257, split_right 225 block1976 block1977 (by omega)]
  exact block1977_get i

theorem block1978_lookup (i : Fin 32) :
    lookup (257 + i.val) = some (values1978[i.val]'(by rw [values1978_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0193_0308 (257 + i.val) = _
  rw [node0193_0308, split_right 257 node0193_0257 node0257_0308 (by omega)]
  rw [node0257_0308, split_left 289 block1978 block1979 (by omega)]
  exact block1978_get i

theorem block1979_lookup (i : Fin 19) :
    lookup (289 + i.val) = some (values1979[i.val]'(by rw [values1979_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0193_0308 (289 + i.val) = _
  rw [node0193_0308, split_right 257 node0193_0257 node0257_0308 (by omega)]
  rw [node0257_0308, split_right 289 block1978 block1979 (by omega)]
  exact block1979_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1976_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1976_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1977_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1977_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1978_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1978_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1979_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1979_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1976_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1977_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1978_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow194.block1979_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow194
