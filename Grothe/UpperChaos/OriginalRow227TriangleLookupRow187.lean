import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1947
import Grothe.UpperChaos.OriginalRow227TriangleData1948
import Grothe.UpperChaos.OriginalRow227TriangleData1949
import Grothe.UpperChaos.OriginalRow227TriangleData1950
import Grothe.UpperChaos.OriginalRow227TriangleData1951

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow187

open ConditionalTableLookup

def values1947 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1947.coefficient187_186,
  OriginalRow227TriangleData1947.coefficient187_187,
  OriginalRow227TriangleData1947.coefficient187_188,
  OriginalRow227TriangleData1947.coefficient187_189,
  OriginalRow227TriangleData1947.coefficient187_190,
  OriginalRow227TriangleData1947.coefficient187_191,
  OriginalRow227TriangleData1947.coefficient187_192,
  OriginalRow227TriangleData1947.coefficient187_193,
  OriginalRow227TriangleData1947.coefficient187_194,
  OriginalRow227TriangleData1947.coefficient187_195,
  OriginalRow227TriangleData1947.coefficient187_196,
  OriginalRow227TriangleData1947.coefficient187_197,
  OriginalRow227TriangleData1947.coefficient187_198,
  OriginalRow227TriangleData1947.coefficient187_199,
  OriginalRow227TriangleData1947.coefficient187_200,
  OriginalRow227TriangleData1947.coefficient187_201,
  OriginalRow227TriangleData1947.coefficient187_202,
  OriginalRow227TriangleData1947.coefficient187_203,
  OriginalRow227TriangleData1947.coefficient187_204,
  OriginalRow227TriangleData1947.coefficient187_205,
  OriginalRow227TriangleData1947.coefficient187_206,
  OriginalRow227TriangleData1947.coefficient187_207,
  OriginalRow227TriangleData1947.coefficient187_208,
  OriginalRow227TriangleData1947.coefficient187_209,
  OriginalRow227TriangleData1947.coefficient187_210,
  OriginalRow227TriangleData1947.coefficient187_211,
  OriginalRow227TriangleData1947.coefficient187_212,
  OriginalRow227TriangleData1947.coefficient187_213,
  OriginalRow227TriangleData1947.coefficient187_214,
  OriginalRow227TriangleData1947.coefficient187_215,
  OriginalRow227TriangleData1947.coefficient187_216,
  OriginalRow227TriangleData1947.coefficient187_217
]

theorem values1947_size : values1947.size = 32 := rfl

def block1947 : ℕ → Option IntervalDyadic := segment 186 values1947

theorem block1947_domain : ExactDomain block1947 186 218 := by
  simpa only [values1947_size] using segment_domain 186 values1947

theorem block1947_get (i : Fin 32) :
    block1947 (186 + i.val) = some (values1947[i.val]'(by rw [values1947_size]; exact i.isLt)) := by
  exact segment_get 186 values1947 ⟨i.val, by rw [values1947_size]; exact i.isLt⟩

def values1948 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1948.coefficient187_218,
  OriginalRow227TriangleData1948.coefficient187_219,
  OriginalRow227TriangleData1948.coefficient187_220,
  OriginalRow227TriangleData1948.coefficient187_221,
  OriginalRow227TriangleData1948.coefficient187_222,
  OriginalRow227TriangleData1948.coefficient187_223,
  OriginalRow227TriangleData1948.coefficient187_224,
  OriginalRow227TriangleData1948.coefficient187_225,
  OriginalRow227TriangleData1948.coefficient187_226,
  OriginalRow227TriangleData1948.coefficient187_227,
  OriginalRow227TriangleData1948.coefficient187_228,
  OriginalRow227TriangleData1948.coefficient187_229,
  OriginalRow227TriangleData1948.coefficient187_230,
  OriginalRow227TriangleData1948.coefficient187_231,
  OriginalRow227TriangleData1948.coefficient187_232,
  OriginalRow227TriangleData1948.coefficient187_233,
  OriginalRow227TriangleData1948.coefficient187_234,
  OriginalRow227TriangleData1948.coefficient187_235,
  OriginalRow227TriangleData1948.coefficient187_236,
  OriginalRow227TriangleData1948.coefficient187_237,
  OriginalRow227TriangleData1948.coefficient187_238,
  OriginalRow227TriangleData1948.coefficient187_239,
  OriginalRow227TriangleData1948.coefficient187_240,
  OriginalRow227TriangleData1948.coefficient187_241,
  OriginalRow227TriangleData1948.coefficient187_242,
  OriginalRow227TriangleData1948.coefficient187_243,
  OriginalRow227TriangleData1948.coefficient187_244,
  OriginalRow227TriangleData1948.coefficient187_245,
  OriginalRow227TriangleData1948.coefficient187_246,
  OriginalRow227TriangleData1948.coefficient187_247,
  OriginalRow227TriangleData1948.coefficient187_248,
  OriginalRow227TriangleData1948.coefficient187_249
]

theorem values1948_size : values1948.size = 32 := rfl

def block1948 : ℕ → Option IntervalDyadic := segment 218 values1948

theorem block1948_domain : ExactDomain block1948 218 250 := by
  simpa only [values1948_size] using segment_domain 218 values1948

theorem block1948_get (i : Fin 32) :
    block1948 (218 + i.val) = some (values1948[i.val]'(by rw [values1948_size]; exact i.isLt)) := by
  exact segment_get 218 values1948 ⟨i.val, by rw [values1948_size]; exact i.isLt⟩

def values1949 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1949.coefficient187_250,
  OriginalRow227TriangleData1949.coefficient187_251,
  OriginalRow227TriangleData1949.coefficient187_252,
  OriginalRow227TriangleData1949.coefficient187_253,
  OriginalRow227TriangleData1949.coefficient187_254,
  OriginalRow227TriangleData1949.coefficient187_255,
  OriginalRow227TriangleData1949.coefficient187_256,
  OriginalRow227TriangleData1949.coefficient187_257,
  OriginalRow227TriangleData1949.coefficient187_258,
  OriginalRow227TriangleData1949.coefficient187_259,
  OriginalRow227TriangleData1949.coefficient187_260,
  OriginalRow227TriangleData1949.coefficient187_261,
  OriginalRow227TriangleData1949.coefficient187_262,
  OriginalRow227TriangleData1949.coefficient187_263,
  OriginalRow227TriangleData1949.coefficient187_264,
  OriginalRow227TriangleData1949.coefficient187_265,
  OriginalRow227TriangleData1949.coefficient187_266,
  OriginalRow227TriangleData1949.coefficient187_267,
  OriginalRow227TriangleData1949.coefficient187_268,
  OriginalRow227TriangleData1949.coefficient187_269,
  OriginalRow227TriangleData1949.coefficient187_270,
  OriginalRow227TriangleData1949.coefficient187_271,
  OriginalRow227TriangleData1949.coefficient187_272,
  OriginalRow227TriangleData1949.coefficient187_273,
  OriginalRow227TriangleData1949.coefficient187_274,
  OriginalRow227TriangleData1949.coefficient187_275,
  OriginalRow227TriangleData1949.coefficient187_276,
  OriginalRow227TriangleData1949.coefficient187_277,
  OriginalRow227TriangleData1949.coefficient187_278,
  OriginalRow227TriangleData1949.coefficient187_279,
  OriginalRow227TriangleData1949.coefficient187_280,
  OriginalRow227TriangleData1949.coefficient187_281
]

theorem values1949_size : values1949.size = 32 := rfl

def block1949 : ℕ → Option IntervalDyadic := segment 250 values1949

theorem block1949_domain : ExactDomain block1949 250 282 := by
  simpa only [values1949_size] using segment_domain 250 values1949

theorem block1949_get (i : Fin 32) :
    block1949 (250 + i.val) = some (values1949[i.val]'(by rw [values1949_size]; exact i.isLt)) := by
  exact segment_get 250 values1949 ⟨i.val, by rw [values1949_size]; exact i.isLt⟩

def values1950 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1950.coefficient187_282,
  OriginalRow227TriangleData1950.coefficient187_283,
  OriginalRow227TriangleData1950.coefficient187_284,
  OriginalRow227TriangleData1950.coefficient187_285,
  OriginalRow227TriangleData1950.coefficient187_286,
  OriginalRow227TriangleData1950.coefficient187_287,
  OriginalRow227TriangleData1950.coefficient187_288,
  OriginalRow227TriangleData1950.coefficient187_289,
  OriginalRow227TriangleData1950.coefficient187_290,
  OriginalRow227TriangleData1950.coefficient187_291,
  OriginalRow227TriangleData1950.coefficient187_292,
  OriginalRow227TriangleData1950.coefficient187_293,
  OriginalRow227TriangleData1950.coefficient187_294,
  OriginalRow227TriangleData1950.coefficient187_295,
  OriginalRow227TriangleData1950.coefficient187_296,
  OriginalRow227TriangleData1950.coefficient187_297,
  OriginalRow227TriangleData1950.coefficient187_298,
  OriginalRow227TriangleData1950.coefficient187_299,
  OriginalRow227TriangleData1950.coefficient187_300,
  OriginalRow227TriangleData1950.coefficient187_301,
  OriginalRow227TriangleData1950.coefficient187_302,
  OriginalRow227TriangleData1950.coefficient187_303,
  OriginalRow227TriangleData1950.coefficient187_304,
  OriginalRow227TriangleData1950.coefficient187_305,
  OriginalRow227TriangleData1950.coefficient187_306,
  OriginalRow227TriangleData1950.coefficient187_307,
  OriginalRow227TriangleData1950.coefficient187_308,
  OriginalRow227TriangleData1950.coefficient187_309,
  OriginalRow227TriangleData1950.coefficient187_310,
  OriginalRow227TriangleData1950.coefficient187_311,
  OriginalRow227TriangleData1950.coefficient187_312,
  OriginalRow227TriangleData1950.coefficient187_313
]

theorem values1950_size : values1950.size = 32 := rfl

def block1950 : ℕ → Option IntervalDyadic := segment 282 values1950

theorem block1950_domain : ExactDomain block1950 282 314 := by
  simpa only [values1950_size] using segment_domain 282 values1950

theorem block1950_get (i : Fin 32) :
    block1950 (282 + i.val) = some (values1950[i.val]'(by rw [values1950_size]; exact i.isLt)) := by
  exact segment_get 282 values1950 ⟨i.val, by rw [values1950_size]; exact i.isLt⟩

def values1951 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1951.coefficient187_314
]

theorem values1951_size : values1951.size = 1 := rfl

def block1951 : ℕ → Option IntervalDyadic := segment 314 values1951

theorem block1951_domain : ExactDomain block1951 314 315 := by
  simpa only [values1951_size] using segment_domain 314 values1951

theorem block1951_get (i : Fin 1) :
    block1951 (314 + i.val) = some (values1951[i.val]'(by rw [values1951_size]; exact i.isLt)) := by
  exact segment_get 314 values1951 ⟨i.val, by rw [values1951_size]; exact i.isLt⟩

def node0186_0250 : ℕ → Option IntervalDyadic := split 218 block1947 block1948

theorem node0186_0250_domain : ExactDomain node0186_0250 186 250 := by
  exact split_domain (by decide) (by decide) block1947_domain block1948_domain

def node0282_0315 : ℕ → Option IntervalDyadic := split 314 block1950 block1951

theorem node0282_0315_domain : ExactDomain node0282_0315 282 315 := by
  exact split_domain (by decide) (by decide) block1950_domain block1951_domain

def node0250_0315 : ℕ → Option IntervalDyadic := split 282 block1949 node0282_0315

theorem node0250_0315_domain : ExactDomain node0250_0315 250 315 := by
  exact split_domain (by decide) (by decide) block1949_domain node0282_0315_domain

def node0186_0315 : ℕ → Option IntervalDyadic := split 250 node0186_0250 node0250_0315

theorem node0186_0315_domain : ExactDomain node0186_0315 186 315 := by
  exact split_domain (by decide) (by decide) node0186_0250_domain node0250_0315_domain

def lookup : ℕ → Option IntervalDyadic := node0186_0315

theorem lookup_domain : ExactDomain lookup 186 315 :=
  node0186_0315_domain

theorem block1947_lookup (i : Fin 32) :
    lookup (186 + i.val) = some (values1947[i.val]'(by rw [values1947_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0186_0315 (186 + i.val) = _
  rw [node0186_0315, split_left 250 node0186_0250 node0250_0315 (by omega)]
  rw [node0186_0250, split_left 218 block1947 block1948 (by omega)]
  exact block1947_get i

theorem block1948_lookup (i : Fin 32) :
    lookup (218 + i.val) = some (values1948[i.val]'(by rw [values1948_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0186_0315 (218 + i.val) = _
  rw [node0186_0315, split_left 250 node0186_0250 node0250_0315 (by omega)]
  rw [node0186_0250, split_right 218 block1947 block1948 (by omega)]
  exact block1948_get i

theorem block1949_lookup (i : Fin 32) :
    lookup (250 + i.val) = some (values1949[i.val]'(by rw [values1949_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0186_0315 (250 + i.val) = _
  rw [node0186_0315, split_right 250 node0186_0250 node0250_0315 (by omega)]
  rw [node0250_0315, split_left 282 block1949 node0282_0315 (by omega)]
  exact block1949_get i

theorem block1950_lookup (i : Fin 32) :
    lookup (282 + i.val) = some (values1950[i.val]'(by rw [values1950_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0186_0315 (282 + i.val) = _
  rw [node0186_0315, split_right 250 node0186_0250 node0250_0315 (by omega)]
  rw [node0250_0315, split_right 282 block1949 node0282_0315 (by omega)]
  rw [node0282_0315, split_left 314 block1950 block1951 (by omega)]
  exact block1950_get i

theorem block1951_lookup (i : Fin 1) :
    lookup (314 + i.val) = some (values1951[i.val]'(by rw [values1951_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0186_0315 (314 + i.val) = _
  rw [node0186_0315, split_right 250 node0186_0250 node0250_0315 (by omega)]
  rw [node0250_0315, split_right 282 block1949 node0282_0315 (by omega)]
  rw [node0282_0315, split_right 314 block1950 block1951 (by omega)]
  exact block1951_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1947_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1947_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1948_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1948_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1949_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1949_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1950_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1950_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1951_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1951_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1947_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1948_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1949_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1950_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow187.block1951_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow187
