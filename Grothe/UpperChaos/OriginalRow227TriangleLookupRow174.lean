import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1882
import Grothe.UpperChaos.OriginalRow227TriangleData1883
import Grothe.UpperChaos.OriginalRow227TriangleData1884
import Grothe.UpperChaos.OriginalRow227TriangleData1885
import Grothe.UpperChaos.OriginalRow227TriangleData1886

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow174

open ConditionalTableLookup

def values1882 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1882.coefficient174_173,
  OriginalRow227TriangleData1882.coefficient174_174,
  OriginalRow227TriangleData1882.coefficient174_175,
  OriginalRow227TriangleData1882.coefficient174_176,
  OriginalRow227TriangleData1882.coefficient174_177,
  OriginalRow227TriangleData1882.coefficient174_178,
  OriginalRow227TriangleData1882.coefficient174_179,
  OriginalRow227TriangleData1882.coefficient174_180,
  OriginalRow227TriangleData1882.coefficient174_181,
  OriginalRow227TriangleData1882.coefficient174_182,
  OriginalRow227TriangleData1882.coefficient174_183,
  OriginalRow227TriangleData1882.coefficient174_184,
  OriginalRow227TriangleData1882.coefficient174_185,
  OriginalRow227TriangleData1882.coefficient174_186,
  OriginalRow227TriangleData1882.coefficient174_187,
  OriginalRow227TriangleData1882.coefficient174_188,
  OriginalRow227TriangleData1882.coefficient174_189,
  OriginalRow227TriangleData1882.coefficient174_190,
  OriginalRow227TriangleData1882.coefficient174_191,
  OriginalRow227TriangleData1882.coefficient174_192,
  OriginalRow227TriangleData1882.coefficient174_193,
  OriginalRow227TriangleData1882.coefficient174_194,
  OriginalRow227TriangleData1882.coefficient174_195,
  OriginalRow227TriangleData1882.coefficient174_196,
  OriginalRow227TriangleData1882.coefficient174_197,
  OriginalRow227TriangleData1882.coefficient174_198,
  OriginalRow227TriangleData1882.coefficient174_199,
  OriginalRow227TriangleData1882.coefficient174_200,
  OriginalRow227TriangleData1882.coefficient174_201,
  OriginalRow227TriangleData1882.coefficient174_202,
  OriginalRow227TriangleData1882.coefficient174_203,
  OriginalRow227TriangleData1882.coefficient174_204
]

theorem values1882_size : values1882.size = 32 := rfl

def block1882 : ℕ → Option IntervalDyadic := segment 173 values1882

theorem block1882_domain : ExactDomain block1882 173 205 := by
  simpa only [values1882_size] using segment_domain 173 values1882

theorem block1882_get (i : Fin 32) :
    block1882 (173 + i.val) = some (values1882[i.val]'(by rw [values1882_size]; exact i.isLt)) := by
  exact segment_get 173 values1882 ⟨i.val, by rw [values1882_size]; exact i.isLt⟩

def values1883 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1883.coefficient174_205,
  OriginalRow227TriangleData1883.coefficient174_206,
  OriginalRow227TriangleData1883.coefficient174_207,
  OriginalRow227TriangleData1883.coefficient174_208,
  OriginalRow227TriangleData1883.coefficient174_209,
  OriginalRow227TriangleData1883.coefficient174_210,
  OriginalRow227TriangleData1883.coefficient174_211,
  OriginalRow227TriangleData1883.coefficient174_212,
  OriginalRow227TriangleData1883.coefficient174_213,
  OriginalRow227TriangleData1883.coefficient174_214,
  OriginalRow227TriangleData1883.coefficient174_215,
  OriginalRow227TriangleData1883.coefficient174_216,
  OriginalRow227TriangleData1883.coefficient174_217,
  OriginalRow227TriangleData1883.coefficient174_218,
  OriginalRow227TriangleData1883.coefficient174_219,
  OriginalRow227TriangleData1883.coefficient174_220,
  OriginalRow227TriangleData1883.coefficient174_221,
  OriginalRow227TriangleData1883.coefficient174_222,
  OriginalRow227TriangleData1883.coefficient174_223,
  OriginalRow227TriangleData1883.coefficient174_224,
  OriginalRow227TriangleData1883.coefficient174_225,
  OriginalRow227TriangleData1883.coefficient174_226,
  OriginalRow227TriangleData1883.coefficient174_227,
  OriginalRow227TriangleData1883.coefficient174_228,
  OriginalRow227TriangleData1883.coefficient174_229,
  OriginalRow227TriangleData1883.coefficient174_230,
  OriginalRow227TriangleData1883.coefficient174_231,
  OriginalRow227TriangleData1883.coefficient174_232,
  OriginalRow227TriangleData1883.coefficient174_233,
  OriginalRow227TriangleData1883.coefficient174_234,
  OriginalRow227TriangleData1883.coefficient174_235,
  OriginalRow227TriangleData1883.coefficient174_236
]

theorem values1883_size : values1883.size = 32 := rfl

def block1883 : ℕ → Option IntervalDyadic := segment 205 values1883

theorem block1883_domain : ExactDomain block1883 205 237 := by
  simpa only [values1883_size] using segment_domain 205 values1883

theorem block1883_get (i : Fin 32) :
    block1883 (205 + i.val) = some (values1883[i.val]'(by rw [values1883_size]; exact i.isLt)) := by
  exact segment_get 205 values1883 ⟨i.val, by rw [values1883_size]; exact i.isLt⟩

def values1884 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1884.coefficient174_237,
  OriginalRow227TriangleData1884.coefficient174_238,
  OriginalRow227TriangleData1884.coefficient174_239,
  OriginalRow227TriangleData1884.coefficient174_240,
  OriginalRow227TriangleData1884.coefficient174_241,
  OriginalRow227TriangleData1884.coefficient174_242,
  OriginalRow227TriangleData1884.coefficient174_243,
  OriginalRow227TriangleData1884.coefficient174_244,
  OriginalRow227TriangleData1884.coefficient174_245,
  OriginalRow227TriangleData1884.coefficient174_246,
  OriginalRow227TriangleData1884.coefficient174_247,
  OriginalRow227TriangleData1884.coefficient174_248,
  OriginalRow227TriangleData1884.coefficient174_249,
  OriginalRow227TriangleData1884.coefficient174_250,
  OriginalRow227TriangleData1884.coefficient174_251,
  OriginalRow227TriangleData1884.coefficient174_252,
  OriginalRow227TriangleData1884.coefficient174_253,
  OriginalRow227TriangleData1884.coefficient174_254,
  OriginalRow227TriangleData1884.coefficient174_255,
  OriginalRow227TriangleData1884.coefficient174_256,
  OriginalRow227TriangleData1884.coefficient174_257,
  OriginalRow227TriangleData1884.coefficient174_258,
  OriginalRow227TriangleData1884.coefficient174_259,
  OriginalRow227TriangleData1884.coefficient174_260,
  OriginalRow227TriangleData1884.coefficient174_261,
  OriginalRow227TriangleData1884.coefficient174_262,
  OriginalRow227TriangleData1884.coefficient174_263,
  OriginalRow227TriangleData1884.coefficient174_264,
  OriginalRow227TriangleData1884.coefficient174_265,
  OriginalRow227TriangleData1884.coefficient174_266,
  OriginalRow227TriangleData1884.coefficient174_267,
  OriginalRow227TriangleData1884.coefficient174_268
]

theorem values1884_size : values1884.size = 32 := rfl

def block1884 : ℕ → Option IntervalDyadic := segment 237 values1884

theorem block1884_domain : ExactDomain block1884 237 269 := by
  simpa only [values1884_size] using segment_domain 237 values1884

theorem block1884_get (i : Fin 32) :
    block1884 (237 + i.val) = some (values1884[i.val]'(by rw [values1884_size]; exact i.isLt)) := by
  exact segment_get 237 values1884 ⟨i.val, by rw [values1884_size]; exact i.isLt⟩

def values1885 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1885.coefficient174_269,
  OriginalRow227TriangleData1885.coefficient174_270,
  OriginalRow227TriangleData1885.coefficient174_271,
  OriginalRow227TriangleData1885.coefficient174_272,
  OriginalRow227TriangleData1885.coefficient174_273,
  OriginalRow227TriangleData1885.coefficient174_274,
  OriginalRow227TriangleData1885.coefficient174_275,
  OriginalRow227TriangleData1885.coefficient174_276,
  OriginalRow227TriangleData1885.coefficient174_277,
  OriginalRow227TriangleData1885.coefficient174_278,
  OriginalRow227TriangleData1885.coefficient174_279,
  OriginalRow227TriangleData1885.coefficient174_280,
  OriginalRow227TriangleData1885.coefficient174_281,
  OriginalRow227TriangleData1885.coefficient174_282,
  OriginalRow227TriangleData1885.coefficient174_283,
  OriginalRow227TriangleData1885.coefficient174_284,
  OriginalRow227TriangleData1885.coefficient174_285,
  OriginalRow227TriangleData1885.coefficient174_286,
  OriginalRow227TriangleData1885.coefficient174_287,
  OriginalRow227TriangleData1885.coefficient174_288,
  OriginalRow227TriangleData1885.coefficient174_289,
  OriginalRow227TriangleData1885.coefficient174_290,
  OriginalRow227TriangleData1885.coefficient174_291,
  OriginalRow227TriangleData1885.coefficient174_292,
  OriginalRow227TriangleData1885.coefficient174_293,
  OriginalRow227TriangleData1885.coefficient174_294,
  OriginalRow227TriangleData1885.coefficient174_295,
  OriginalRow227TriangleData1885.coefficient174_296,
  OriginalRow227TriangleData1885.coefficient174_297,
  OriginalRow227TriangleData1885.coefficient174_298,
  OriginalRow227TriangleData1885.coefficient174_299,
  OriginalRow227TriangleData1885.coefficient174_300
]

theorem values1885_size : values1885.size = 32 := rfl

def block1885 : ℕ → Option IntervalDyadic := segment 269 values1885

theorem block1885_domain : ExactDomain block1885 269 301 := by
  simpa only [values1885_size] using segment_domain 269 values1885

theorem block1885_get (i : Fin 32) :
    block1885 (269 + i.val) = some (values1885[i.val]'(by rw [values1885_size]; exact i.isLt)) := by
  exact segment_get 269 values1885 ⟨i.val, by rw [values1885_size]; exact i.isLt⟩

def values1886 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1886.coefficient174_301,
  OriginalRow227TriangleData1886.coefficient174_302,
  OriginalRow227TriangleData1886.coefficient174_303,
  OriginalRow227TriangleData1886.coefficient174_304,
  OriginalRow227TriangleData1886.coefficient174_305,
  OriginalRow227TriangleData1886.coefficient174_306,
  OriginalRow227TriangleData1886.coefficient174_307,
  OriginalRow227TriangleData1886.coefficient174_308,
  OriginalRow227TriangleData1886.coefficient174_309,
  OriginalRow227TriangleData1886.coefficient174_310,
  OriginalRow227TriangleData1886.coefficient174_311,
  OriginalRow227TriangleData1886.coefficient174_312,
  OriginalRow227TriangleData1886.coefficient174_313,
  OriginalRow227TriangleData1886.coefficient174_314,
  OriginalRow227TriangleData1886.coefficient174_315,
  OriginalRow227TriangleData1886.coefficient174_316,
  OriginalRow227TriangleData1886.coefficient174_317,
  OriginalRow227TriangleData1886.coefficient174_318,
  OriginalRow227TriangleData1886.coefficient174_319,
  OriginalRow227TriangleData1886.coefficient174_320,
  OriginalRow227TriangleData1886.coefficient174_321,
  OriginalRow227TriangleData1886.coefficient174_322,
  OriginalRow227TriangleData1886.coefficient174_323,
  OriginalRow227TriangleData1886.coefficient174_324,
  OriginalRow227TriangleData1886.coefficient174_325,
  OriginalRow227TriangleData1886.coefficient174_326,
  OriginalRow227TriangleData1886.coefficient174_327
]

theorem values1886_size : values1886.size = 27 := rfl

def block1886 : ℕ → Option IntervalDyadic := segment 301 values1886

theorem block1886_domain : ExactDomain block1886 301 328 := by
  simpa only [values1886_size] using segment_domain 301 values1886

theorem block1886_get (i : Fin 27) :
    block1886 (301 + i.val) = some (values1886[i.val]'(by rw [values1886_size]; exact i.isLt)) := by
  exact segment_get 301 values1886 ⟨i.val, by rw [values1886_size]; exact i.isLt⟩

def node0173_0237 : ℕ → Option IntervalDyadic := split 205 block1882 block1883

theorem node0173_0237_domain : ExactDomain node0173_0237 173 237 := by
  exact split_domain (by decide) (by decide) block1882_domain block1883_domain

def node0269_0328 : ℕ → Option IntervalDyadic := split 301 block1885 block1886

theorem node0269_0328_domain : ExactDomain node0269_0328 269 328 := by
  exact split_domain (by decide) (by decide) block1885_domain block1886_domain

def node0237_0328 : ℕ → Option IntervalDyadic := split 269 block1884 node0269_0328

theorem node0237_0328_domain : ExactDomain node0237_0328 237 328 := by
  exact split_domain (by decide) (by decide) block1884_domain node0269_0328_domain

def node0173_0328 : ℕ → Option IntervalDyadic := split 237 node0173_0237 node0237_0328

theorem node0173_0328_domain : ExactDomain node0173_0328 173 328 := by
  exact split_domain (by decide) (by decide) node0173_0237_domain node0237_0328_domain

def lookup : ℕ → Option IntervalDyadic := node0173_0328

theorem lookup_domain : ExactDomain lookup 173 328 :=
  node0173_0328_domain

theorem block1882_lookup (i : Fin 32) :
    lookup (173 + i.val) = some (values1882[i.val]'(by rw [values1882_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0173_0328 (173 + i.val) = _
  rw [node0173_0328, split_left 237 node0173_0237 node0237_0328 (by omega)]
  rw [node0173_0237, split_left 205 block1882 block1883 (by omega)]
  exact block1882_get i

theorem block1883_lookup (i : Fin 32) :
    lookup (205 + i.val) = some (values1883[i.val]'(by rw [values1883_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0173_0328 (205 + i.val) = _
  rw [node0173_0328, split_left 237 node0173_0237 node0237_0328 (by omega)]
  rw [node0173_0237, split_right 205 block1882 block1883 (by omega)]
  exact block1883_get i

theorem block1884_lookup (i : Fin 32) :
    lookup (237 + i.val) = some (values1884[i.val]'(by rw [values1884_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0173_0328 (237 + i.val) = _
  rw [node0173_0328, split_right 237 node0173_0237 node0237_0328 (by omega)]
  rw [node0237_0328, split_left 269 block1884 node0269_0328 (by omega)]
  exact block1884_get i

theorem block1885_lookup (i : Fin 32) :
    lookup (269 + i.val) = some (values1885[i.val]'(by rw [values1885_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0173_0328 (269 + i.val) = _
  rw [node0173_0328, split_right 237 node0173_0237 node0237_0328 (by omega)]
  rw [node0237_0328, split_right 269 block1884 node0269_0328 (by omega)]
  rw [node0269_0328, split_left 301 block1885 block1886 (by omega)]
  exact block1885_get i

theorem block1886_lookup (i : Fin 27) :
    lookup (301 + i.val) = some (values1886[i.val]'(by rw [values1886_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0173_0328 (301 + i.val) = _
  rw [node0173_0328, split_right 237 node0173_0237 node0237_0328 (by omega)]
  rw [node0237_0328, split_right 269 block1884 node0269_0328 (by omega)]
  rw [node0269_0328, split_right 301 block1885 block1886 (by omega)]
  exact block1886_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1882_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1882_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1883_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1883_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1884_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1884_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1885_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1885_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1886_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1886_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1882_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1883_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1884_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1885_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow174.block1886_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow174
