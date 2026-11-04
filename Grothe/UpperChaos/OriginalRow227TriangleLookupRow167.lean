import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1842
import Grothe.UpperChaos.OriginalRow227TriangleData1843
import Grothe.UpperChaos.OriginalRow227TriangleData1844
import Grothe.UpperChaos.OriginalRow227TriangleData1845
import Grothe.UpperChaos.OriginalRow227TriangleData1846
import Grothe.UpperChaos.OriginalRow227TriangleData1847

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow167

open ConditionalTableLookup

def values1842 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1842.coefficient167_166,
  OriginalRow227TriangleData1842.coefficient167_167,
  OriginalRow227TriangleData1842.coefficient167_168,
  OriginalRow227TriangleData1842.coefficient167_169,
  OriginalRow227TriangleData1842.coefficient167_170,
  OriginalRow227TriangleData1842.coefficient167_171,
  OriginalRow227TriangleData1842.coefficient167_172,
  OriginalRow227TriangleData1842.coefficient167_173,
  OriginalRow227TriangleData1842.coefficient167_174,
  OriginalRow227TriangleData1842.coefficient167_175,
  OriginalRow227TriangleData1842.coefficient167_176,
  OriginalRow227TriangleData1842.coefficient167_177,
  OriginalRow227TriangleData1842.coefficient167_178,
  OriginalRow227TriangleData1842.coefficient167_179,
  OriginalRow227TriangleData1842.coefficient167_180,
  OriginalRow227TriangleData1842.coefficient167_181,
  OriginalRow227TriangleData1842.coefficient167_182,
  OriginalRow227TriangleData1842.coefficient167_183,
  OriginalRow227TriangleData1842.coefficient167_184,
  OriginalRow227TriangleData1842.coefficient167_185,
  OriginalRow227TriangleData1842.coefficient167_186,
  OriginalRow227TriangleData1842.coefficient167_187,
  OriginalRow227TriangleData1842.coefficient167_188,
  OriginalRow227TriangleData1842.coefficient167_189,
  OriginalRow227TriangleData1842.coefficient167_190,
  OriginalRow227TriangleData1842.coefficient167_191,
  OriginalRow227TriangleData1842.coefficient167_192,
  OriginalRow227TriangleData1842.coefficient167_193,
  OriginalRow227TriangleData1842.coefficient167_194,
  OriginalRow227TriangleData1842.coefficient167_195,
  OriginalRow227TriangleData1842.coefficient167_196,
  OriginalRow227TriangleData1842.coefficient167_197
]

theorem values1842_size : values1842.size = 32 := rfl

def block1842 : ℕ → Option IntervalDyadic := segment 166 values1842

theorem block1842_domain : ExactDomain block1842 166 198 := by
  simpa only [values1842_size] using segment_domain 166 values1842

theorem block1842_get (i : Fin 32) :
    block1842 (166 + i.val) = some (values1842[i.val]'(by rw [values1842_size]; exact i.isLt)) := by
  exact segment_get 166 values1842 ⟨i.val, by rw [values1842_size]; exact i.isLt⟩

def values1843 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1843.coefficient167_198,
  OriginalRow227TriangleData1843.coefficient167_199,
  OriginalRow227TriangleData1843.coefficient167_200,
  OriginalRow227TriangleData1843.coefficient167_201,
  OriginalRow227TriangleData1843.coefficient167_202,
  OriginalRow227TriangleData1843.coefficient167_203,
  OriginalRow227TriangleData1843.coefficient167_204,
  OriginalRow227TriangleData1843.coefficient167_205,
  OriginalRow227TriangleData1843.coefficient167_206,
  OriginalRow227TriangleData1843.coefficient167_207,
  OriginalRow227TriangleData1843.coefficient167_208,
  OriginalRow227TriangleData1843.coefficient167_209,
  OriginalRow227TriangleData1843.coefficient167_210,
  OriginalRow227TriangleData1843.coefficient167_211,
  OriginalRow227TriangleData1843.coefficient167_212,
  OriginalRow227TriangleData1843.coefficient167_213,
  OriginalRow227TriangleData1843.coefficient167_214,
  OriginalRow227TriangleData1843.coefficient167_215,
  OriginalRow227TriangleData1843.coefficient167_216,
  OriginalRow227TriangleData1843.coefficient167_217,
  OriginalRow227TriangleData1843.coefficient167_218,
  OriginalRow227TriangleData1843.coefficient167_219,
  OriginalRow227TriangleData1843.coefficient167_220,
  OriginalRow227TriangleData1843.coefficient167_221,
  OriginalRow227TriangleData1843.coefficient167_222,
  OriginalRow227TriangleData1843.coefficient167_223,
  OriginalRow227TriangleData1843.coefficient167_224,
  OriginalRow227TriangleData1843.coefficient167_225,
  OriginalRow227TriangleData1843.coefficient167_226,
  OriginalRow227TriangleData1843.coefficient167_227,
  OriginalRow227TriangleData1843.coefficient167_228,
  OriginalRow227TriangleData1843.coefficient167_229
]

theorem values1843_size : values1843.size = 32 := rfl

def block1843 : ℕ → Option IntervalDyadic := segment 198 values1843

theorem block1843_domain : ExactDomain block1843 198 230 := by
  simpa only [values1843_size] using segment_domain 198 values1843

theorem block1843_get (i : Fin 32) :
    block1843 (198 + i.val) = some (values1843[i.val]'(by rw [values1843_size]; exact i.isLt)) := by
  exact segment_get 198 values1843 ⟨i.val, by rw [values1843_size]; exact i.isLt⟩

def values1844 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1844.coefficient167_230,
  OriginalRow227TriangleData1844.coefficient167_231,
  OriginalRow227TriangleData1844.coefficient167_232,
  OriginalRow227TriangleData1844.coefficient167_233,
  OriginalRow227TriangleData1844.coefficient167_234,
  OriginalRow227TriangleData1844.coefficient167_235,
  OriginalRow227TriangleData1844.coefficient167_236,
  OriginalRow227TriangleData1844.coefficient167_237,
  OriginalRow227TriangleData1844.coefficient167_238,
  OriginalRow227TriangleData1844.coefficient167_239,
  OriginalRow227TriangleData1844.coefficient167_240,
  OriginalRow227TriangleData1844.coefficient167_241,
  OriginalRow227TriangleData1844.coefficient167_242,
  OriginalRow227TriangleData1844.coefficient167_243,
  OriginalRow227TriangleData1844.coefficient167_244,
  OriginalRow227TriangleData1844.coefficient167_245,
  OriginalRow227TriangleData1844.coefficient167_246,
  OriginalRow227TriangleData1844.coefficient167_247,
  OriginalRow227TriangleData1844.coefficient167_248,
  OriginalRow227TriangleData1844.coefficient167_249,
  OriginalRow227TriangleData1844.coefficient167_250,
  OriginalRow227TriangleData1844.coefficient167_251,
  OriginalRow227TriangleData1844.coefficient167_252,
  OriginalRow227TriangleData1844.coefficient167_253,
  OriginalRow227TriangleData1844.coefficient167_254,
  OriginalRow227TriangleData1844.coefficient167_255,
  OriginalRow227TriangleData1844.coefficient167_256,
  OriginalRow227TriangleData1844.coefficient167_257,
  OriginalRow227TriangleData1844.coefficient167_258,
  OriginalRow227TriangleData1844.coefficient167_259,
  OriginalRow227TriangleData1844.coefficient167_260,
  OriginalRow227TriangleData1844.coefficient167_261
]

theorem values1844_size : values1844.size = 32 := rfl

def block1844 : ℕ → Option IntervalDyadic := segment 230 values1844

theorem block1844_domain : ExactDomain block1844 230 262 := by
  simpa only [values1844_size] using segment_domain 230 values1844

theorem block1844_get (i : Fin 32) :
    block1844 (230 + i.val) = some (values1844[i.val]'(by rw [values1844_size]; exact i.isLt)) := by
  exact segment_get 230 values1844 ⟨i.val, by rw [values1844_size]; exact i.isLt⟩

def values1845 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1845.coefficient167_262,
  OriginalRow227TriangleData1845.coefficient167_263,
  OriginalRow227TriangleData1845.coefficient167_264,
  OriginalRow227TriangleData1845.coefficient167_265,
  OriginalRow227TriangleData1845.coefficient167_266,
  OriginalRow227TriangleData1845.coefficient167_267,
  OriginalRow227TriangleData1845.coefficient167_268,
  OriginalRow227TriangleData1845.coefficient167_269,
  OriginalRow227TriangleData1845.coefficient167_270,
  OriginalRow227TriangleData1845.coefficient167_271,
  OriginalRow227TriangleData1845.coefficient167_272,
  OriginalRow227TriangleData1845.coefficient167_273,
  OriginalRow227TriangleData1845.coefficient167_274,
  OriginalRow227TriangleData1845.coefficient167_275,
  OriginalRow227TriangleData1845.coefficient167_276,
  OriginalRow227TriangleData1845.coefficient167_277,
  OriginalRow227TriangleData1845.coefficient167_278,
  OriginalRow227TriangleData1845.coefficient167_279,
  OriginalRow227TriangleData1845.coefficient167_280,
  OriginalRow227TriangleData1845.coefficient167_281,
  OriginalRow227TriangleData1845.coefficient167_282,
  OriginalRow227TriangleData1845.coefficient167_283,
  OriginalRow227TriangleData1845.coefficient167_284,
  OriginalRow227TriangleData1845.coefficient167_285,
  OriginalRow227TriangleData1845.coefficient167_286,
  OriginalRow227TriangleData1845.coefficient167_287,
  OriginalRow227TriangleData1845.coefficient167_288,
  OriginalRow227TriangleData1845.coefficient167_289,
  OriginalRow227TriangleData1845.coefficient167_290,
  OriginalRow227TriangleData1845.coefficient167_291,
  OriginalRow227TriangleData1845.coefficient167_292,
  OriginalRow227TriangleData1845.coefficient167_293
]

theorem values1845_size : values1845.size = 32 := rfl

def block1845 : ℕ → Option IntervalDyadic := segment 262 values1845

theorem block1845_domain : ExactDomain block1845 262 294 := by
  simpa only [values1845_size] using segment_domain 262 values1845

theorem block1845_get (i : Fin 32) :
    block1845 (262 + i.val) = some (values1845[i.val]'(by rw [values1845_size]; exact i.isLt)) := by
  exact segment_get 262 values1845 ⟨i.val, by rw [values1845_size]; exact i.isLt⟩

def values1846 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1846.coefficient167_294,
  OriginalRow227TriangleData1846.coefficient167_295,
  OriginalRow227TriangleData1846.coefficient167_296,
  OriginalRow227TriangleData1846.coefficient167_297,
  OriginalRow227TriangleData1846.coefficient167_298,
  OriginalRow227TriangleData1846.coefficient167_299,
  OriginalRow227TriangleData1846.coefficient167_300,
  OriginalRow227TriangleData1846.coefficient167_301,
  OriginalRow227TriangleData1846.coefficient167_302,
  OriginalRow227TriangleData1846.coefficient167_303,
  OriginalRow227TriangleData1846.coefficient167_304,
  OriginalRow227TriangleData1846.coefficient167_305,
  OriginalRow227TriangleData1846.coefficient167_306,
  OriginalRow227TriangleData1846.coefficient167_307,
  OriginalRow227TriangleData1846.coefficient167_308,
  OriginalRow227TriangleData1846.coefficient167_309,
  OriginalRow227TriangleData1846.coefficient167_310,
  OriginalRow227TriangleData1846.coefficient167_311,
  OriginalRow227TriangleData1846.coefficient167_312,
  OriginalRow227TriangleData1846.coefficient167_313,
  OriginalRow227TriangleData1846.coefficient167_314,
  OriginalRow227TriangleData1846.coefficient167_315,
  OriginalRow227TriangleData1846.coefficient167_316,
  OriginalRow227TriangleData1846.coefficient167_317,
  OriginalRow227TriangleData1846.coefficient167_318,
  OriginalRow227TriangleData1846.coefficient167_319,
  OriginalRow227TriangleData1846.coefficient167_320,
  OriginalRow227TriangleData1846.coefficient167_321,
  OriginalRow227TriangleData1846.coefficient167_322,
  OriginalRow227TriangleData1846.coefficient167_323,
  OriginalRow227TriangleData1846.coefficient167_324,
  OriginalRow227TriangleData1846.coefficient167_325
]

theorem values1846_size : values1846.size = 32 := rfl

def block1846 : ℕ → Option IntervalDyadic := segment 294 values1846

theorem block1846_domain : ExactDomain block1846 294 326 := by
  simpa only [values1846_size] using segment_domain 294 values1846

theorem block1846_get (i : Fin 32) :
    block1846 (294 + i.val) = some (values1846[i.val]'(by rw [values1846_size]; exact i.isLt)) := by
  exact segment_get 294 values1846 ⟨i.val, by rw [values1846_size]; exact i.isLt⟩

def values1847 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1847.coefficient167_326,
  OriginalRow227TriangleData1847.coefficient167_327,
  OriginalRow227TriangleData1847.coefficient167_328,
  OriginalRow227TriangleData1847.coefficient167_329,
  OriginalRow227TriangleData1847.coefficient167_330,
  OriginalRow227TriangleData1847.coefficient167_331,
  OriginalRow227TriangleData1847.coefficient167_332,
  OriginalRow227TriangleData1847.coefficient167_333,
  OriginalRow227TriangleData1847.coefficient167_334
]

theorem values1847_size : values1847.size = 9 := rfl

def block1847 : ℕ → Option IntervalDyadic := segment 326 values1847

theorem block1847_domain : ExactDomain block1847 326 335 := by
  simpa only [values1847_size] using segment_domain 326 values1847

theorem block1847_get (i : Fin 9) :
    block1847 (326 + i.val) = some (values1847[i.val]'(by rw [values1847_size]; exact i.isLt)) := by
  exact segment_get 326 values1847 ⟨i.val, by rw [values1847_size]; exact i.isLt⟩

def node0198_0262 : ℕ → Option IntervalDyadic := split 230 block1843 block1844

theorem node0198_0262_domain : ExactDomain node0198_0262 198 262 := by
  exact split_domain (by decide) (by decide) block1843_domain block1844_domain

def node0166_0262 : ℕ → Option IntervalDyadic := split 198 block1842 node0198_0262

theorem node0166_0262_domain : ExactDomain node0166_0262 166 262 := by
  exact split_domain (by decide) (by decide) block1842_domain node0198_0262_domain

def node0294_0335 : ℕ → Option IntervalDyadic := split 326 block1846 block1847

theorem node0294_0335_domain : ExactDomain node0294_0335 294 335 := by
  exact split_domain (by decide) (by decide) block1846_domain block1847_domain

def node0262_0335 : ℕ → Option IntervalDyadic := split 294 block1845 node0294_0335

theorem node0262_0335_domain : ExactDomain node0262_0335 262 335 := by
  exact split_domain (by decide) (by decide) block1845_domain node0294_0335_domain

def node0166_0335 : ℕ → Option IntervalDyadic := split 262 node0166_0262 node0262_0335

theorem node0166_0335_domain : ExactDomain node0166_0335 166 335 := by
  exact split_domain (by decide) (by decide) node0166_0262_domain node0262_0335_domain

def lookup : ℕ → Option IntervalDyadic := node0166_0335

theorem lookup_domain : ExactDomain lookup 166 335 :=
  node0166_0335_domain

theorem block1842_lookup (i : Fin 32) :
    lookup (166 + i.val) = some (values1842[i.val]'(by rw [values1842_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0166_0335 (166 + i.val) = _
  rw [node0166_0335, split_left 262 node0166_0262 node0262_0335 (by omega)]
  rw [node0166_0262, split_left 198 block1842 node0198_0262 (by omega)]
  exact block1842_get i

theorem block1843_lookup (i : Fin 32) :
    lookup (198 + i.val) = some (values1843[i.val]'(by rw [values1843_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0166_0335 (198 + i.val) = _
  rw [node0166_0335, split_left 262 node0166_0262 node0262_0335 (by omega)]
  rw [node0166_0262, split_right 198 block1842 node0198_0262 (by omega)]
  rw [node0198_0262, split_left 230 block1843 block1844 (by omega)]
  exact block1843_get i

theorem block1844_lookup (i : Fin 32) :
    lookup (230 + i.val) = some (values1844[i.val]'(by rw [values1844_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0166_0335 (230 + i.val) = _
  rw [node0166_0335, split_left 262 node0166_0262 node0262_0335 (by omega)]
  rw [node0166_0262, split_right 198 block1842 node0198_0262 (by omega)]
  rw [node0198_0262, split_right 230 block1843 block1844 (by omega)]
  exact block1844_get i

theorem block1845_lookup (i : Fin 32) :
    lookup (262 + i.val) = some (values1845[i.val]'(by rw [values1845_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0166_0335 (262 + i.val) = _
  rw [node0166_0335, split_right 262 node0166_0262 node0262_0335 (by omega)]
  rw [node0262_0335, split_left 294 block1845 node0294_0335 (by omega)]
  exact block1845_get i

theorem block1846_lookup (i : Fin 32) :
    lookup (294 + i.val) = some (values1846[i.val]'(by rw [values1846_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0166_0335 (294 + i.val) = _
  rw [node0166_0335, split_right 262 node0166_0262 node0262_0335 (by omega)]
  rw [node0262_0335, split_right 294 block1845 node0294_0335 (by omega)]
  rw [node0294_0335, split_left 326 block1846 block1847 (by omega)]
  exact block1846_get i

theorem block1847_lookup (i : Fin 9) :
    lookup (326 + i.val) = some (values1847[i.val]'(by rw [values1847_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0166_0335 (326 + i.val) = _
  rw [node0166_0335, split_right 262 node0166_0262 node0262_0335 (by omega)]
  rw [node0262_0335, split_right 294 block1845 node0294_0335 (by omega)]
  rw [node0294_0335, split_right 326 block1846 block1847 (by omega)]
  exact block1847_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1842_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1842_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1843_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1843_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1844_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1844_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1845_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1845_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1846_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1846_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1847_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1847_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1842_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1843_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1844_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1845_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1846_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow167.block1847_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow167
