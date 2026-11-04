import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1912
import Grothe.UpperChaos.OriginalRow227TriangleData1913
import Grothe.UpperChaos.OriginalRow227TriangleData1914
import Grothe.UpperChaos.OriginalRow227TriangleData1915
import Grothe.UpperChaos.OriginalRow227TriangleData1916

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow180

open ConditionalTableLookup

def values1912 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1912.coefficient180_179,
  OriginalRow227TriangleData1912.coefficient180_180,
  OriginalRow227TriangleData1912.coefficient180_181,
  OriginalRow227TriangleData1912.coefficient180_182,
  OriginalRow227TriangleData1912.coefficient180_183,
  OriginalRow227TriangleData1912.coefficient180_184,
  OriginalRow227TriangleData1912.coefficient180_185,
  OriginalRow227TriangleData1912.coefficient180_186,
  OriginalRow227TriangleData1912.coefficient180_187,
  OriginalRow227TriangleData1912.coefficient180_188,
  OriginalRow227TriangleData1912.coefficient180_189,
  OriginalRow227TriangleData1912.coefficient180_190,
  OriginalRow227TriangleData1912.coefficient180_191,
  OriginalRow227TriangleData1912.coefficient180_192,
  OriginalRow227TriangleData1912.coefficient180_193,
  OriginalRow227TriangleData1912.coefficient180_194,
  OriginalRow227TriangleData1912.coefficient180_195,
  OriginalRow227TriangleData1912.coefficient180_196,
  OriginalRow227TriangleData1912.coefficient180_197,
  OriginalRow227TriangleData1912.coefficient180_198,
  OriginalRow227TriangleData1912.coefficient180_199,
  OriginalRow227TriangleData1912.coefficient180_200,
  OriginalRow227TriangleData1912.coefficient180_201,
  OriginalRow227TriangleData1912.coefficient180_202,
  OriginalRow227TriangleData1912.coefficient180_203,
  OriginalRow227TriangleData1912.coefficient180_204,
  OriginalRow227TriangleData1912.coefficient180_205,
  OriginalRow227TriangleData1912.coefficient180_206,
  OriginalRow227TriangleData1912.coefficient180_207,
  OriginalRow227TriangleData1912.coefficient180_208,
  OriginalRow227TriangleData1912.coefficient180_209,
  OriginalRow227TriangleData1912.coefficient180_210
]

theorem values1912_size : values1912.size = 32 := rfl

def block1912 : ℕ → Option IntervalDyadic := segment 179 values1912

theorem block1912_domain : ExactDomain block1912 179 211 := by
  simpa only [values1912_size] using segment_domain 179 values1912

theorem block1912_get (i : Fin 32) :
    block1912 (179 + i.val) = some (values1912[i.val]'(by rw [values1912_size]; exact i.isLt)) := by
  exact segment_get 179 values1912 ⟨i.val, by rw [values1912_size]; exact i.isLt⟩

def values1913 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1913.coefficient180_211,
  OriginalRow227TriangleData1913.coefficient180_212,
  OriginalRow227TriangleData1913.coefficient180_213,
  OriginalRow227TriangleData1913.coefficient180_214,
  OriginalRow227TriangleData1913.coefficient180_215,
  OriginalRow227TriangleData1913.coefficient180_216,
  OriginalRow227TriangleData1913.coefficient180_217,
  OriginalRow227TriangleData1913.coefficient180_218,
  OriginalRow227TriangleData1913.coefficient180_219,
  OriginalRow227TriangleData1913.coefficient180_220,
  OriginalRow227TriangleData1913.coefficient180_221,
  OriginalRow227TriangleData1913.coefficient180_222,
  OriginalRow227TriangleData1913.coefficient180_223,
  OriginalRow227TriangleData1913.coefficient180_224,
  OriginalRow227TriangleData1913.coefficient180_225,
  OriginalRow227TriangleData1913.coefficient180_226,
  OriginalRow227TriangleData1913.coefficient180_227,
  OriginalRow227TriangleData1913.coefficient180_228,
  OriginalRow227TriangleData1913.coefficient180_229,
  OriginalRow227TriangleData1913.coefficient180_230,
  OriginalRow227TriangleData1913.coefficient180_231,
  OriginalRow227TriangleData1913.coefficient180_232,
  OriginalRow227TriangleData1913.coefficient180_233,
  OriginalRow227TriangleData1913.coefficient180_234,
  OriginalRow227TriangleData1913.coefficient180_235,
  OriginalRow227TriangleData1913.coefficient180_236,
  OriginalRow227TriangleData1913.coefficient180_237,
  OriginalRow227TriangleData1913.coefficient180_238,
  OriginalRow227TriangleData1913.coefficient180_239,
  OriginalRow227TriangleData1913.coefficient180_240,
  OriginalRow227TriangleData1913.coefficient180_241,
  OriginalRow227TriangleData1913.coefficient180_242
]

theorem values1913_size : values1913.size = 32 := rfl

def block1913 : ℕ → Option IntervalDyadic := segment 211 values1913

theorem block1913_domain : ExactDomain block1913 211 243 := by
  simpa only [values1913_size] using segment_domain 211 values1913

theorem block1913_get (i : Fin 32) :
    block1913 (211 + i.val) = some (values1913[i.val]'(by rw [values1913_size]; exact i.isLt)) := by
  exact segment_get 211 values1913 ⟨i.val, by rw [values1913_size]; exact i.isLt⟩

def values1914 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1914.coefficient180_243,
  OriginalRow227TriangleData1914.coefficient180_244,
  OriginalRow227TriangleData1914.coefficient180_245,
  OriginalRow227TriangleData1914.coefficient180_246,
  OriginalRow227TriangleData1914.coefficient180_247,
  OriginalRow227TriangleData1914.coefficient180_248,
  OriginalRow227TriangleData1914.coefficient180_249,
  OriginalRow227TriangleData1914.coefficient180_250,
  OriginalRow227TriangleData1914.coefficient180_251,
  OriginalRow227TriangleData1914.coefficient180_252,
  OriginalRow227TriangleData1914.coefficient180_253,
  OriginalRow227TriangleData1914.coefficient180_254,
  OriginalRow227TriangleData1914.coefficient180_255,
  OriginalRow227TriangleData1914.coefficient180_256,
  OriginalRow227TriangleData1914.coefficient180_257,
  OriginalRow227TriangleData1914.coefficient180_258,
  OriginalRow227TriangleData1914.coefficient180_259,
  OriginalRow227TriangleData1914.coefficient180_260,
  OriginalRow227TriangleData1914.coefficient180_261,
  OriginalRow227TriangleData1914.coefficient180_262,
  OriginalRow227TriangleData1914.coefficient180_263,
  OriginalRow227TriangleData1914.coefficient180_264,
  OriginalRow227TriangleData1914.coefficient180_265,
  OriginalRow227TriangleData1914.coefficient180_266,
  OriginalRow227TriangleData1914.coefficient180_267,
  OriginalRow227TriangleData1914.coefficient180_268,
  OriginalRow227TriangleData1914.coefficient180_269,
  OriginalRow227TriangleData1914.coefficient180_270,
  OriginalRow227TriangleData1914.coefficient180_271,
  OriginalRow227TriangleData1914.coefficient180_272,
  OriginalRow227TriangleData1914.coefficient180_273,
  OriginalRow227TriangleData1914.coefficient180_274
]

theorem values1914_size : values1914.size = 32 := rfl

def block1914 : ℕ → Option IntervalDyadic := segment 243 values1914

theorem block1914_domain : ExactDomain block1914 243 275 := by
  simpa only [values1914_size] using segment_domain 243 values1914

theorem block1914_get (i : Fin 32) :
    block1914 (243 + i.val) = some (values1914[i.val]'(by rw [values1914_size]; exact i.isLt)) := by
  exact segment_get 243 values1914 ⟨i.val, by rw [values1914_size]; exact i.isLt⟩

def values1915 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1915.coefficient180_275,
  OriginalRow227TriangleData1915.coefficient180_276,
  OriginalRow227TriangleData1915.coefficient180_277,
  OriginalRow227TriangleData1915.coefficient180_278,
  OriginalRow227TriangleData1915.coefficient180_279,
  OriginalRow227TriangleData1915.coefficient180_280,
  OriginalRow227TriangleData1915.coefficient180_281,
  OriginalRow227TriangleData1915.coefficient180_282,
  OriginalRow227TriangleData1915.coefficient180_283,
  OriginalRow227TriangleData1915.coefficient180_284,
  OriginalRow227TriangleData1915.coefficient180_285,
  OriginalRow227TriangleData1915.coefficient180_286,
  OriginalRow227TriangleData1915.coefficient180_287,
  OriginalRow227TriangleData1915.coefficient180_288,
  OriginalRow227TriangleData1915.coefficient180_289,
  OriginalRow227TriangleData1915.coefficient180_290,
  OriginalRow227TriangleData1915.coefficient180_291,
  OriginalRow227TriangleData1915.coefficient180_292,
  OriginalRow227TriangleData1915.coefficient180_293,
  OriginalRow227TriangleData1915.coefficient180_294,
  OriginalRow227TriangleData1915.coefficient180_295,
  OriginalRow227TriangleData1915.coefficient180_296,
  OriginalRow227TriangleData1915.coefficient180_297,
  OriginalRow227TriangleData1915.coefficient180_298,
  OriginalRow227TriangleData1915.coefficient180_299,
  OriginalRow227TriangleData1915.coefficient180_300,
  OriginalRow227TriangleData1915.coefficient180_301,
  OriginalRow227TriangleData1915.coefficient180_302,
  OriginalRow227TriangleData1915.coefficient180_303,
  OriginalRow227TriangleData1915.coefficient180_304,
  OriginalRow227TriangleData1915.coefficient180_305,
  OriginalRow227TriangleData1915.coefficient180_306
]

theorem values1915_size : values1915.size = 32 := rfl

def block1915 : ℕ → Option IntervalDyadic := segment 275 values1915

theorem block1915_domain : ExactDomain block1915 275 307 := by
  simpa only [values1915_size] using segment_domain 275 values1915

theorem block1915_get (i : Fin 32) :
    block1915 (275 + i.val) = some (values1915[i.val]'(by rw [values1915_size]; exact i.isLt)) := by
  exact segment_get 275 values1915 ⟨i.val, by rw [values1915_size]; exact i.isLt⟩

def values1916 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1916.coefficient180_307,
  OriginalRow227TriangleData1916.coefficient180_308,
  OriginalRow227TriangleData1916.coefficient180_309,
  OriginalRow227TriangleData1916.coefficient180_310,
  OriginalRow227TriangleData1916.coefficient180_311,
  OriginalRow227TriangleData1916.coefficient180_312,
  OriginalRow227TriangleData1916.coefficient180_313,
  OriginalRow227TriangleData1916.coefficient180_314,
  OriginalRow227TriangleData1916.coefficient180_315,
  OriginalRow227TriangleData1916.coefficient180_316,
  OriginalRow227TriangleData1916.coefficient180_317,
  OriginalRow227TriangleData1916.coefficient180_318,
  OriginalRow227TriangleData1916.coefficient180_319,
  OriginalRow227TriangleData1916.coefficient180_320,
  OriginalRow227TriangleData1916.coefficient180_321
]

theorem values1916_size : values1916.size = 15 := rfl

def block1916 : ℕ → Option IntervalDyadic := segment 307 values1916

theorem block1916_domain : ExactDomain block1916 307 322 := by
  simpa only [values1916_size] using segment_domain 307 values1916

theorem block1916_get (i : Fin 15) :
    block1916 (307 + i.val) = some (values1916[i.val]'(by rw [values1916_size]; exact i.isLt)) := by
  exact segment_get 307 values1916 ⟨i.val, by rw [values1916_size]; exact i.isLt⟩

def node0179_0243 : ℕ → Option IntervalDyadic := split 211 block1912 block1913

theorem node0179_0243_domain : ExactDomain node0179_0243 179 243 := by
  exact split_domain (by decide) (by decide) block1912_domain block1913_domain

def node0275_0322 : ℕ → Option IntervalDyadic := split 307 block1915 block1916

theorem node0275_0322_domain : ExactDomain node0275_0322 275 322 := by
  exact split_domain (by decide) (by decide) block1915_domain block1916_domain

def node0243_0322 : ℕ → Option IntervalDyadic := split 275 block1914 node0275_0322

theorem node0243_0322_domain : ExactDomain node0243_0322 243 322 := by
  exact split_domain (by decide) (by decide) block1914_domain node0275_0322_domain

def node0179_0322 : ℕ → Option IntervalDyadic := split 243 node0179_0243 node0243_0322

theorem node0179_0322_domain : ExactDomain node0179_0322 179 322 := by
  exact split_domain (by decide) (by decide) node0179_0243_domain node0243_0322_domain

def lookup : ℕ → Option IntervalDyadic := node0179_0322

theorem lookup_domain : ExactDomain lookup 179 322 :=
  node0179_0322_domain

theorem block1912_lookup (i : Fin 32) :
    lookup (179 + i.val) = some (values1912[i.val]'(by rw [values1912_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0179_0322 (179 + i.val) = _
  rw [node0179_0322, split_left 243 node0179_0243 node0243_0322 (by omega)]
  rw [node0179_0243, split_left 211 block1912 block1913 (by omega)]
  exact block1912_get i

theorem block1913_lookup (i : Fin 32) :
    lookup (211 + i.val) = some (values1913[i.val]'(by rw [values1913_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0179_0322 (211 + i.val) = _
  rw [node0179_0322, split_left 243 node0179_0243 node0243_0322 (by omega)]
  rw [node0179_0243, split_right 211 block1912 block1913 (by omega)]
  exact block1913_get i

theorem block1914_lookup (i : Fin 32) :
    lookup (243 + i.val) = some (values1914[i.val]'(by rw [values1914_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0179_0322 (243 + i.val) = _
  rw [node0179_0322, split_right 243 node0179_0243 node0243_0322 (by omega)]
  rw [node0243_0322, split_left 275 block1914 node0275_0322 (by omega)]
  exact block1914_get i

theorem block1915_lookup (i : Fin 32) :
    lookup (275 + i.val) = some (values1915[i.val]'(by rw [values1915_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0179_0322 (275 + i.val) = _
  rw [node0179_0322, split_right 243 node0179_0243 node0243_0322 (by omega)]
  rw [node0243_0322, split_right 275 block1914 node0275_0322 (by omega)]
  rw [node0275_0322, split_left 307 block1915 block1916 (by omega)]
  exact block1915_get i

theorem block1916_lookup (i : Fin 15) :
    lookup (307 + i.val) = some (values1916[i.val]'(by rw [values1916_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0179_0322 (307 + i.val) = _
  rw [node0179_0322, split_right 243 node0179_0243 node0243_0322 (by omega)]
  rw [node0243_0322, split_right 275 block1914 node0275_0322 (by omega)]
  rw [node0275_0322, split_right 307 block1915 block1916 (by omega)]
  exact block1916_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1912_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1912_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1913_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1913_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1914_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1914_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1915_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1915_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1916_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1916_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1912_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1913_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1914_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1915_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow180.block1916_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow180
