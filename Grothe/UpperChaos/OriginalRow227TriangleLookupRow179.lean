import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1907
import Grothe.UpperChaos.OriginalRow227TriangleData1908
import Grothe.UpperChaos.OriginalRow227TriangleData1909
import Grothe.UpperChaos.OriginalRow227TriangleData1910
import Grothe.UpperChaos.OriginalRow227TriangleData1911

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow179

open ConditionalTableLookup

def values1907 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1907.coefficient179_178,
  OriginalRow227TriangleData1907.coefficient179_179,
  OriginalRow227TriangleData1907.coefficient179_180,
  OriginalRow227TriangleData1907.coefficient179_181,
  OriginalRow227TriangleData1907.coefficient179_182,
  OriginalRow227TriangleData1907.coefficient179_183,
  OriginalRow227TriangleData1907.coefficient179_184,
  OriginalRow227TriangleData1907.coefficient179_185,
  OriginalRow227TriangleData1907.coefficient179_186,
  OriginalRow227TriangleData1907.coefficient179_187,
  OriginalRow227TriangleData1907.coefficient179_188,
  OriginalRow227TriangleData1907.coefficient179_189,
  OriginalRow227TriangleData1907.coefficient179_190,
  OriginalRow227TriangleData1907.coefficient179_191,
  OriginalRow227TriangleData1907.coefficient179_192,
  OriginalRow227TriangleData1907.coefficient179_193,
  OriginalRow227TriangleData1907.coefficient179_194,
  OriginalRow227TriangleData1907.coefficient179_195,
  OriginalRow227TriangleData1907.coefficient179_196,
  OriginalRow227TriangleData1907.coefficient179_197,
  OriginalRow227TriangleData1907.coefficient179_198,
  OriginalRow227TriangleData1907.coefficient179_199,
  OriginalRow227TriangleData1907.coefficient179_200,
  OriginalRow227TriangleData1907.coefficient179_201,
  OriginalRow227TriangleData1907.coefficient179_202,
  OriginalRow227TriangleData1907.coefficient179_203,
  OriginalRow227TriangleData1907.coefficient179_204,
  OriginalRow227TriangleData1907.coefficient179_205,
  OriginalRow227TriangleData1907.coefficient179_206,
  OriginalRow227TriangleData1907.coefficient179_207,
  OriginalRow227TriangleData1907.coefficient179_208,
  OriginalRow227TriangleData1907.coefficient179_209
]

theorem values1907_size : values1907.size = 32 := rfl

def block1907 : ℕ → Option IntervalDyadic := segment 178 values1907

theorem block1907_domain : ExactDomain block1907 178 210 := by
  simpa only [values1907_size] using segment_domain 178 values1907

theorem block1907_get (i : Fin 32) :
    block1907 (178 + i.val) = some (values1907[i.val]'(by rw [values1907_size]; exact i.isLt)) := by
  exact segment_get 178 values1907 ⟨i.val, by rw [values1907_size]; exact i.isLt⟩

def values1908 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1908.coefficient179_210,
  OriginalRow227TriangleData1908.coefficient179_211,
  OriginalRow227TriangleData1908.coefficient179_212,
  OriginalRow227TriangleData1908.coefficient179_213,
  OriginalRow227TriangleData1908.coefficient179_214,
  OriginalRow227TriangleData1908.coefficient179_215,
  OriginalRow227TriangleData1908.coefficient179_216,
  OriginalRow227TriangleData1908.coefficient179_217,
  OriginalRow227TriangleData1908.coefficient179_218,
  OriginalRow227TriangleData1908.coefficient179_219,
  OriginalRow227TriangleData1908.coefficient179_220,
  OriginalRow227TriangleData1908.coefficient179_221,
  OriginalRow227TriangleData1908.coefficient179_222,
  OriginalRow227TriangleData1908.coefficient179_223,
  OriginalRow227TriangleData1908.coefficient179_224,
  OriginalRow227TriangleData1908.coefficient179_225,
  OriginalRow227TriangleData1908.coefficient179_226,
  OriginalRow227TriangleData1908.coefficient179_227,
  OriginalRow227TriangleData1908.coefficient179_228,
  OriginalRow227TriangleData1908.coefficient179_229,
  OriginalRow227TriangleData1908.coefficient179_230,
  OriginalRow227TriangleData1908.coefficient179_231,
  OriginalRow227TriangleData1908.coefficient179_232,
  OriginalRow227TriangleData1908.coefficient179_233,
  OriginalRow227TriangleData1908.coefficient179_234,
  OriginalRow227TriangleData1908.coefficient179_235,
  OriginalRow227TriangleData1908.coefficient179_236,
  OriginalRow227TriangleData1908.coefficient179_237,
  OriginalRow227TriangleData1908.coefficient179_238,
  OriginalRow227TriangleData1908.coefficient179_239,
  OriginalRow227TriangleData1908.coefficient179_240,
  OriginalRow227TriangleData1908.coefficient179_241
]

theorem values1908_size : values1908.size = 32 := rfl

def block1908 : ℕ → Option IntervalDyadic := segment 210 values1908

theorem block1908_domain : ExactDomain block1908 210 242 := by
  simpa only [values1908_size] using segment_domain 210 values1908

theorem block1908_get (i : Fin 32) :
    block1908 (210 + i.val) = some (values1908[i.val]'(by rw [values1908_size]; exact i.isLt)) := by
  exact segment_get 210 values1908 ⟨i.val, by rw [values1908_size]; exact i.isLt⟩

def values1909 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1909.coefficient179_242,
  OriginalRow227TriangleData1909.coefficient179_243,
  OriginalRow227TriangleData1909.coefficient179_244,
  OriginalRow227TriangleData1909.coefficient179_245,
  OriginalRow227TriangleData1909.coefficient179_246,
  OriginalRow227TriangleData1909.coefficient179_247,
  OriginalRow227TriangleData1909.coefficient179_248,
  OriginalRow227TriangleData1909.coefficient179_249,
  OriginalRow227TriangleData1909.coefficient179_250,
  OriginalRow227TriangleData1909.coefficient179_251,
  OriginalRow227TriangleData1909.coefficient179_252,
  OriginalRow227TriangleData1909.coefficient179_253,
  OriginalRow227TriangleData1909.coefficient179_254,
  OriginalRow227TriangleData1909.coefficient179_255,
  OriginalRow227TriangleData1909.coefficient179_256,
  OriginalRow227TriangleData1909.coefficient179_257,
  OriginalRow227TriangleData1909.coefficient179_258,
  OriginalRow227TriangleData1909.coefficient179_259,
  OriginalRow227TriangleData1909.coefficient179_260,
  OriginalRow227TriangleData1909.coefficient179_261,
  OriginalRow227TriangleData1909.coefficient179_262,
  OriginalRow227TriangleData1909.coefficient179_263,
  OriginalRow227TriangleData1909.coefficient179_264,
  OriginalRow227TriangleData1909.coefficient179_265,
  OriginalRow227TriangleData1909.coefficient179_266,
  OriginalRow227TriangleData1909.coefficient179_267,
  OriginalRow227TriangleData1909.coefficient179_268,
  OriginalRow227TriangleData1909.coefficient179_269,
  OriginalRow227TriangleData1909.coefficient179_270,
  OriginalRow227TriangleData1909.coefficient179_271,
  OriginalRow227TriangleData1909.coefficient179_272,
  OriginalRow227TriangleData1909.coefficient179_273
]

theorem values1909_size : values1909.size = 32 := rfl

def block1909 : ℕ → Option IntervalDyadic := segment 242 values1909

theorem block1909_domain : ExactDomain block1909 242 274 := by
  simpa only [values1909_size] using segment_domain 242 values1909

theorem block1909_get (i : Fin 32) :
    block1909 (242 + i.val) = some (values1909[i.val]'(by rw [values1909_size]; exact i.isLt)) := by
  exact segment_get 242 values1909 ⟨i.val, by rw [values1909_size]; exact i.isLt⟩

def values1910 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1910.coefficient179_274,
  OriginalRow227TriangleData1910.coefficient179_275,
  OriginalRow227TriangleData1910.coefficient179_276,
  OriginalRow227TriangleData1910.coefficient179_277,
  OriginalRow227TriangleData1910.coefficient179_278,
  OriginalRow227TriangleData1910.coefficient179_279,
  OriginalRow227TriangleData1910.coefficient179_280,
  OriginalRow227TriangleData1910.coefficient179_281,
  OriginalRow227TriangleData1910.coefficient179_282,
  OriginalRow227TriangleData1910.coefficient179_283,
  OriginalRow227TriangleData1910.coefficient179_284,
  OriginalRow227TriangleData1910.coefficient179_285,
  OriginalRow227TriangleData1910.coefficient179_286,
  OriginalRow227TriangleData1910.coefficient179_287,
  OriginalRow227TriangleData1910.coefficient179_288,
  OriginalRow227TriangleData1910.coefficient179_289,
  OriginalRow227TriangleData1910.coefficient179_290,
  OriginalRow227TriangleData1910.coefficient179_291,
  OriginalRow227TriangleData1910.coefficient179_292,
  OriginalRow227TriangleData1910.coefficient179_293,
  OriginalRow227TriangleData1910.coefficient179_294,
  OriginalRow227TriangleData1910.coefficient179_295,
  OriginalRow227TriangleData1910.coefficient179_296,
  OriginalRow227TriangleData1910.coefficient179_297,
  OriginalRow227TriangleData1910.coefficient179_298,
  OriginalRow227TriangleData1910.coefficient179_299,
  OriginalRow227TriangleData1910.coefficient179_300,
  OriginalRow227TriangleData1910.coefficient179_301,
  OriginalRow227TriangleData1910.coefficient179_302,
  OriginalRow227TriangleData1910.coefficient179_303,
  OriginalRow227TriangleData1910.coefficient179_304,
  OriginalRow227TriangleData1910.coefficient179_305
]

theorem values1910_size : values1910.size = 32 := rfl

def block1910 : ℕ → Option IntervalDyadic := segment 274 values1910

theorem block1910_domain : ExactDomain block1910 274 306 := by
  simpa only [values1910_size] using segment_domain 274 values1910

theorem block1910_get (i : Fin 32) :
    block1910 (274 + i.val) = some (values1910[i.val]'(by rw [values1910_size]; exact i.isLt)) := by
  exact segment_get 274 values1910 ⟨i.val, by rw [values1910_size]; exact i.isLt⟩

def values1911 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1911.coefficient179_306,
  OriginalRow227TriangleData1911.coefficient179_307,
  OriginalRow227TriangleData1911.coefficient179_308,
  OriginalRow227TriangleData1911.coefficient179_309,
  OriginalRow227TriangleData1911.coefficient179_310,
  OriginalRow227TriangleData1911.coefficient179_311,
  OriginalRow227TriangleData1911.coefficient179_312,
  OriginalRow227TriangleData1911.coefficient179_313,
  OriginalRow227TriangleData1911.coefficient179_314,
  OriginalRow227TriangleData1911.coefficient179_315,
  OriginalRow227TriangleData1911.coefficient179_316,
  OriginalRow227TriangleData1911.coefficient179_317,
  OriginalRow227TriangleData1911.coefficient179_318,
  OriginalRow227TriangleData1911.coefficient179_319,
  OriginalRow227TriangleData1911.coefficient179_320,
  OriginalRow227TriangleData1911.coefficient179_321,
  OriginalRow227TriangleData1911.coefficient179_322
]

theorem values1911_size : values1911.size = 17 := rfl

def block1911 : ℕ → Option IntervalDyadic := segment 306 values1911

theorem block1911_domain : ExactDomain block1911 306 323 := by
  simpa only [values1911_size] using segment_domain 306 values1911

theorem block1911_get (i : Fin 17) :
    block1911 (306 + i.val) = some (values1911[i.val]'(by rw [values1911_size]; exact i.isLt)) := by
  exact segment_get 306 values1911 ⟨i.val, by rw [values1911_size]; exact i.isLt⟩

def node0178_0242 : ℕ → Option IntervalDyadic := split 210 block1907 block1908

theorem node0178_0242_domain : ExactDomain node0178_0242 178 242 := by
  exact split_domain (by decide) (by decide) block1907_domain block1908_domain

def node0274_0323 : ℕ → Option IntervalDyadic := split 306 block1910 block1911

theorem node0274_0323_domain : ExactDomain node0274_0323 274 323 := by
  exact split_domain (by decide) (by decide) block1910_domain block1911_domain

def node0242_0323 : ℕ → Option IntervalDyadic := split 274 block1909 node0274_0323

theorem node0242_0323_domain : ExactDomain node0242_0323 242 323 := by
  exact split_domain (by decide) (by decide) block1909_domain node0274_0323_domain

def node0178_0323 : ℕ → Option IntervalDyadic := split 242 node0178_0242 node0242_0323

theorem node0178_0323_domain : ExactDomain node0178_0323 178 323 := by
  exact split_domain (by decide) (by decide) node0178_0242_domain node0242_0323_domain

def lookup : ℕ → Option IntervalDyadic := node0178_0323

theorem lookup_domain : ExactDomain lookup 178 323 :=
  node0178_0323_domain

theorem block1907_lookup (i : Fin 32) :
    lookup (178 + i.val) = some (values1907[i.val]'(by rw [values1907_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0178_0323 (178 + i.val) = _
  rw [node0178_0323, split_left 242 node0178_0242 node0242_0323 (by omega)]
  rw [node0178_0242, split_left 210 block1907 block1908 (by omega)]
  exact block1907_get i

theorem block1908_lookup (i : Fin 32) :
    lookup (210 + i.val) = some (values1908[i.val]'(by rw [values1908_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0178_0323 (210 + i.val) = _
  rw [node0178_0323, split_left 242 node0178_0242 node0242_0323 (by omega)]
  rw [node0178_0242, split_right 210 block1907 block1908 (by omega)]
  exact block1908_get i

theorem block1909_lookup (i : Fin 32) :
    lookup (242 + i.val) = some (values1909[i.val]'(by rw [values1909_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0178_0323 (242 + i.val) = _
  rw [node0178_0323, split_right 242 node0178_0242 node0242_0323 (by omega)]
  rw [node0242_0323, split_left 274 block1909 node0274_0323 (by omega)]
  exact block1909_get i

theorem block1910_lookup (i : Fin 32) :
    lookup (274 + i.val) = some (values1910[i.val]'(by rw [values1910_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0178_0323 (274 + i.val) = _
  rw [node0178_0323, split_right 242 node0178_0242 node0242_0323 (by omega)]
  rw [node0242_0323, split_right 274 block1909 node0274_0323 (by omega)]
  rw [node0274_0323, split_left 306 block1910 block1911 (by omega)]
  exact block1910_get i

theorem block1911_lookup (i : Fin 17) :
    lookup (306 + i.val) = some (values1911[i.val]'(by rw [values1911_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0178_0323 (306 + i.val) = _
  rw [node0178_0323, split_right 242 node0178_0242 node0242_0323 (by omega)]
  rw [node0242_0323, split_right 274 block1909 node0274_0323 (by omega)]
  rw [node0274_0323, split_right 306 block1910 block1911 (by omega)]
  exact block1911_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1907_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1907_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1908_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1908_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1909_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1909_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1910_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1910_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1911_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1911_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1907_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1908_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1909_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1910_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow179.block1911_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow179
