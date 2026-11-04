import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1972
import Grothe.UpperChaos.OriginalRow227TriangleData1973
import Grothe.UpperChaos.OriginalRow227TriangleData1974
import Grothe.UpperChaos.OriginalRow227TriangleData1975

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow193

open ConditionalTableLookup

def values1972 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1972.coefficient193_192,
  OriginalRow227TriangleData1972.coefficient193_193,
  OriginalRow227TriangleData1972.coefficient193_194,
  OriginalRow227TriangleData1972.coefficient193_195,
  OriginalRow227TriangleData1972.coefficient193_196,
  OriginalRow227TriangleData1972.coefficient193_197,
  OriginalRow227TriangleData1972.coefficient193_198,
  OriginalRow227TriangleData1972.coefficient193_199,
  OriginalRow227TriangleData1972.coefficient193_200,
  OriginalRow227TriangleData1972.coefficient193_201,
  OriginalRow227TriangleData1972.coefficient193_202,
  OriginalRow227TriangleData1972.coefficient193_203,
  OriginalRow227TriangleData1972.coefficient193_204,
  OriginalRow227TriangleData1972.coefficient193_205,
  OriginalRow227TriangleData1972.coefficient193_206,
  OriginalRow227TriangleData1972.coefficient193_207,
  OriginalRow227TriangleData1972.coefficient193_208,
  OriginalRow227TriangleData1972.coefficient193_209,
  OriginalRow227TriangleData1972.coefficient193_210,
  OriginalRow227TriangleData1972.coefficient193_211,
  OriginalRow227TriangleData1972.coefficient193_212,
  OriginalRow227TriangleData1972.coefficient193_213,
  OriginalRow227TriangleData1972.coefficient193_214,
  OriginalRow227TriangleData1972.coefficient193_215,
  OriginalRow227TriangleData1972.coefficient193_216,
  OriginalRow227TriangleData1972.coefficient193_217,
  OriginalRow227TriangleData1972.coefficient193_218,
  OriginalRow227TriangleData1972.coefficient193_219,
  OriginalRow227TriangleData1972.coefficient193_220,
  OriginalRow227TriangleData1972.coefficient193_221,
  OriginalRow227TriangleData1972.coefficient193_222,
  OriginalRow227TriangleData1972.coefficient193_223
]

theorem values1972_size : values1972.size = 32 := rfl

def block1972 : ℕ → Option IntervalDyadic := segment 192 values1972

theorem block1972_domain : ExactDomain block1972 192 224 := by
  simpa only [values1972_size] using segment_domain 192 values1972

theorem block1972_get (i : Fin 32) :
    block1972 (192 + i.val) = some (values1972[i.val]'(by rw [values1972_size]; exact i.isLt)) := by
  exact segment_get 192 values1972 ⟨i.val, by rw [values1972_size]; exact i.isLt⟩

def values1973 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1973.coefficient193_224,
  OriginalRow227TriangleData1973.coefficient193_225,
  OriginalRow227TriangleData1973.coefficient193_226,
  OriginalRow227TriangleData1973.coefficient193_227,
  OriginalRow227TriangleData1973.coefficient193_228,
  OriginalRow227TriangleData1973.coefficient193_229,
  OriginalRow227TriangleData1973.coefficient193_230,
  OriginalRow227TriangleData1973.coefficient193_231,
  OriginalRow227TriangleData1973.coefficient193_232,
  OriginalRow227TriangleData1973.coefficient193_233,
  OriginalRow227TriangleData1973.coefficient193_234,
  OriginalRow227TriangleData1973.coefficient193_235,
  OriginalRow227TriangleData1973.coefficient193_236,
  OriginalRow227TriangleData1973.coefficient193_237,
  OriginalRow227TriangleData1973.coefficient193_238,
  OriginalRow227TriangleData1973.coefficient193_239,
  OriginalRow227TriangleData1973.coefficient193_240,
  OriginalRow227TriangleData1973.coefficient193_241,
  OriginalRow227TriangleData1973.coefficient193_242,
  OriginalRow227TriangleData1973.coefficient193_243,
  OriginalRow227TriangleData1973.coefficient193_244,
  OriginalRow227TriangleData1973.coefficient193_245,
  OriginalRow227TriangleData1973.coefficient193_246,
  OriginalRow227TriangleData1973.coefficient193_247,
  OriginalRow227TriangleData1973.coefficient193_248,
  OriginalRow227TriangleData1973.coefficient193_249,
  OriginalRow227TriangleData1973.coefficient193_250,
  OriginalRow227TriangleData1973.coefficient193_251,
  OriginalRow227TriangleData1973.coefficient193_252,
  OriginalRow227TriangleData1973.coefficient193_253,
  OriginalRow227TriangleData1973.coefficient193_254,
  OriginalRow227TriangleData1973.coefficient193_255
]

theorem values1973_size : values1973.size = 32 := rfl

def block1973 : ℕ → Option IntervalDyadic := segment 224 values1973

theorem block1973_domain : ExactDomain block1973 224 256 := by
  simpa only [values1973_size] using segment_domain 224 values1973

theorem block1973_get (i : Fin 32) :
    block1973 (224 + i.val) = some (values1973[i.val]'(by rw [values1973_size]; exact i.isLt)) := by
  exact segment_get 224 values1973 ⟨i.val, by rw [values1973_size]; exact i.isLt⟩

def values1974 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1974.coefficient193_256,
  OriginalRow227TriangleData1974.coefficient193_257,
  OriginalRow227TriangleData1974.coefficient193_258,
  OriginalRow227TriangleData1974.coefficient193_259,
  OriginalRow227TriangleData1974.coefficient193_260,
  OriginalRow227TriangleData1974.coefficient193_261,
  OriginalRow227TriangleData1974.coefficient193_262,
  OriginalRow227TriangleData1974.coefficient193_263,
  OriginalRow227TriangleData1974.coefficient193_264,
  OriginalRow227TriangleData1974.coefficient193_265,
  OriginalRow227TriangleData1974.coefficient193_266,
  OriginalRow227TriangleData1974.coefficient193_267,
  OriginalRow227TriangleData1974.coefficient193_268,
  OriginalRow227TriangleData1974.coefficient193_269,
  OriginalRow227TriangleData1974.coefficient193_270,
  OriginalRow227TriangleData1974.coefficient193_271,
  OriginalRow227TriangleData1974.coefficient193_272,
  OriginalRow227TriangleData1974.coefficient193_273,
  OriginalRow227TriangleData1974.coefficient193_274,
  OriginalRow227TriangleData1974.coefficient193_275,
  OriginalRow227TriangleData1974.coefficient193_276,
  OriginalRow227TriangleData1974.coefficient193_277,
  OriginalRow227TriangleData1974.coefficient193_278,
  OriginalRow227TriangleData1974.coefficient193_279,
  OriginalRow227TriangleData1974.coefficient193_280,
  OriginalRow227TriangleData1974.coefficient193_281,
  OriginalRow227TriangleData1974.coefficient193_282,
  OriginalRow227TriangleData1974.coefficient193_283,
  OriginalRow227TriangleData1974.coefficient193_284,
  OriginalRow227TriangleData1974.coefficient193_285,
  OriginalRow227TriangleData1974.coefficient193_286,
  OriginalRow227TriangleData1974.coefficient193_287
]

theorem values1974_size : values1974.size = 32 := rfl

def block1974 : ℕ → Option IntervalDyadic := segment 256 values1974

theorem block1974_domain : ExactDomain block1974 256 288 := by
  simpa only [values1974_size] using segment_domain 256 values1974

theorem block1974_get (i : Fin 32) :
    block1974 (256 + i.val) = some (values1974[i.val]'(by rw [values1974_size]; exact i.isLt)) := by
  exact segment_get 256 values1974 ⟨i.val, by rw [values1974_size]; exact i.isLt⟩

def values1975 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1975.coefficient193_288,
  OriginalRow227TriangleData1975.coefficient193_289,
  OriginalRow227TriangleData1975.coefficient193_290,
  OriginalRow227TriangleData1975.coefficient193_291,
  OriginalRow227TriangleData1975.coefficient193_292,
  OriginalRow227TriangleData1975.coefficient193_293,
  OriginalRow227TriangleData1975.coefficient193_294,
  OriginalRow227TriangleData1975.coefficient193_295,
  OriginalRow227TriangleData1975.coefficient193_296,
  OriginalRow227TriangleData1975.coefficient193_297,
  OriginalRow227TriangleData1975.coefficient193_298,
  OriginalRow227TriangleData1975.coefficient193_299,
  OriginalRow227TriangleData1975.coefficient193_300,
  OriginalRow227TriangleData1975.coefficient193_301,
  OriginalRow227TriangleData1975.coefficient193_302,
  OriginalRow227TriangleData1975.coefficient193_303,
  OriginalRow227TriangleData1975.coefficient193_304,
  OriginalRow227TriangleData1975.coefficient193_305,
  OriginalRow227TriangleData1975.coefficient193_306,
  OriginalRow227TriangleData1975.coefficient193_307,
  OriginalRow227TriangleData1975.coefficient193_308
]

theorem values1975_size : values1975.size = 21 := rfl

def block1975 : ℕ → Option IntervalDyadic := segment 288 values1975

theorem block1975_domain : ExactDomain block1975 288 309 := by
  simpa only [values1975_size] using segment_domain 288 values1975

theorem block1975_get (i : Fin 21) :
    block1975 (288 + i.val) = some (values1975[i.val]'(by rw [values1975_size]; exact i.isLt)) := by
  exact segment_get 288 values1975 ⟨i.val, by rw [values1975_size]; exact i.isLt⟩

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block1972 block1973

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block1972_domain block1973_domain

def node0256_0309 : ℕ → Option IntervalDyadic := split 288 block1974 block1975

theorem node0256_0309_domain : ExactDomain node0256_0309 256 309 := by
  exact split_domain (by decide) (by decide) block1974_domain block1975_domain

def node0192_0309 : ℕ → Option IntervalDyadic := split 256 node0192_0256 node0256_0309

theorem node0192_0309_domain : ExactDomain node0192_0309 192 309 := by
  exact split_domain (by decide) (by decide) node0192_0256_domain node0256_0309_domain

def lookup : ℕ → Option IntervalDyadic := node0192_0309

theorem lookup_domain : ExactDomain lookup 192 309 :=
  node0192_0309_domain

theorem block1972_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values1972[i.val]'(by rw [values1972_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0192_0309 (192 + i.val) = _
  rw [node0192_0309, split_left 256 node0192_0256 node0256_0309 (by omega)]
  rw [node0192_0256, split_left 224 block1972 block1973 (by omega)]
  exact block1972_get i

theorem block1973_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values1973[i.val]'(by rw [values1973_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0192_0309 (224 + i.val) = _
  rw [node0192_0309, split_left 256 node0192_0256 node0256_0309 (by omega)]
  rw [node0192_0256, split_right 224 block1972 block1973 (by omega)]
  exact block1973_get i

theorem block1974_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values1974[i.val]'(by rw [values1974_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0192_0309 (256 + i.val) = _
  rw [node0192_0309, split_right 256 node0192_0256 node0256_0309 (by omega)]
  rw [node0256_0309, split_left 288 block1974 block1975 (by omega)]
  exact block1974_get i

theorem block1975_lookup (i : Fin 21) :
    lookup (288 + i.val) = some (values1975[i.val]'(by rw [values1975_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0192_0309 (288 + i.val) = _
  rw [node0192_0309, split_right 256 node0192_0256 node0256_0309 (by omega)]
  rw [node0256_0309, split_right 288 block1974 block1975 (by omega)]
  exact block1975_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1972_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1972_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1973_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1973_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1974_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1974_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1975_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1975_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1972_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1973_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1974_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow193.block1975_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow193
