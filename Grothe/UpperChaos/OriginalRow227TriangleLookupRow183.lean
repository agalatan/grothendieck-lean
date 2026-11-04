import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1927
import Grothe.UpperChaos.OriginalRow227TriangleData1928
import Grothe.UpperChaos.OriginalRow227TriangleData1929
import Grothe.UpperChaos.OriginalRow227TriangleData1930
import Grothe.UpperChaos.OriginalRow227TriangleData1931

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow183

open ConditionalTableLookup

def values1927 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1927.coefficient183_182,
  OriginalRow227TriangleData1927.coefficient183_183,
  OriginalRow227TriangleData1927.coefficient183_184,
  OriginalRow227TriangleData1927.coefficient183_185,
  OriginalRow227TriangleData1927.coefficient183_186,
  OriginalRow227TriangleData1927.coefficient183_187,
  OriginalRow227TriangleData1927.coefficient183_188,
  OriginalRow227TriangleData1927.coefficient183_189,
  OriginalRow227TriangleData1927.coefficient183_190,
  OriginalRow227TriangleData1927.coefficient183_191,
  OriginalRow227TriangleData1927.coefficient183_192,
  OriginalRow227TriangleData1927.coefficient183_193,
  OriginalRow227TriangleData1927.coefficient183_194,
  OriginalRow227TriangleData1927.coefficient183_195,
  OriginalRow227TriangleData1927.coefficient183_196,
  OriginalRow227TriangleData1927.coefficient183_197,
  OriginalRow227TriangleData1927.coefficient183_198,
  OriginalRow227TriangleData1927.coefficient183_199,
  OriginalRow227TriangleData1927.coefficient183_200,
  OriginalRow227TriangleData1927.coefficient183_201,
  OriginalRow227TriangleData1927.coefficient183_202,
  OriginalRow227TriangleData1927.coefficient183_203,
  OriginalRow227TriangleData1927.coefficient183_204,
  OriginalRow227TriangleData1927.coefficient183_205,
  OriginalRow227TriangleData1927.coefficient183_206,
  OriginalRow227TriangleData1927.coefficient183_207,
  OriginalRow227TriangleData1927.coefficient183_208,
  OriginalRow227TriangleData1927.coefficient183_209,
  OriginalRow227TriangleData1927.coefficient183_210,
  OriginalRow227TriangleData1927.coefficient183_211,
  OriginalRow227TriangleData1927.coefficient183_212,
  OriginalRow227TriangleData1927.coefficient183_213
]

theorem values1927_size : values1927.size = 32 := rfl

def block1927 : ℕ → Option IntervalDyadic := segment 182 values1927

theorem block1927_domain : ExactDomain block1927 182 214 := by
  simpa only [values1927_size] using segment_domain 182 values1927

theorem block1927_get (i : Fin 32) :
    block1927 (182 + i.val) = some (values1927[i.val]'(by rw [values1927_size]; exact i.isLt)) := by
  exact segment_get 182 values1927 ⟨i.val, by rw [values1927_size]; exact i.isLt⟩

def values1928 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1928.coefficient183_214,
  OriginalRow227TriangleData1928.coefficient183_215,
  OriginalRow227TriangleData1928.coefficient183_216,
  OriginalRow227TriangleData1928.coefficient183_217,
  OriginalRow227TriangleData1928.coefficient183_218,
  OriginalRow227TriangleData1928.coefficient183_219,
  OriginalRow227TriangleData1928.coefficient183_220,
  OriginalRow227TriangleData1928.coefficient183_221,
  OriginalRow227TriangleData1928.coefficient183_222,
  OriginalRow227TriangleData1928.coefficient183_223,
  OriginalRow227TriangleData1928.coefficient183_224,
  OriginalRow227TriangleData1928.coefficient183_225,
  OriginalRow227TriangleData1928.coefficient183_226,
  OriginalRow227TriangleData1928.coefficient183_227,
  OriginalRow227TriangleData1928.coefficient183_228,
  OriginalRow227TriangleData1928.coefficient183_229,
  OriginalRow227TriangleData1928.coefficient183_230,
  OriginalRow227TriangleData1928.coefficient183_231,
  OriginalRow227TriangleData1928.coefficient183_232,
  OriginalRow227TriangleData1928.coefficient183_233,
  OriginalRow227TriangleData1928.coefficient183_234,
  OriginalRow227TriangleData1928.coefficient183_235,
  OriginalRow227TriangleData1928.coefficient183_236,
  OriginalRow227TriangleData1928.coefficient183_237,
  OriginalRow227TriangleData1928.coefficient183_238,
  OriginalRow227TriangleData1928.coefficient183_239,
  OriginalRow227TriangleData1928.coefficient183_240,
  OriginalRow227TriangleData1928.coefficient183_241,
  OriginalRow227TriangleData1928.coefficient183_242,
  OriginalRow227TriangleData1928.coefficient183_243,
  OriginalRow227TriangleData1928.coefficient183_244,
  OriginalRow227TriangleData1928.coefficient183_245
]

theorem values1928_size : values1928.size = 32 := rfl

def block1928 : ℕ → Option IntervalDyadic := segment 214 values1928

theorem block1928_domain : ExactDomain block1928 214 246 := by
  simpa only [values1928_size] using segment_domain 214 values1928

theorem block1928_get (i : Fin 32) :
    block1928 (214 + i.val) = some (values1928[i.val]'(by rw [values1928_size]; exact i.isLt)) := by
  exact segment_get 214 values1928 ⟨i.val, by rw [values1928_size]; exact i.isLt⟩

def values1929 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1929.coefficient183_246,
  OriginalRow227TriangleData1929.coefficient183_247,
  OriginalRow227TriangleData1929.coefficient183_248,
  OriginalRow227TriangleData1929.coefficient183_249,
  OriginalRow227TriangleData1929.coefficient183_250,
  OriginalRow227TriangleData1929.coefficient183_251,
  OriginalRow227TriangleData1929.coefficient183_252,
  OriginalRow227TriangleData1929.coefficient183_253,
  OriginalRow227TriangleData1929.coefficient183_254,
  OriginalRow227TriangleData1929.coefficient183_255,
  OriginalRow227TriangleData1929.coefficient183_256,
  OriginalRow227TriangleData1929.coefficient183_257,
  OriginalRow227TriangleData1929.coefficient183_258,
  OriginalRow227TriangleData1929.coefficient183_259,
  OriginalRow227TriangleData1929.coefficient183_260,
  OriginalRow227TriangleData1929.coefficient183_261,
  OriginalRow227TriangleData1929.coefficient183_262,
  OriginalRow227TriangleData1929.coefficient183_263,
  OriginalRow227TriangleData1929.coefficient183_264,
  OriginalRow227TriangleData1929.coefficient183_265,
  OriginalRow227TriangleData1929.coefficient183_266,
  OriginalRow227TriangleData1929.coefficient183_267,
  OriginalRow227TriangleData1929.coefficient183_268,
  OriginalRow227TriangleData1929.coefficient183_269,
  OriginalRow227TriangleData1929.coefficient183_270,
  OriginalRow227TriangleData1929.coefficient183_271,
  OriginalRow227TriangleData1929.coefficient183_272,
  OriginalRow227TriangleData1929.coefficient183_273,
  OriginalRow227TriangleData1929.coefficient183_274,
  OriginalRow227TriangleData1929.coefficient183_275,
  OriginalRow227TriangleData1929.coefficient183_276,
  OriginalRow227TriangleData1929.coefficient183_277
]

theorem values1929_size : values1929.size = 32 := rfl

def block1929 : ℕ → Option IntervalDyadic := segment 246 values1929

theorem block1929_domain : ExactDomain block1929 246 278 := by
  simpa only [values1929_size] using segment_domain 246 values1929

theorem block1929_get (i : Fin 32) :
    block1929 (246 + i.val) = some (values1929[i.val]'(by rw [values1929_size]; exact i.isLt)) := by
  exact segment_get 246 values1929 ⟨i.val, by rw [values1929_size]; exact i.isLt⟩

def values1930 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1930.coefficient183_278,
  OriginalRow227TriangleData1930.coefficient183_279,
  OriginalRow227TriangleData1930.coefficient183_280,
  OriginalRow227TriangleData1930.coefficient183_281,
  OriginalRow227TriangleData1930.coefficient183_282,
  OriginalRow227TriangleData1930.coefficient183_283,
  OriginalRow227TriangleData1930.coefficient183_284,
  OriginalRow227TriangleData1930.coefficient183_285,
  OriginalRow227TriangleData1930.coefficient183_286,
  OriginalRow227TriangleData1930.coefficient183_287,
  OriginalRow227TriangleData1930.coefficient183_288,
  OriginalRow227TriangleData1930.coefficient183_289,
  OriginalRow227TriangleData1930.coefficient183_290,
  OriginalRow227TriangleData1930.coefficient183_291,
  OriginalRow227TriangleData1930.coefficient183_292,
  OriginalRow227TriangleData1930.coefficient183_293,
  OriginalRow227TriangleData1930.coefficient183_294,
  OriginalRow227TriangleData1930.coefficient183_295,
  OriginalRow227TriangleData1930.coefficient183_296,
  OriginalRow227TriangleData1930.coefficient183_297,
  OriginalRow227TriangleData1930.coefficient183_298,
  OriginalRow227TriangleData1930.coefficient183_299,
  OriginalRow227TriangleData1930.coefficient183_300,
  OriginalRow227TriangleData1930.coefficient183_301,
  OriginalRow227TriangleData1930.coefficient183_302,
  OriginalRow227TriangleData1930.coefficient183_303,
  OriginalRow227TriangleData1930.coefficient183_304,
  OriginalRow227TriangleData1930.coefficient183_305,
  OriginalRow227TriangleData1930.coefficient183_306,
  OriginalRow227TriangleData1930.coefficient183_307,
  OriginalRow227TriangleData1930.coefficient183_308,
  OriginalRow227TriangleData1930.coefficient183_309
]

theorem values1930_size : values1930.size = 32 := rfl

def block1930 : ℕ → Option IntervalDyadic := segment 278 values1930

theorem block1930_domain : ExactDomain block1930 278 310 := by
  simpa only [values1930_size] using segment_domain 278 values1930

theorem block1930_get (i : Fin 32) :
    block1930 (278 + i.val) = some (values1930[i.val]'(by rw [values1930_size]; exact i.isLt)) := by
  exact segment_get 278 values1930 ⟨i.val, by rw [values1930_size]; exact i.isLt⟩

def values1931 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1931.coefficient183_310,
  OriginalRow227TriangleData1931.coefficient183_311,
  OriginalRow227TriangleData1931.coefficient183_312,
  OriginalRow227TriangleData1931.coefficient183_313,
  OriginalRow227TriangleData1931.coefficient183_314,
  OriginalRow227TriangleData1931.coefficient183_315,
  OriginalRow227TriangleData1931.coefficient183_316,
  OriginalRow227TriangleData1931.coefficient183_317,
  OriginalRow227TriangleData1931.coefficient183_318
]

theorem values1931_size : values1931.size = 9 := rfl

def block1931 : ℕ → Option IntervalDyadic := segment 310 values1931

theorem block1931_domain : ExactDomain block1931 310 319 := by
  simpa only [values1931_size] using segment_domain 310 values1931

theorem block1931_get (i : Fin 9) :
    block1931 (310 + i.val) = some (values1931[i.val]'(by rw [values1931_size]; exact i.isLt)) := by
  exact segment_get 310 values1931 ⟨i.val, by rw [values1931_size]; exact i.isLt⟩

def node0182_0246 : ℕ → Option IntervalDyadic := split 214 block1927 block1928

theorem node0182_0246_domain : ExactDomain node0182_0246 182 246 := by
  exact split_domain (by decide) (by decide) block1927_domain block1928_domain

def node0278_0319 : ℕ → Option IntervalDyadic := split 310 block1930 block1931

theorem node0278_0319_domain : ExactDomain node0278_0319 278 319 := by
  exact split_domain (by decide) (by decide) block1930_domain block1931_domain

def node0246_0319 : ℕ → Option IntervalDyadic := split 278 block1929 node0278_0319

theorem node0246_0319_domain : ExactDomain node0246_0319 246 319 := by
  exact split_domain (by decide) (by decide) block1929_domain node0278_0319_domain

def node0182_0319 : ℕ → Option IntervalDyadic := split 246 node0182_0246 node0246_0319

theorem node0182_0319_domain : ExactDomain node0182_0319 182 319 := by
  exact split_domain (by decide) (by decide) node0182_0246_domain node0246_0319_domain

def lookup : ℕ → Option IntervalDyadic := node0182_0319

theorem lookup_domain : ExactDomain lookup 182 319 :=
  node0182_0319_domain

theorem block1927_lookup (i : Fin 32) :
    lookup (182 + i.val) = some (values1927[i.val]'(by rw [values1927_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0182_0319 (182 + i.val) = _
  rw [node0182_0319, split_left 246 node0182_0246 node0246_0319 (by omega)]
  rw [node0182_0246, split_left 214 block1927 block1928 (by omega)]
  exact block1927_get i

theorem block1928_lookup (i : Fin 32) :
    lookup (214 + i.val) = some (values1928[i.val]'(by rw [values1928_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0182_0319 (214 + i.val) = _
  rw [node0182_0319, split_left 246 node0182_0246 node0246_0319 (by omega)]
  rw [node0182_0246, split_right 214 block1927 block1928 (by omega)]
  exact block1928_get i

theorem block1929_lookup (i : Fin 32) :
    lookup (246 + i.val) = some (values1929[i.val]'(by rw [values1929_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0182_0319 (246 + i.val) = _
  rw [node0182_0319, split_right 246 node0182_0246 node0246_0319 (by omega)]
  rw [node0246_0319, split_left 278 block1929 node0278_0319 (by omega)]
  exact block1929_get i

theorem block1930_lookup (i : Fin 32) :
    lookup (278 + i.val) = some (values1930[i.val]'(by rw [values1930_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0182_0319 (278 + i.val) = _
  rw [node0182_0319, split_right 246 node0182_0246 node0246_0319 (by omega)]
  rw [node0246_0319, split_right 278 block1929 node0278_0319 (by omega)]
  rw [node0278_0319, split_left 310 block1930 block1931 (by omega)]
  exact block1930_get i

theorem block1931_lookup (i : Fin 9) :
    lookup (310 + i.val) = some (values1931[i.val]'(by rw [values1931_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0182_0319 (310 + i.val) = _
  rw [node0182_0319, split_right 246 node0182_0246 node0246_0319 (by omega)]
  rw [node0246_0319, split_right 278 block1929 node0278_0319 (by omega)]
  rw [node0278_0319, split_right 310 block1930 block1931 (by omega)]
  exact block1931_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1927_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1927_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1928_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1928_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1929_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1929_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1930_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1930_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1931_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1931_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1927_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1928_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1929_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1930_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow183.block1931_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow183
