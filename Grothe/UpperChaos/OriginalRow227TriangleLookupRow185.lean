import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1937
import Grothe.UpperChaos.OriginalRow227TriangleData1938
import Grothe.UpperChaos.OriginalRow227TriangleData1939
import Grothe.UpperChaos.OriginalRow227TriangleData1940
import Grothe.UpperChaos.OriginalRow227TriangleData1941

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow185

open ConditionalTableLookup

def values1937 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1937.coefficient185_184,
  OriginalRow227TriangleData1937.coefficient185_185,
  OriginalRow227TriangleData1937.coefficient185_186,
  OriginalRow227TriangleData1937.coefficient185_187,
  OriginalRow227TriangleData1937.coefficient185_188,
  OriginalRow227TriangleData1937.coefficient185_189,
  OriginalRow227TriangleData1937.coefficient185_190,
  OriginalRow227TriangleData1937.coefficient185_191,
  OriginalRow227TriangleData1937.coefficient185_192,
  OriginalRow227TriangleData1937.coefficient185_193,
  OriginalRow227TriangleData1937.coefficient185_194,
  OriginalRow227TriangleData1937.coefficient185_195,
  OriginalRow227TriangleData1937.coefficient185_196,
  OriginalRow227TriangleData1937.coefficient185_197,
  OriginalRow227TriangleData1937.coefficient185_198,
  OriginalRow227TriangleData1937.coefficient185_199,
  OriginalRow227TriangleData1937.coefficient185_200,
  OriginalRow227TriangleData1937.coefficient185_201,
  OriginalRow227TriangleData1937.coefficient185_202,
  OriginalRow227TriangleData1937.coefficient185_203,
  OriginalRow227TriangleData1937.coefficient185_204,
  OriginalRow227TriangleData1937.coefficient185_205,
  OriginalRow227TriangleData1937.coefficient185_206,
  OriginalRow227TriangleData1937.coefficient185_207,
  OriginalRow227TriangleData1937.coefficient185_208,
  OriginalRow227TriangleData1937.coefficient185_209,
  OriginalRow227TriangleData1937.coefficient185_210,
  OriginalRow227TriangleData1937.coefficient185_211,
  OriginalRow227TriangleData1937.coefficient185_212,
  OriginalRow227TriangleData1937.coefficient185_213,
  OriginalRow227TriangleData1937.coefficient185_214,
  OriginalRow227TriangleData1937.coefficient185_215
]

theorem values1937_size : values1937.size = 32 := rfl

def block1937 : ℕ → Option IntervalDyadic := segment 184 values1937

theorem block1937_domain : ExactDomain block1937 184 216 := by
  simpa only [values1937_size] using segment_domain 184 values1937

theorem block1937_get (i : Fin 32) :
    block1937 (184 + i.val) = some (values1937[i.val]'(by rw [values1937_size]; exact i.isLt)) := by
  exact segment_get 184 values1937 ⟨i.val, by rw [values1937_size]; exact i.isLt⟩

def values1938 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1938.coefficient185_216,
  OriginalRow227TriangleData1938.coefficient185_217,
  OriginalRow227TriangleData1938.coefficient185_218,
  OriginalRow227TriangleData1938.coefficient185_219,
  OriginalRow227TriangleData1938.coefficient185_220,
  OriginalRow227TriangleData1938.coefficient185_221,
  OriginalRow227TriangleData1938.coefficient185_222,
  OriginalRow227TriangleData1938.coefficient185_223,
  OriginalRow227TriangleData1938.coefficient185_224,
  OriginalRow227TriangleData1938.coefficient185_225,
  OriginalRow227TriangleData1938.coefficient185_226,
  OriginalRow227TriangleData1938.coefficient185_227,
  OriginalRow227TriangleData1938.coefficient185_228,
  OriginalRow227TriangleData1938.coefficient185_229,
  OriginalRow227TriangleData1938.coefficient185_230,
  OriginalRow227TriangleData1938.coefficient185_231,
  OriginalRow227TriangleData1938.coefficient185_232,
  OriginalRow227TriangleData1938.coefficient185_233,
  OriginalRow227TriangleData1938.coefficient185_234,
  OriginalRow227TriangleData1938.coefficient185_235,
  OriginalRow227TriangleData1938.coefficient185_236,
  OriginalRow227TriangleData1938.coefficient185_237,
  OriginalRow227TriangleData1938.coefficient185_238,
  OriginalRow227TriangleData1938.coefficient185_239,
  OriginalRow227TriangleData1938.coefficient185_240,
  OriginalRow227TriangleData1938.coefficient185_241,
  OriginalRow227TriangleData1938.coefficient185_242,
  OriginalRow227TriangleData1938.coefficient185_243,
  OriginalRow227TriangleData1938.coefficient185_244,
  OriginalRow227TriangleData1938.coefficient185_245,
  OriginalRow227TriangleData1938.coefficient185_246,
  OriginalRow227TriangleData1938.coefficient185_247
]

theorem values1938_size : values1938.size = 32 := rfl

def block1938 : ℕ → Option IntervalDyadic := segment 216 values1938

theorem block1938_domain : ExactDomain block1938 216 248 := by
  simpa only [values1938_size] using segment_domain 216 values1938

theorem block1938_get (i : Fin 32) :
    block1938 (216 + i.val) = some (values1938[i.val]'(by rw [values1938_size]; exact i.isLt)) := by
  exact segment_get 216 values1938 ⟨i.val, by rw [values1938_size]; exact i.isLt⟩

def values1939 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1939.coefficient185_248,
  OriginalRow227TriangleData1939.coefficient185_249,
  OriginalRow227TriangleData1939.coefficient185_250,
  OriginalRow227TriangleData1939.coefficient185_251,
  OriginalRow227TriangleData1939.coefficient185_252,
  OriginalRow227TriangleData1939.coefficient185_253,
  OriginalRow227TriangleData1939.coefficient185_254,
  OriginalRow227TriangleData1939.coefficient185_255,
  OriginalRow227TriangleData1939.coefficient185_256,
  OriginalRow227TriangleData1939.coefficient185_257,
  OriginalRow227TriangleData1939.coefficient185_258,
  OriginalRow227TriangleData1939.coefficient185_259,
  OriginalRow227TriangleData1939.coefficient185_260,
  OriginalRow227TriangleData1939.coefficient185_261,
  OriginalRow227TriangleData1939.coefficient185_262,
  OriginalRow227TriangleData1939.coefficient185_263,
  OriginalRow227TriangleData1939.coefficient185_264,
  OriginalRow227TriangleData1939.coefficient185_265,
  OriginalRow227TriangleData1939.coefficient185_266,
  OriginalRow227TriangleData1939.coefficient185_267,
  OriginalRow227TriangleData1939.coefficient185_268,
  OriginalRow227TriangleData1939.coefficient185_269,
  OriginalRow227TriangleData1939.coefficient185_270,
  OriginalRow227TriangleData1939.coefficient185_271,
  OriginalRow227TriangleData1939.coefficient185_272,
  OriginalRow227TriangleData1939.coefficient185_273,
  OriginalRow227TriangleData1939.coefficient185_274,
  OriginalRow227TriangleData1939.coefficient185_275,
  OriginalRow227TriangleData1939.coefficient185_276,
  OriginalRow227TriangleData1939.coefficient185_277,
  OriginalRow227TriangleData1939.coefficient185_278,
  OriginalRow227TriangleData1939.coefficient185_279
]

theorem values1939_size : values1939.size = 32 := rfl

def block1939 : ℕ → Option IntervalDyadic := segment 248 values1939

theorem block1939_domain : ExactDomain block1939 248 280 := by
  simpa only [values1939_size] using segment_domain 248 values1939

theorem block1939_get (i : Fin 32) :
    block1939 (248 + i.val) = some (values1939[i.val]'(by rw [values1939_size]; exact i.isLt)) := by
  exact segment_get 248 values1939 ⟨i.val, by rw [values1939_size]; exact i.isLt⟩

def values1940 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1940.coefficient185_280,
  OriginalRow227TriangleData1940.coefficient185_281,
  OriginalRow227TriangleData1940.coefficient185_282,
  OriginalRow227TriangleData1940.coefficient185_283,
  OriginalRow227TriangleData1940.coefficient185_284,
  OriginalRow227TriangleData1940.coefficient185_285,
  OriginalRow227TriangleData1940.coefficient185_286,
  OriginalRow227TriangleData1940.coefficient185_287,
  OriginalRow227TriangleData1940.coefficient185_288,
  OriginalRow227TriangleData1940.coefficient185_289,
  OriginalRow227TriangleData1940.coefficient185_290,
  OriginalRow227TriangleData1940.coefficient185_291,
  OriginalRow227TriangleData1940.coefficient185_292,
  OriginalRow227TriangleData1940.coefficient185_293,
  OriginalRow227TriangleData1940.coefficient185_294,
  OriginalRow227TriangleData1940.coefficient185_295,
  OriginalRow227TriangleData1940.coefficient185_296,
  OriginalRow227TriangleData1940.coefficient185_297,
  OriginalRow227TriangleData1940.coefficient185_298,
  OriginalRow227TriangleData1940.coefficient185_299,
  OriginalRow227TriangleData1940.coefficient185_300,
  OriginalRow227TriangleData1940.coefficient185_301,
  OriginalRow227TriangleData1940.coefficient185_302,
  OriginalRow227TriangleData1940.coefficient185_303,
  OriginalRow227TriangleData1940.coefficient185_304,
  OriginalRow227TriangleData1940.coefficient185_305,
  OriginalRow227TriangleData1940.coefficient185_306,
  OriginalRow227TriangleData1940.coefficient185_307,
  OriginalRow227TriangleData1940.coefficient185_308,
  OriginalRow227TriangleData1940.coefficient185_309,
  OriginalRow227TriangleData1940.coefficient185_310,
  OriginalRow227TriangleData1940.coefficient185_311
]

theorem values1940_size : values1940.size = 32 := rfl

def block1940 : ℕ → Option IntervalDyadic := segment 280 values1940

theorem block1940_domain : ExactDomain block1940 280 312 := by
  simpa only [values1940_size] using segment_domain 280 values1940

theorem block1940_get (i : Fin 32) :
    block1940 (280 + i.val) = some (values1940[i.val]'(by rw [values1940_size]; exact i.isLt)) := by
  exact segment_get 280 values1940 ⟨i.val, by rw [values1940_size]; exact i.isLt⟩

def values1941 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1941.coefficient185_312,
  OriginalRow227TriangleData1941.coefficient185_313,
  OriginalRow227TriangleData1941.coefficient185_314,
  OriginalRow227TriangleData1941.coefficient185_315,
  OriginalRow227TriangleData1941.coefficient185_316
]

theorem values1941_size : values1941.size = 5 := rfl

def block1941 : ℕ → Option IntervalDyadic := segment 312 values1941

theorem block1941_domain : ExactDomain block1941 312 317 := by
  simpa only [values1941_size] using segment_domain 312 values1941

theorem block1941_get (i : Fin 5) :
    block1941 (312 + i.val) = some (values1941[i.val]'(by rw [values1941_size]; exact i.isLt)) := by
  exact segment_get 312 values1941 ⟨i.val, by rw [values1941_size]; exact i.isLt⟩

def node0184_0248 : ℕ → Option IntervalDyadic := split 216 block1937 block1938

theorem node0184_0248_domain : ExactDomain node0184_0248 184 248 := by
  exact split_domain (by decide) (by decide) block1937_domain block1938_domain

def node0280_0317 : ℕ → Option IntervalDyadic := split 312 block1940 block1941

theorem node0280_0317_domain : ExactDomain node0280_0317 280 317 := by
  exact split_domain (by decide) (by decide) block1940_domain block1941_domain

def node0248_0317 : ℕ → Option IntervalDyadic := split 280 block1939 node0280_0317

theorem node0248_0317_domain : ExactDomain node0248_0317 248 317 := by
  exact split_domain (by decide) (by decide) block1939_domain node0280_0317_domain

def node0184_0317 : ℕ → Option IntervalDyadic := split 248 node0184_0248 node0248_0317

theorem node0184_0317_domain : ExactDomain node0184_0317 184 317 := by
  exact split_domain (by decide) (by decide) node0184_0248_domain node0248_0317_domain

def lookup : ℕ → Option IntervalDyadic := node0184_0317

theorem lookup_domain : ExactDomain lookup 184 317 :=
  node0184_0317_domain

theorem block1937_lookup (i : Fin 32) :
    lookup (184 + i.val) = some (values1937[i.val]'(by rw [values1937_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0184_0317 (184 + i.val) = _
  rw [node0184_0317, split_left 248 node0184_0248 node0248_0317 (by omega)]
  rw [node0184_0248, split_left 216 block1937 block1938 (by omega)]
  exact block1937_get i

theorem block1938_lookup (i : Fin 32) :
    lookup (216 + i.val) = some (values1938[i.val]'(by rw [values1938_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0184_0317 (216 + i.val) = _
  rw [node0184_0317, split_left 248 node0184_0248 node0248_0317 (by omega)]
  rw [node0184_0248, split_right 216 block1937 block1938 (by omega)]
  exact block1938_get i

theorem block1939_lookup (i : Fin 32) :
    lookup (248 + i.val) = some (values1939[i.val]'(by rw [values1939_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0184_0317 (248 + i.val) = _
  rw [node0184_0317, split_right 248 node0184_0248 node0248_0317 (by omega)]
  rw [node0248_0317, split_left 280 block1939 node0280_0317 (by omega)]
  exact block1939_get i

theorem block1940_lookup (i : Fin 32) :
    lookup (280 + i.val) = some (values1940[i.val]'(by rw [values1940_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0184_0317 (280 + i.val) = _
  rw [node0184_0317, split_right 248 node0184_0248 node0248_0317 (by omega)]
  rw [node0248_0317, split_right 280 block1939 node0280_0317 (by omega)]
  rw [node0280_0317, split_left 312 block1940 block1941 (by omega)]
  exact block1940_get i

theorem block1941_lookup (i : Fin 5) :
    lookup (312 + i.val) = some (values1941[i.val]'(by rw [values1941_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0184_0317 (312 + i.val) = _
  rw [node0184_0317, split_right 248 node0184_0248 node0248_0317 (by omega)]
  rw [node0248_0317, split_right 280 block1939 node0280_0317 (by omega)]
  rw [node0280_0317, split_right 312 block1940 block1941 (by omega)]
  exact block1941_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1937_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1937_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1938_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1938_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1939_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1939_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1940_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1940_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1941_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1941_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1937_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1938_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1939_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1940_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow185.block1941_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow185
