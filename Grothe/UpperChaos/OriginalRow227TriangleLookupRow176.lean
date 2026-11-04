import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1892
import Grothe.UpperChaos.OriginalRow227TriangleData1893
import Grothe.UpperChaos.OriginalRow227TriangleData1894
import Grothe.UpperChaos.OriginalRow227TriangleData1895
import Grothe.UpperChaos.OriginalRow227TriangleData1896

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow176

open ConditionalTableLookup

def values1892 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1892.coefficient176_175,
  OriginalRow227TriangleData1892.coefficient176_176,
  OriginalRow227TriangleData1892.coefficient176_177,
  OriginalRow227TriangleData1892.coefficient176_178,
  OriginalRow227TriangleData1892.coefficient176_179,
  OriginalRow227TriangleData1892.coefficient176_180,
  OriginalRow227TriangleData1892.coefficient176_181,
  OriginalRow227TriangleData1892.coefficient176_182,
  OriginalRow227TriangleData1892.coefficient176_183,
  OriginalRow227TriangleData1892.coefficient176_184,
  OriginalRow227TriangleData1892.coefficient176_185,
  OriginalRow227TriangleData1892.coefficient176_186,
  OriginalRow227TriangleData1892.coefficient176_187,
  OriginalRow227TriangleData1892.coefficient176_188,
  OriginalRow227TriangleData1892.coefficient176_189,
  OriginalRow227TriangleData1892.coefficient176_190,
  OriginalRow227TriangleData1892.coefficient176_191,
  OriginalRow227TriangleData1892.coefficient176_192,
  OriginalRow227TriangleData1892.coefficient176_193,
  OriginalRow227TriangleData1892.coefficient176_194,
  OriginalRow227TriangleData1892.coefficient176_195,
  OriginalRow227TriangleData1892.coefficient176_196,
  OriginalRow227TriangleData1892.coefficient176_197,
  OriginalRow227TriangleData1892.coefficient176_198,
  OriginalRow227TriangleData1892.coefficient176_199,
  OriginalRow227TriangleData1892.coefficient176_200,
  OriginalRow227TriangleData1892.coefficient176_201,
  OriginalRow227TriangleData1892.coefficient176_202,
  OriginalRow227TriangleData1892.coefficient176_203,
  OriginalRow227TriangleData1892.coefficient176_204,
  OriginalRow227TriangleData1892.coefficient176_205,
  OriginalRow227TriangleData1892.coefficient176_206
]

theorem values1892_size : values1892.size = 32 := rfl

def block1892 : ℕ → Option IntervalDyadic := segment 175 values1892

theorem block1892_domain : ExactDomain block1892 175 207 := by
  simpa only [values1892_size] using segment_domain 175 values1892

theorem block1892_get (i : Fin 32) :
    block1892 (175 + i.val) = some (values1892[i.val]'(by rw [values1892_size]; exact i.isLt)) := by
  exact segment_get 175 values1892 ⟨i.val, by rw [values1892_size]; exact i.isLt⟩

def values1893 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1893.coefficient176_207,
  OriginalRow227TriangleData1893.coefficient176_208,
  OriginalRow227TriangleData1893.coefficient176_209,
  OriginalRow227TriangleData1893.coefficient176_210,
  OriginalRow227TriangleData1893.coefficient176_211,
  OriginalRow227TriangleData1893.coefficient176_212,
  OriginalRow227TriangleData1893.coefficient176_213,
  OriginalRow227TriangleData1893.coefficient176_214,
  OriginalRow227TriangleData1893.coefficient176_215,
  OriginalRow227TriangleData1893.coefficient176_216,
  OriginalRow227TriangleData1893.coefficient176_217,
  OriginalRow227TriangleData1893.coefficient176_218,
  OriginalRow227TriangleData1893.coefficient176_219,
  OriginalRow227TriangleData1893.coefficient176_220,
  OriginalRow227TriangleData1893.coefficient176_221,
  OriginalRow227TriangleData1893.coefficient176_222,
  OriginalRow227TriangleData1893.coefficient176_223,
  OriginalRow227TriangleData1893.coefficient176_224,
  OriginalRow227TriangleData1893.coefficient176_225,
  OriginalRow227TriangleData1893.coefficient176_226,
  OriginalRow227TriangleData1893.coefficient176_227,
  OriginalRow227TriangleData1893.coefficient176_228,
  OriginalRow227TriangleData1893.coefficient176_229,
  OriginalRow227TriangleData1893.coefficient176_230,
  OriginalRow227TriangleData1893.coefficient176_231,
  OriginalRow227TriangleData1893.coefficient176_232,
  OriginalRow227TriangleData1893.coefficient176_233,
  OriginalRow227TriangleData1893.coefficient176_234,
  OriginalRow227TriangleData1893.coefficient176_235,
  OriginalRow227TriangleData1893.coefficient176_236,
  OriginalRow227TriangleData1893.coefficient176_237,
  OriginalRow227TriangleData1893.coefficient176_238
]

theorem values1893_size : values1893.size = 32 := rfl

def block1893 : ℕ → Option IntervalDyadic := segment 207 values1893

theorem block1893_domain : ExactDomain block1893 207 239 := by
  simpa only [values1893_size] using segment_domain 207 values1893

theorem block1893_get (i : Fin 32) :
    block1893 (207 + i.val) = some (values1893[i.val]'(by rw [values1893_size]; exact i.isLt)) := by
  exact segment_get 207 values1893 ⟨i.val, by rw [values1893_size]; exact i.isLt⟩

def values1894 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1894.coefficient176_239,
  OriginalRow227TriangleData1894.coefficient176_240,
  OriginalRow227TriangleData1894.coefficient176_241,
  OriginalRow227TriangleData1894.coefficient176_242,
  OriginalRow227TriangleData1894.coefficient176_243,
  OriginalRow227TriangleData1894.coefficient176_244,
  OriginalRow227TriangleData1894.coefficient176_245,
  OriginalRow227TriangleData1894.coefficient176_246,
  OriginalRow227TriangleData1894.coefficient176_247,
  OriginalRow227TriangleData1894.coefficient176_248,
  OriginalRow227TriangleData1894.coefficient176_249,
  OriginalRow227TriangleData1894.coefficient176_250,
  OriginalRow227TriangleData1894.coefficient176_251,
  OriginalRow227TriangleData1894.coefficient176_252,
  OriginalRow227TriangleData1894.coefficient176_253,
  OriginalRow227TriangleData1894.coefficient176_254,
  OriginalRow227TriangleData1894.coefficient176_255,
  OriginalRow227TriangleData1894.coefficient176_256,
  OriginalRow227TriangleData1894.coefficient176_257,
  OriginalRow227TriangleData1894.coefficient176_258,
  OriginalRow227TriangleData1894.coefficient176_259,
  OriginalRow227TriangleData1894.coefficient176_260,
  OriginalRow227TriangleData1894.coefficient176_261,
  OriginalRow227TriangleData1894.coefficient176_262,
  OriginalRow227TriangleData1894.coefficient176_263,
  OriginalRow227TriangleData1894.coefficient176_264,
  OriginalRow227TriangleData1894.coefficient176_265,
  OriginalRow227TriangleData1894.coefficient176_266,
  OriginalRow227TriangleData1894.coefficient176_267,
  OriginalRow227TriangleData1894.coefficient176_268,
  OriginalRow227TriangleData1894.coefficient176_269,
  OriginalRow227TriangleData1894.coefficient176_270
]

theorem values1894_size : values1894.size = 32 := rfl

def block1894 : ℕ → Option IntervalDyadic := segment 239 values1894

theorem block1894_domain : ExactDomain block1894 239 271 := by
  simpa only [values1894_size] using segment_domain 239 values1894

theorem block1894_get (i : Fin 32) :
    block1894 (239 + i.val) = some (values1894[i.val]'(by rw [values1894_size]; exact i.isLt)) := by
  exact segment_get 239 values1894 ⟨i.val, by rw [values1894_size]; exact i.isLt⟩

def values1895 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1895.coefficient176_271,
  OriginalRow227TriangleData1895.coefficient176_272,
  OriginalRow227TriangleData1895.coefficient176_273,
  OriginalRow227TriangleData1895.coefficient176_274,
  OriginalRow227TriangleData1895.coefficient176_275,
  OriginalRow227TriangleData1895.coefficient176_276,
  OriginalRow227TriangleData1895.coefficient176_277,
  OriginalRow227TriangleData1895.coefficient176_278,
  OriginalRow227TriangleData1895.coefficient176_279,
  OriginalRow227TriangleData1895.coefficient176_280,
  OriginalRow227TriangleData1895.coefficient176_281,
  OriginalRow227TriangleData1895.coefficient176_282,
  OriginalRow227TriangleData1895.coefficient176_283,
  OriginalRow227TriangleData1895.coefficient176_284,
  OriginalRow227TriangleData1895.coefficient176_285,
  OriginalRow227TriangleData1895.coefficient176_286,
  OriginalRow227TriangleData1895.coefficient176_287,
  OriginalRow227TriangleData1895.coefficient176_288,
  OriginalRow227TriangleData1895.coefficient176_289,
  OriginalRow227TriangleData1895.coefficient176_290,
  OriginalRow227TriangleData1895.coefficient176_291,
  OriginalRow227TriangleData1895.coefficient176_292,
  OriginalRow227TriangleData1895.coefficient176_293,
  OriginalRow227TriangleData1895.coefficient176_294,
  OriginalRow227TriangleData1895.coefficient176_295,
  OriginalRow227TriangleData1895.coefficient176_296,
  OriginalRow227TriangleData1895.coefficient176_297,
  OriginalRow227TriangleData1895.coefficient176_298,
  OriginalRow227TriangleData1895.coefficient176_299,
  OriginalRow227TriangleData1895.coefficient176_300,
  OriginalRow227TriangleData1895.coefficient176_301,
  OriginalRow227TriangleData1895.coefficient176_302
]

theorem values1895_size : values1895.size = 32 := rfl

def block1895 : ℕ → Option IntervalDyadic := segment 271 values1895

theorem block1895_domain : ExactDomain block1895 271 303 := by
  simpa only [values1895_size] using segment_domain 271 values1895

theorem block1895_get (i : Fin 32) :
    block1895 (271 + i.val) = some (values1895[i.val]'(by rw [values1895_size]; exact i.isLt)) := by
  exact segment_get 271 values1895 ⟨i.val, by rw [values1895_size]; exact i.isLt⟩

def values1896 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1896.coefficient176_303,
  OriginalRow227TriangleData1896.coefficient176_304,
  OriginalRow227TriangleData1896.coefficient176_305,
  OriginalRow227TriangleData1896.coefficient176_306,
  OriginalRow227TriangleData1896.coefficient176_307,
  OriginalRow227TriangleData1896.coefficient176_308,
  OriginalRow227TriangleData1896.coefficient176_309,
  OriginalRow227TriangleData1896.coefficient176_310,
  OriginalRow227TriangleData1896.coefficient176_311,
  OriginalRow227TriangleData1896.coefficient176_312,
  OriginalRow227TriangleData1896.coefficient176_313,
  OriginalRow227TriangleData1896.coefficient176_314,
  OriginalRow227TriangleData1896.coefficient176_315,
  OriginalRow227TriangleData1896.coefficient176_316,
  OriginalRow227TriangleData1896.coefficient176_317,
  OriginalRow227TriangleData1896.coefficient176_318,
  OriginalRow227TriangleData1896.coefficient176_319,
  OriginalRow227TriangleData1896.coefficient176_320,
  OriginalRow227TriangleData1896.coefficient176_321,
  OriginalRow227TriangleData1896.coefficient176_322,
  OriginalRow227TriangleData1896.coefficient176_323,
  OriginalRow227TriangleData1896.coefficient176_324,
  OriginalRow227TriangleData1896.coefficient176_325
]

theorem values1896_size : values1896.size = 23 := rfl

def block1896 : ℕ → Option IntervalDyadic := segment 303 values1896

theorem block1896_domain : ExactDomain block1896 303 326 := by
  simpa only [values1896_size] using segment_domain 303 values1896

theorem block1896_get (i : Fin 23) :
    block1896 (303 + i.val) = some (values1896[i.val]'(by rw [values1896_size]; exact i.isLt)) := by
  exact segment_get 303 values1896 ⟨i.val, by rw [values1896_size]; exact i.isLt⟩

def node0175_0239 : ℕ → Option IntervalDyadic := split 207 block1892 block1893

theorem node0175_0239_domain : ExactDomain node0175_0239 175 239 := by
  exact split_domain (by decide) (by decide) block1892_domain block1893_domain

def node0271_0326 : ℕ → Option IntervalDyadic := split 303 block1895 block1896

theorem node0271_0326_domain : ExactDomain node0271_0326 271 326 := by
  exact split_domain (by decide) (by decide) block1895_domain block1896_domain

def node0239_0326 : ℕ → Option IntervalDyadic := split 271 block1894 node0271_0326

theorem node0239_0326_domain : ExactDomain node0239_0326 239 326 := by
  exact split_domain (by decide) (by decide) block1894_domain node0271_0326_domain

def node0175_0326 : ℕ → Option IntervalDyadic := split 239 node0175_0239 node0239_0326

theorem node0175_0326_domain : ExactDomain node0175_0326 175 326 := by
  exact split_domain (by decide) (by decide) node0175_0239_domain node0239_0326_domain

def lookup : ℕ → Option IntervalDyadic := node0175_0326

theorem lookup_domain : ExactDomain lookup 175 326 :=
  node0175_0326_domain

theorem block1892_lookup (i : Fin 32) :
    lookup (175 + i.val) = some (values1892[i.val]'(by rw [values1892_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0175_0326 (175 + i.val) = _
  rw [node0175_0326, split_left 239 node0175_0239 node0239_0326 (by omega)]
  rw [node0175_0239, split_left 207 block1892 block1893 (by omega)]
  exact block1892_get i

theorem block1893_lookup (i : Fin 32) :
    lookup (207 + i.val) = some (values1893[i.val]'(by rw [values1893_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0175_0326 (207 + i.val) = _
  rw [node0175_0326, split_left 239 node0175_0239 node0239_0326 (by omega)]
  rw [node0175_0239, split_right 207 block1892 block1893 (by omega)]
  exact block1893_get i

theorem block1894_lookup (i : Fin 32) :
    lookup (239 + i.val) = some (values1894[i.val]'(by rw [values1894_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0175_0326 (239 + i.val) = _
  rw [node0175_0326, split_right 239 node0175_0239 node0239_0326 (by omega)]
  rw [node0239_0326, split_left 271 block1894 node0271_0326 (by omega)]
  exact block1894_get i

theorem block1895_lookup (i : Fin 32) :
    lookup (271 + i.val) = some (values1895[i.val]'(by rw [values1895_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0175_0326 (271 + i.val) = _
  rw [node0175_0326, split_right 239 node0175_0239 node0239_0326 (by omega)]
  rw [node0239_0326, split_right 271 block1894 node0271_0326 (by omega)]
  rw [node0271_0326, split_left 303 block1895 block1896 (by omega)]
  exact block1895_get i

theorem block1896_lookup (i : Fin 23) :
    lookup (303 + i.val) = some (values1896[i.val]'(by rw [values1896_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0175_0326 (303 + i.val) = _
  rw [node0175_0326, split_right 239 node0175_0239 node0239_0326 (by omega)]
  rw [node0239_0326, split_right 271 block1894 node0271_0326 (by omega)]
  rw [node0271_0326, split_right 303 block1895 block1896 (by omega)]
  exact block1896_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1892_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1892_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1893_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1893_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1894_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1894_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1895_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1895_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1896_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1896_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1892_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1893_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1894_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1895_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow176.block1896_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow176
