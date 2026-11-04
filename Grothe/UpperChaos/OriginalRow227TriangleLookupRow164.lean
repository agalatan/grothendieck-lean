import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1824
import Grothe.UpperChaos.OriginalRow227TriangleData1825
import Grothe.UpperChaos.OriginalRow227TriangleData1826
import Grothe.UpperChaos.OriginalRow227TriangleData1827
import Grothe.UpperChaos.OriginalRow227TriangleData1828
import Grothe.UpperChaos.OriginalRow227TriangleData1829

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow164

open ConditionalTableLookup

def values1824 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1824.coefficient164_163,
  OriginalRow227TriangleData1824.coefficient164_164,
  OriginalRow227TriangleData1824.coefficient164_165,
  OriginalRow227TriangleData1824.coefficient164_166,
  OriginalRow227TriangleData1824.coefficient164_167,
  OriginalRow227TriangleData1824.coefficient164_168,
  OriginalRow227TriangleData1824.coefficient164_169,
  OriginalRow227TriangleData1824.coefficient164_170,
  OriginalRow227TriangleData1824.coefficient164_171,
  OriginalRow227TriangleData1824.coefficient164_172,
  OriginalRow227TriangleData1824.coefficient164_173,
  OriginalRow227TriangleData1824.coefficient164_174,
  OriginalRow227TriangleData1824.coefficient164_175,
  OriginalRow227TriangleData1824.coefficient164_176,
  OriginalRow227TriangleData1824.coefficient164_177,
  OriginalRow227TriangleData1824.coefficient164_178,
  OriginalRow227TriangleData1824.coefficient164_179,
  OriginalRow227TriangleData1824.coefficient164_180,
  OriginalRow227TriangleData1824.coefficient164_181,
  OriginalRow227TriangleData1824.coefficient164_182,
  OriginalRow227TriangleData1824.coefficient164_183,
  OriginalRow227TriangleData1824.coefficient164_184,
  OriginalRow227TriangleData1824.coefficient164_185,
  OriginalRow227TriangleData1824.coefficient164_186,
  OriginalRow227TriangleData1824.coefficient164_187,
  OriginalRow227TriangleData1824.coefficient164_188,
  OriginalRow227TriangleData1824.coefficient164_189,
  OriginalRow227TriangleData1824.coefficient164_190,
  OriginalRow227TriangleData1824.coefficient164_191,
  OriginalRow227TriangleData1824.coefficient164_192,
  OriginalRow227TriangleData1824.coefficient164_193,
  OriginalRow227TriangleData1824.coefficient164_194
]

theorem values1824_size : values1824.size = 32 := rfl

def block1824 : ℕ → Option IntervalDyadic := segment 163 values1824

theorem block1824_domain : ExactDomain block1824 163 195 := by
  simpa only [values1824_size] using segment_domain 163 values1824

theorem block1824_get (i : Fin 32) :
    block1824 (163 + i.val) = some (values1824[i.val]'(by rw [values1824_size]; exact i.isLt)) := by
  exact segment_get 163 values1824 ⟨i.val, by rw [values1824_size]; exact i.isLt⟩

def values1825 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1825.coefficient164_195,
  OriginalRow227TriangleData1825.coefficient164_196,
  OriginalRow227TriangleData1825.coefficient164_197,
  OriginalRow227TriangleData1825.coefficient164_198,
  OriginalRow227TriangleData1825.coefficient164_199,
  OriginalRow227TriangleData1825.coefficient164_200,
  OriginalRow227TriangleData1825.coefficient164_201,
  OriginalRow227TriangleData1825.coefficient164_202,
  OriginalRow227TriangleData1825.coefficient164_203,
  OriginalRow227TriangleData1825.coefficient164_204,
  OriginalRow227TriangleData1825.coefficient164_205,
  OriginalRow227TriangleData1825.coefficient164_206,
  OriginalRow227TriangleData1825.coefficient164_207,
  OriginalRow227TriangleData1825.coefficient164_208,
  OriginalRow227TriangleData1825.coefficient164_209,
  OriginalRow227TriangleData1825.coefficient164_210,
  OriginalRow227TriangleData1825.coefficient164_211,
  OriginalRow227TriangleData1825.coefficient164_212,
  OriginalRow227TriangleData1825.coefficient164_213,
  OriginalRow227TriangleData1825.coefficient164_214,
  OriginalRow227TriangleData1825.coefficient164_215,
  OriginalRow227TriangleData1825.coefficient164_216,
  OriginalRow227TriangleData1825.coefficient164_217,
  OriginalRow227TriangleData1825.coefficient164_218,
  OriginalRow227TriangleData1825.coefficient164_219,
  OriginalRow227TriangleData1825.coefficient164_220,
  OriginalRow227TriangleData1825.coefficient164_221,
  OriginalRow227TriangleData1825.coefficient164_222,
  OriginalRow227TriangleData1825.coefficient164_223,
  OriginalRow227TriangleData1825.coefficient164_224,
  OriginalRow227TriangleData1825.coefficient164_225,
  OriginalRow227TriangleData1825.coefficient164_226
]

theorem values1825_size : values1825.size = 32 := rfl

def block1825 : ℕ → Option IntervalDyadic := segment 195 values1825

theorem block1825_domain : ExactDomain block1825 195 227 := by
  simpa only [values1825_size] using segment_domain 195 values1825

theorem block1825_get (i : Fin 32) :
    block1825 (195 + i.val) = some (values1825[i.val]'(by rw [values1825_size]; exact i.isLt)) := by
  exact segment_get 195 values1825 ⟨i.val, by rw [values1825_size]; exact i.isLt⟩

def values1826 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1826.coefficient164_227,
  OriginalRow227TriangleData1826.coefficient164_228,
  OriginalRow227TriangleData1826.coefficient164_229,
  OriginalRow227TriangleData1826.coefficient164_230,
  OriginalRow227TriangleData1826.coefficient164_231,
  OriginalRow227TriangleData1826.coefficient164_232,
  OriginalRow227TriangleData1826.coefficient164_233,
  OriginalRow227TriangleData1826.coefficient164_234,
  OriginalRow227TriangleData1826.coefficient164_235,
  OriginalRow227TriangleData1826.coefficient164_236,
  OriginalRow227TriangleData1826.coefficient164_237,
  OriginalRow227TriangleData1826.coefficient164_238,
  OriginalRow227TriangleData1826.coefficient164_239,
  OriginalRow227TriangleData1826.coefficient164_240,
  OriginalRow227TriangleData1826.coefficient164_241,
  OriginalRow227TriangleData1826.coefficient164_242,
  OriginalRow227TriangleData1826.coefficient164_243,
  OriginalRow227TriangleData1826.coefficient164_244,
  OriginalRow227TriangleData1826.coefficient164_245,
  OriginalRow227TriangleData1826.coefficient164_246,
  OriginalRow227TriangleData1826.coefficient164_247,
  OriginalRow227TriangleData1826.coefficient164_248,
  OriginalRow227TriangleData1826.coefficient164_249,
  OriginalRow227TriangleData1826.coefficient164_250,
  OriginalRow227TriangleData1826.coefficient164_251,
  OriginalRow227TriangleData1826.coefficient164_252,
  OriginalRow227TriangleData1826.coefficient164_253,
  OriginalRow227TriangleData1826.coefficient164_254,
  OriginalRow227TriangleData1826.coefficient164_255,
  OriginalRow227TriangleData1826.coefficient164_256,
  OriginalRow227TriangleData1826.coefficient164_257,
  OriginalRow227TriangleData1826.coefficient164_258
]

theorem values1826_size : values1826.size = 32 := rfl

def block1826 : ℕ → Option IntervalDyadic := segment 227 values1826

theorem block1826_domain : ExactDomain block1826 227 259 := by
  simpa only [values1826_size] using segment_domain 227 values1826

theorem block1826_get (i : Fin 32) :
    block1826 (227 + i.val) = some (values1826[i.val]'(by rw [values1826_size]; exact i.isLt)) := by
  exact segment_get 227 values1826 ⟨i.val, by rw [values1826_size]; exact i.isLt⟩

def values1827 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1827.coefficient164_259,
  OriginalRow227TriangleData1827.coefficient164_260,
  OriginalRow227TriangleData1827.coefficient164_261,
  OriginalRow227TriangleData1827.coefficient164_262,
  OriginalRow227TriangleData1827.coefficient164_263,
  OriginalRow227TriangleData1827.coefficient164_264,
  OriginalRow227TriangleData1827.coefficient164_265,
  OriginalRow227TriangleData1827.coefficient164_266,
  OriginalRow227TriangleData1827.coefficient164_267,
  OriginalRow227TriangleData1827.coefficient164_268,
  OriginalRow227TriangleData1827.coefficient164_269,
  OriginalRow227TriangleData1827.coefficient164_270,
  OriginalRow227TriangleData1827.coefficient164_271,
  OriginalRow227TriangleData1827.coefficient164_272,
  OriginalRow227TriangleData1827.coefficient164_273,
  OriginalRow227TriangleData1827.coefficient164_274,
  OriginalRow227TriangleData1827.coefficient164_275,
  OriginalRow227TriangleData1827.coefficient164_276,
  OriginalRow227TriangleData1827.coefficient164_277,
  OriginalRow227TriangleData1827.coefficient164_278,
  OriginalRow227TriangleData1827.coefficient164_279,
  OriginalRow227TriangleData1827.coefficient164_280,
  OriginalRow227TriangleData1827.coefficient164_281,
  OriginalRow227TriangleData1827.coefficient164_282,
  OriginalRow227TriangleData1827.coefficient164_283,
  OriginalRow227TriangleData1827.coefficient164_284,
  OriginalRow227TriangleData1827.coefficient164_285,
  OriginalRow227TriangleData1827.coefficient164_286,
  OriginalRow227TriangleData1827.coefficient164_287,
  OriginalRow227TriangleData1827.coefficient164_288,
  OriginalRow227TriangleData1827.coefficient164_289,
  OriginalRow227TriangleData1827.coefficient164_290
]

theorem values1827_size : values1827.size = 32 := rfl

def block1827 : ℕ → Option IntervalDyadic := segment 259 values1827

theorem block1827_domain : ExactDomain block1827 259 291 := by
  simpa only [values1827_size] using segment_domain 259 values1827

theorem block1827_get (i : Fin 32) :
    block1827 (259 + i.val) = some (values1827[i.val]'(by rw [values1827_size]; exact i.isLt)) := by
  exact segment_get 259 values1827 ⟨i.val, by rw [values1827_size]; exact i.isLt⟩

def values1828 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1828.coefficient164_291,
  OriginalRow227TriangleData1828.coefficient164_292,
  OriginalRow227TriangleData1828.coefficient164_293,
  OriginalRow227TriangleData1828.coefficient164_294,
  OriginalRow227TriangleData1828.coefficient164_295,
  OriginalRow227TriangleData1828.coefficient164_296,
  OriginalRow227TriangleData1828.coefficient164_297,
  OriginalRow227TriangleData1828.coefficient164_298,
  OriginalRow227TriangleData1828.coefficient164_299,
  OriginalRow227TriangleData1828.coefficient164_300,
  OriginalRow227TriangleData1828.coefficient164_301,
  OriginalRow227TriangleData1828.coefficient164_302,
  OriginalRow227TriangleData1828.coefficient164_303,
  OriginalRow227TriangleData1828.coefficient164_304,
  OriginalRow227TriangleData1828.coefficient164_305,
  OriginalRow227TriangleData1828.coefficient164_306,
  OriginalRow227TriangleData1828.coefficient164_307,
  OriginalRow227TriangleData1828.coefficient164_308,
  OriginalRow227TriangleData1828.coefficient164_309,
  OriginalRow227TriangleData1828.coefficient164_310,
  OriginalRow227TriangleData1828.coefficient164_311,
  OriginalRow227TriangleData1828.coefficient164_312,
  OriginalRow227TriangleData1828.coefficient164_313,
  OriginalRow227TriangleData1828.coefficient164_314,
  OriginalRow227TriangleData1828.coefficient164_315,
  OriginalRow227TriangleData1828.coefficient164_316,
  OriginalRow227TriangleData1828.coefficient164_317,
  OriginalRow227TriangleData1828.coefficient164_318,
  OriginalRow227TriangleData1828.coefficient164_319,
  OriginalRow227TriangleData1828.coefficient164_320,
  OriginalRow227TriangleData1828.coefficient164_321,
  OriginalRow227TriangleData1828.coefficient164_322
]

theorem values1828_size : values1828.size = 32 := rfl

def block1828 : ℕ → Option IntervalDyadic := segment 291 values1828

theorem block1828_domain : ExactDomain block1828 291 323 := by
  simpa only [values1828_size] using segment_domain 291 values1828

theorem block1828_get (i : Fin 32) :
    block1828 (291 + i.val) = some (values1828[i.val]'(by rw [values1828_size]; exact i.isLt)) := by
  exact segment_get 291 values1828 ⟨i.val, by rw [values1828_size]; exact i.isLt⟩

def values1829 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1829.coefficient164_323,
  OriginalRow227TriangleData1829.coefficient164_324,
  OriginalRow227TriangleData1829.coefficient164_325,
  OriginalRow227TriangleData1829.coefficient164_326,
  OriginalRow227TriangleData1829.coefficient164_327,
  OriginalRow227TriangleData1829.coefficient164_328,
  OriginalRow227TriangleData1829.coefficient164_329,
  OriginalRow227TriangleData1829.coefficient164_330,
  OriginalRow227TriangleData1829.coefficient164_331,
  OriginalRow227TriangleData1829.coefficient164_332,
  OriginalRow227TriangleData1829.coefficient164_333,
  OriginalRow227TriangleData1829.coefficient164_334,
  OriginalRow227TriangleData1829.coefficient164_335,
  OriginalRow227TriangleData1829.coefficient164_336,
  OriginalRow227TriangleData1829.coefficient164_337
]

theorem values1829_size : values1829.size = 15 := rfl

def block1829 : ℕ → Option IntervalDyadic := segment 323 values1829

theorem block1829_domain : ExactDomain block1829 323 338 := by
  simpa only [values1829_size] using segment_domain 323 values1829

theorem block1829_get (i : Fin 15) :
    block1829 (323 + i.val) = some (values1829[i.val]'(by rw [values1829_size]; exact i.isLt)) := by
  exact segment_get 323 values1829 ⟨i.val, by rw [values1829_size]; exact i.isLt⟩

def node0195_0259 : ℕ → Option IntervalDyadic := split 227 block1825 block1826

theorem node0195_0259_domain : ExactDomain node0195_0259 195 259 := by
  exact split_domain (by decide) (by decide) block1825_domain block1826_domain

def node0163_0259 : ℕ → Option IntervalDyadic := split 195 block1824 node0195_0259

theorem node0163_0259_domain : ExactDomain node0163_0259 163 259 := by
  exact split_domain (by decide) (by decide) block1824_domain node0195_0259_domain

def node0291_0338 : ℕ → Option IntervalDyadic := split 323 block1828 block1829

theorem node0291_0338_domain : ExactDomain node0291_0338 291 338 := by
  exact split_domain (by decide) (by decide) block1828_domain block1829_domain

def node0259_0338 : ℕ → Option IntervalDyadic := split 291 block1827 node0291_0338

theorem node0259_0338_domain : ExactDomain node0259_0338 259 338 := by
  exact split_domain (by decide) (by decide) block1827_domain node0291_0338_domain

def node0163_0338 : ℕ → Option IntervalDyadic := split 259 node0163_0259 node0259_0338

theorem node0163_0338_domain : ExactDomain node0163_0338 163 338 := by
  exact split_domain (by decide) (by decide) node0163_0259_domain node0259_0338_domain

def lookup : ℕ → Option IntervalDyadic := node0163_0338

theorem lookup_domain : ExactDomain lookup 163 338 :=
  node0163_0338_domain

theorem block1824_lookup (i : Fin 32) :
    lookup (163 + i.val) = some (values1824[i.val]'(by rw [values1824_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0163_0338 (163 + i.val) = _
  rw [node0163_0338, split_left 259 node0163_0259 node0259_0338 (by omega)]
  rw [node0163_0259, split_left 195 block1824 node0195_0259 (by omega)]
  exact block1824_get i

theorem block1825_lookup (i : Fin 32) :
    lookup (195 + i.val) = some (values1825[i.val]'(by rw [values1825_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0163_0338 (195 + i.val) = _
  rw [node0163_0338, split_left 259 node0163_0259 node0259_0338 (by omega)]
  rw [node0163_0259, split_right 195 block1824 node0195_0259 (by omega)]
  rw [node0195_0259, split_left 227 block1825 block1826 (by omega)]
  exact block1825_get i

theorem block1826_lookup (i : Fin 32) :
    lookup (227 + i.val) = some (values1826[i.val]'(by rw [values1826_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0163_0338 (227 + i.val) = _
  rw [node0163_0338, split_left 259 node0163_0259 node0259_0338 (by omega)]
  rw [node0163_0259, split_right 195 block1824 node0195_0259 (by omega)]
  rw [node0195_0259, split_right 227 block1825 block1826 (by omega)]
  exact block1826_get i

theorem block1827_lookup (i : Fin 32) :
    lookup (259 + i.val) = some (values1827[i.val]'(by rw [values1827_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0163_0338 (259 + i.val) = _
  rw [node0163_0338, split_right 259 node0163_0259 node0259_0338 (by omega)]
  rw [node0259_0338, split_left 291 block1827 node0291_0338 (by omega)]
  exact block1827_get i

theorem block1828_lookup (i : Fin 32) :
    lookup (291 + i.val) = some (values1828[i.val]'(by rw [values1828_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0163_0338 (291 + i.val) = _
  rw [node0163_0338, split_right 259 node0163_0259 node0259_0338 (by omega)]
  rw [node0259_0338, split_right 291 block1827 node0291_0338 (by omega)]
  rw [node0291_0338, split_left 323 block1828 block1829 (by omega)]
  exact block1828_get i

theorem block1829_lookup (i : Fin 15) :
    lookup (323 + i.val) = some (values1829[i.val]'(by rw [values1829_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0163_0338 (323 + i.val) = _
  rw [node0163_0338, split_right 259 node0163_0259 node0259_0338 (by omega)]
  rw [node0259_0338, split_right 291 block1827 node0291_0338 (by omega)]
  rw [node0291_0338, split_right 323 block1828 block1829 (by omega)]
  exact block1829_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1824_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1824_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1825_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1825_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1826_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1826_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1827_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1827_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1828_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1828_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1829_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1829_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1824_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1825_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1826_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1827_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1828_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow164.block1829_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow164
