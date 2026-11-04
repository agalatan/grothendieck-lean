import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1877
import Grothe.UpperChaos.OriginalRow227TriangleData1878
import Grothe.UpperChaos.OriginalRow227TriangleData1879
import Grothe.UpperChaos.OriginalRow227TriangleData1880
import Grothe.UpperChaos.OriginalRow227TriangleData1881

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow173

open ConditionalTableLookup

def values1877 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1877.coefficient173_172,
  OriginalRow227TriangleData1877.coefficient173_173,
  OriginalRow227TriangleData1877.coefficient173_174,
  OriginalRow227TriangleData1877.coefficient173_175,
  OriginalRow227TriangleData1877.coefficient173_176,
  OriginalRow227TriangleData1877.coefficient173_177,
  OriginalRow227TriangleData1877.coefficient173_178,
  OriginalRow227TriangleData1877.coefficient173_179,
  OriginalRow227TriangleData1877.coefficient173_180,
  OriginalRow227TriangleData1877.coefficient173_181,
  OriginalRow227TriangleData1877.coefficient173_182,
  OriginalRow227TriangleData1877.coefficient173_183,
  OriginalRow227TriangleData1877.coefficient173_184,
  OriginalRow227TriangleData1877.coefficient173_185,
  OriginalRow227TriangleData1877.coefficient173_186,
  OriginalRow227TriangleData1877.coefficient173_187,
  OriginalRow227TriangleData1877.coefficient173_188,
  OriginalRow227TriangleData1877.coefficient173_189,
  OriginalRow227TriangleData1877.coefficient173_190,
  OriginalRow227TriangleData1877.coefficient173_191,
  OriginalRow227TriangleData1877.coefficient173_192,
  OriginalRow227TriangleData1877.coefficient173_193,
  OriginalRow227TriangleData1877.coefficient173_194,
  OriginalRow227TriangleData1877.coefficient173_195,
  OriginalRow227TriangleData1877.coefficient173_196,
  OriginalRow227TriangleData1877.coefficient173_197,
  OriginalRow227TriangleData1877.coefficient173_198,
  OriginalRow227TriangleData1877.coefficient173_199,
  OriginalRow227TriangleData1877.coefficient173_200,
  OriginalRow227TriangleData1877.coefficient173_201,
  OriginalRow227TriangleData1877.coefficient173_202,
  OriginalRow227TriangleData1877.coefficient173_203
]

theorem values1877_size : values1877.size = 32 := rfl

def block1877 : ℕ → Option IntervalDyadic := segment 172 values1877

theorem block1877_domain : ExactDomain block1877 172 204 := by
  simpa only [values1877_size] using segment_domain 172 values1877

theorem block1877_get (i : Fin 32) :
    block1877 (172 + i.val) = some (values1877[i.val]'(by rw [values1877_size]; exact i.isLt)) := by
  exact segment_get 172 values1877 ⟨i.val, by rw [values1877_size]; exact i.isLt⟩

def values1878 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1878.coefficient173_204,
  OriginalRow227TriangleData1878.coefficient173_205,
  OriginalRow227TriangleData1878.coefficient173_206,
  OriginalRow227TriangleData1878.coefficient173_207,
  OriginalRow227TriangleData1878.coefficient173_208,
  OriginalRow227TriangleData1878.coefficient173_209,
  OriginalRow227TriangleData1878.coefficient173_210,
  OriginalRow227TriangleData1878.coefficient173_211,
  OriginalRow227TriangleData1878.coefficient173_212,
  OriginalRow227TriangleData1878.coefficient173_213,
  OriginalRow227TriangleData1878.coefficient173_214,
  OriginalRow227TriangleData1878.coefficient173_215,
  OriginalRow227TriangleData1878.coefficient173_216,
  OriginalRow227TriangleData1878.coefficient173_217,
  OriginalRow227TriangleData1878.coefficient173_218,
  OriginalRow227TriangleData1878.coefficient173_219,
  OriginalRow227TriangleData1878.coefficient173_220,
  OriginalRow227TriangleData1878.coefficient173_221,
  OriginalRow227TriangleData1878.coefficient173_222,
  OriginalRow227TriangleData1878.coefficient173_223,
  OriginalRow227TriangleData1878.coefficient173_224,
  OriginalRow227TriangleData1878.coefficient173_225,
  OriginalRow227TriangleData1878.coefficient173_226,
  OriginalRow227TriangleData1878.coefficient173_227,
  OriginalRow227TriangleData1878.coefficient173_228,
  OriginalRow227TriangleData1878.coefficient173_229,
  OriginalRow227TriangleData1878.coefficient173_230,
  OriginalRow227TriangleData1878.coefficient173_231,
  OriginalRow227TriangleData1878.coefficient173_232,
  OriginalRow227TriangleData1878.coefficient173_233,
  OriginalRow227TriangleData1878.coefficient173_234,
  OriginalRow227TriangleData1878.coefficient173_235
]

theorem values1878_size : values1878.size = 32 := rfl

def block1878 : ℕ → Option IntervalDyadic := segment 204 values1878

theorem block1878_domain : ExactDomain block1878 204 236 := by
  simpa only [values1878_size] using segment_domain 204 values1878

theorem block1878_get (i : Fin 32) :
    block1878 (204 + i.val) = some (values1878[i.val]'(by rw [values1878_size]; exact i.isLt)) := by
  exact segment_get 204 values1878 ⟨i.val, by rw [values1878_size]; exact i.isLt⟩

def values1879 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1879.coefficient173_236,
  OriginalRow227TriangleData1879.coefficient173_237,
  OriginalRow227TriangleData1879.coefficient173_238,
  OriginalRow227TriangleData1879.coefficient173_239,
  OriginalRow227TriangleData1879.coefficient173_240,
  OriginalRow227TriangleData1879.coefficient173_241,
  OriginalRow227TriangleData1879.coefficient173_242,
  OriginalRow227TriangleData1879.coefficient173_243,
  OriginalRow227TriangleData1879.coefficient173_244,
  OriginalRow227TriangleData1879.coefficient173_245,
  OriginalRow227TriangleData1879.coefficient173_246,
  OriginalRow227TriangleData1879.coefficient173_247,
  OriginalRow227TriangleData1879.coefficient173_248,
  OriginalRow227TriangleData1879.coefficient173_249,
  OriginalRow227TriangleData1879.coefficient173_250,
  OriginalRow227TriangleData1879.coefficient173_251,
  OriginalRow227TriangleData1879.coefficient173_252,
  OriginalRow227TriangleData1879.coefficient173_253,
  OriginalRow227TriangleData1879.coefficient173_254,
  OriginalRow227TriangleData1879.coefficient173_255,
  OriginalRow227TriangleData1879.coefficient173_256,
  OriginalRow227TriangleData1879.coefficient173_257,
  OriginalRow227TriangleData1879.coefficient173_258,
  OriginalRow227TriangleData1879.coefficient173_259,
  OriginalRow227TriangleData1879.coefficient173_260,
  OriginalRow227TriangleData1879.coefficient173_261,
  OriginalRow227TriangleData1879.coefficient173_262,
  OriginalRow227TriangleData1879.coefficient173_263,
  OriginalRow227TriangleData1879.coefficient173_264,
  OriginalRow227TriangleData1879.coefficient173_265,
  OriginalRow227TriangleData1879.coefficient173_266,
  OriginalRow227TriangleData1879.coefficient173_267
]

theorem values1879_size : values1879.size = 32 := rfl

def block1879 : ℕ → Option IntervalDyadic := segment 236 values1879

theorem block1879_domain : ExactDomain block1879 236 268 := by
  simpa only [values1879_size] using segment_domain 236 values1879

theorem block1879_get (i : Fin 32) :
    block1879 (236 + i.val) = some (values1879[i.val]'(by rw [values1879_size]; exact i.isLt)) := by
  exact segment_get 236 values1879 ⟨i.val, by rw [values1879_size]; exact i.isLt⟩

def values1880 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1880.coefficient173_268,
  OriginalRow227TriangleData1880.coefficient173_269,
  OriginalRow227TriangleData1880.coefficient173_270,
  OriginalRow227TriangleData1880.coefficient173_271,
  OriginalRow227TriangleData1880.coefficient173_272,
  OriginalRow227TriangleData1880.coefficient173_273,
  OriginalRow227TriangleData1880.coefficient173_274,
  OriginalRow227TriangleData1880.coefficient173_275,
  OriginalRow227TriangleData1880.coefficient173_276,
  OriginalRow227TriangleData1880.coefficient173_277,
  OriginalRow227TriangleData1880.coefficient173_278,
  OriginalRow227TriangleData1880.coefficient173_279,
  OriginalRow227TriangleData1880.coefficient173_280,
  OriginalRow227TriangleData1880.coefficient173_281,
  OriginalRow227TriangleData1880.coefficient173_282,
  OriginalRow227TriangleData1880.coefficient173_283,
  OriginalRow227TriangleData1880.coefficient173_284,
  OriginalRow227TriangleData1880.coefficient173_285,
  OriginalRow227TriangleData1880.coefficient173_286,
  OriginalRow227TriangleData1880.coefficient173_287,
  OriginalRow227TriangleData1880.coefficient173_288,
  OriginalRow227TriangleData1880.coefficient173_289,
  OriginalRow227TriangleData1880.coefficient173_290,
  OriginalRow227TriangleData1880.coefficient173_291,
  OriginalRow227TriangleData1880.coefficient173_292,
  OriginalRow227TriangleData1880.coefficient173_293,
  OriginalRow227TriangleData1880.coefficient173_294,
  OriginalRow227TriangleData1880.coefficient173_295,
  OriginalRow227TriangleData1880.coefficient173_296,
  OriginalRow227TriangleData1880.coefficient173_297,
  OriginalRow227TriangleData1880.coefficient173_298,
  OriginalRow227TriangleData1880.coefficient173_299
]

theorem values1880_size : values1880.size = 32 := rfl

def block1880 : ℕ → Option IntervalDyadic := segment 268 values1880

theorem block1880_domain : ExactDomain block1880 268 300 := by
  simpa only [values1880_size] using segment_domain 268 values1880

theorem block1880_get (i : Fin 32) :
    block1880 (268 + i.val) = some (values1880[i.val]'(by rw [values1880_size]; exact i.isLt)) := by
  exact segment_get 268 values1880 ⟨i.val, by rw [values1880_size]; exact i.isLt⟩

def values1881 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1881.coefficient173_300,
  OriginalRow227TriangleData1881.coefficient173_301,
  OriginalRow227TriangleData1881.coefficient173_302,
  OriginalRow227TriangleData1881.coefficient173_303,
  OriginalRow227TriangleData1881.coefficient173_304,
  OriginalRow227TriangleData1881.coefficient173_305,
  OriginalRow227TriangleData1881.coefficient173_306,
  OriginalRow227TriangleData1881.coefficient173_307,
  OriginalRow227TriangleData1881.coefficient173_308,
  OriginalRow227TriangleData1881.coefficient173_309,
  OriginalRow227TriangleData1881.coefficient173_310,
  OriginalRow227TriangleData1881.coefficient173_311,
  OriginalRow227TriangleData1881.coefficient173_312,
  OriginalRow227TriangleData1881.coefficient173_313,
  OriginalRow227TriangleData1881.coefficient173_314,
  OriginalRow227TriangleData1881.coefficient173_315,
  OriginalRow227TriangleData1881.coefficient173_316,
  OriginalRow227TriangleData1881.coefficient173_317,
  OriginalRow227TriangleData1881.coefficient173_318,
  OriginalRow227TriangleData1881.coefficient173_319,
  OriginalRow227TriangleData1881.coefficient173_320,
  OriginalRow227TriangleData1881.coefficient173_321,
  OriginalRow227TriangleData1881.coefficient173_322,
  OriginalRow227TriangleData1881.coefficient173_323,
  OriginalRow227TriangleData1881.coefficient173_324,
  OriginalRow227TriangleData1881.coefficient173_325,
  OriginalRow227TriangleData1881.coefficient173_326,
  OriginalRow227TriangleData1881.coefficient173_327,
  OriginalRow227TriangleData1881.coefficient173_328
]

theorem values1881_size : values1881.size = 29 := rfl

def block1881 : ℕ → Option IntervalDyadic := segment 300 values1881

theorem block1881_domain : ExactDomain block1881 300 329 := by
  simpa only [values1881_size] using segment_domain 300 values1881

theorem block1881_get (i : Fin 29) :
    block1881 (300 + i.val) = some (values1881[i.val]'(by rw [values1881_size]; exact i.isLt)) := by
  exact segment_get 300 values1881 ⟨i.val, by rw [values1881_size]; exact i.isLt⟩

def node0172_0236 : ℕ → Option IntervalDyadic := split 204 block1877 block1878

theorem node0172_0236_domain : ExactDomain node0172_0236 172 236 := by
  exact split_domain (by decide) (by decide) block1877_domain block1878_domain

def node0268_0329 : ℕ → Option IntervalDyadic := split 300 block1880 block1881

theorem node0268_0329_domain : ExactDomain node0268_0329 268 329 := by
  exact split_domain (by decide) (by decide) block1880_domain block1881_domain

def node0236_0329 : ℕ → Option IntervalDyadic := split 268 block1879 node0268_0329

theorem node0236_0329_domain : ExactDomain node0236_0329 236 329 := by
  exact split_domain (by decide) (by decide) block1879_domain node0268_0329_domain

def node0172_0329 : ℕ → Option IntervalDyadic := split 236 node0172_0236 node0236_0329

theorem node0172_0329_domain : ExactDomain node0172_0329 172 329 := by
  exact split_domain (by decide) (by decide) node0172_0236_domain node0236_0329_domain

def lookup : ℕ → Option IntervalDyadic := node0172_0329

theorem lookup_domain : ExactDomain lookup 172 329 :=
  node0172_0329_domain

theorem block1877_lookup (i : Fin 32) :
    lookup (172 + i.val) = some (values1877[i.val]'(by rw [values1877_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0172_0329 (172 + i.val) = _
  rw [node0172_0329, split_left 236 node0172_0236 node0236_0329 (by omega)]
  rw [node0172_0236, split_left 204 block1877 block1878 (by omega)]
  exact block1877_get i

theorem block1878_lookup (i : Fin 32) :
    lookup (204 + i.val) = some (values1878[i.val]'(by rw [values1878_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0172_0329 (204 + i.val) = _
  rw [node0172_0329, split_left 236 node0172_0236 node0236_0329 (by omega)]
  rw [node0172_0236, split_right 204 block1877 block1878 (by omega)]
  exact block1878_get i

theorem block1879_lookup (i : Fin 32) :
    lookup (236 + i.val) = some (values1879[i.val]'(by rw [values1879_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0172_0329 (236 + i.val) = _
  rw [node0172_0329, split_right 236 node0172_0236 node0236_0329 (by omega)]
  rw [node0236_0329, split_left 268 block1879 node0268_0329 (by omega)]
  exact block1879_get i

theorem block1880_lookup (i : Fin 32) :
    lookup (268 + i.val) = some (values1880[i.val]'(by rw [values1880_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0172_0329 (268 + i.val) = _
  rw [node0172_0329, split_right 236 node0172_0236 node0236_0329 (by omega)]
  rw [node0236_0329, split_right 268 block1879 node0268_0329 (by omega)]
  rw [node0268_0329, split_left 300 block1880 block1881 (by omega)]
  exact block1880_get i

theorem block1881_lookup (i : Fin 29) :
    lookup (300 + i.val) = some (values1881[i.val]'(by rw [values1881_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0172_0329 (300 + i.val) = _
  rw [node0172_0329, split_right 236 node0172_0236 node0236_0329 (by omega)]
  rw [node0236_0329, split_right 268 block1879 node0268_0329 (by omega)]
  rw [node0268_0329, split_right 300 block1880 block1881 (by omega)]
  exact block1881_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1877_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1877_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1878_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1878_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1879_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1879_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1880_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1880_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1881_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1881_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1877_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1878_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1879_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1880_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow173.block1881_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow173
