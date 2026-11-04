import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1902
import Grothe.UpperChaos.OriginalRow227TriangleData1903
import Grothe.UpperChaos.OriginalRow227TriangleData1904
import Grothe.UpperChaos.OriginalRow227TriangleData1905
import Grothe.UpperChaos.OriginalRow227TriangleData1906

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow178

open ConditionalTableLookup

def values1902 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1902.coefficient178_177,
  OriginalRow227TriangleData1902.coefficient178_178,
  OriginalRow227TriangleData1902.coefficient178_179,
  OriginalRow227TriangleData1902.coefficient178_180,
  OriginalRow227TriangleData1902.coefficient178_181,
  OriginalRow227TriangleData1902.coefficient178_182,
  OriginalRow227TriangleData1902.coefficient178_183,
  OriginalRow227TriangleData1902.coefficient178_184,
  OriginalRow227TriangleData1902.coefficient178_185,
  OriginalRow227TriangleData1902.coefficient178_186,
  OriginalRow227TriangleData1902.coefficient178_187,
  OriginalRow227TriangleData1902.coefficient178_188,
  OriginalRow227TriangleData1902.coefficient178_189,
  OriginalRow227TriangleData1902.coefficient178_190,
  OriginalRow227TriangleData1902.coefficient178_191,
  OriginalRow227TriangleData1902.coefficient178_192,
  OriginalRow227TriangleData1902.coefficient178_193,
  OriginalRow227TriangleData1902.coefficient178_194,
  OriginalRow227TriangleData1902.coefficient178_195,
  OriginalRow227TriangleData1902.coefficient178_196,
  OriginalRow227TriangleData1902.coefficient178_197,
  OriginalRow227TriangleData1902.coefficient178_198,
  OriginalRow227TriangleData1902.coefficient178_199,
  OriginalRow227TriangleData1902.coefficient178_200,
  OriginalRow227TriangleData1902.coefficient178_201,
  OriginalRow227TriangleData1902.coefficient178_202,
  OriginalRow227TriangleData1902.coefficient178_203,
  OriginalRow227TriangleData1902.coefficient178_204,
  OriginalRow227TriangleData1902.coefficient178_205,
  OriginalRow227TriangleData1902.coefficient178_206,
  OriginalRow227TriangleData1902.coefficient178_207,
  OriginalRow227TriangleData1902.coefficient178_208
]

theorem values1902_size : values1902.size = 32 := rfl

def block1902 : ℕ → Option IntervalDyadic := segment 177 values1902

theorem block1902_domain : ExactDomain block1902 177 209 := by
  simpa only [values1902_size] using segment_domain 177 values1902

theorem block1902_get (i : Fin 32) :
    block1902 (177 + i.val) = some (values1902[i.val]'(by rw [values1902_size]; exact i.isLt)) := by
  exact segment_get 177 values1902 ⟨i.val, by rw [values1902_size]; exact i.isLt⟩

def values1903 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1903.coefficient178_209,
  OriginalRow227TriangleData1903.coefficient178_210,
  OriginalRow227TriangleData1903.coefficient178_211,
  OriginalRow227TriangleData1903.coefficient178_212,
  OriginalRow227TriangleData1903.coefficient178_213,
  OriginalRow227TriangleData1903.coefficient178_214,
  OriginalRow227TriangleData1903.coefficient178_215,
  OriginalRow227TriangleData1903.coefficient178_216,
  OriginalRow227TriangleData1903.coefficient178_217,
  OriginalRow227TriangleData1903.coefficient178_218,
  OriginalRow227TriangleData1903.coefficient178_219,
  OriginalRow227TriangleData1903.coefficient178_220,
  OriginalRow227TriangleData1903.coefficient178_221,
  OriginalRow227TriangleData1903.coefficient178_222,
  OriginalRow227TriangleData1903.coefficient178_223,
  OriginalRow227TriangleData1903.coefficient178_224,
  OriginalRow227TriangleData1903.coefficient178_225,
  OriginalRow227TriangleData1903.coefficient178_226,
  OriginalRow227TriangleData1903.coefficient178_227,
  OriginalRow227TriangleData1903.coefficient178_228,
  OriginalRow227TriangleData1903.coefficient178_229,
  OriginalRow227TriangleData1903.coefficient178_230,
  OriginalRow227TriangleData1903.coefficient178_231,
  OriginalRow227TriangleData1903.coefficient178_232,
  OriginalRow227TriangleData1903.coefficient178_233,
  OriginalRow227TriangleData1903.coefficient178_234,
  OriginalRow227TriangleData1903.coefficient178_235,
  OriginalRow227TriangleData1903.coefficient178_236,
  OriginalRow227TriangleData1903.coefficient178_237,
  OriginalRow227TriangleData1903.coefficient178_238,
  OriginalRow227TriangleData1903.coefficient178_239,
  OriginalRow227TriangleData1903.coefficient178_240
]

theorem values1903_size : values1903.size = 32 := rfl

def block1903 : ℕ → Option IntervalDyadic := segment 209 values1903

theorem block1903_domain : ExactDomain block1903 209 241 := by
  simpa only [values1903_size] using segment_domain 209 values1903

theorem block1903_get (i : Fin 32) :
    block1903 (209 + i.val) = some (values1903[i.val]'(by rw [values1903_size]; exact i.isLt)) := by
  exact segment_get 209 values1903 ⟨i.val, by rw [values1903_size]; exact i.isLt⟩

def values1904 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1904.coefficient178_241,
  OriginalRow227TriangleData1904.coefficient178_242,
  OriginalRow227TriangleData1904.coefficient178_243,
  OriginalRow227TriangleData1904.coefficient178_244,
  OriginalRow227TriangleData1904.coefficient178_245,
  OriginalRow227TriangleData1904.coefficient178_246,
  OriginalRow227TriangleData1904.coefficient178_247,
  OriginalRow227TriangleData1904.coefficient178_248,
  OriginalRow227TriangleData1904.coefficient178_249,
  OriginalRow227TriangleData1904.coefficient178_250,
  OriginalRow227TriangleData1904.coefficient178_251,
  OriginalRow227TriangleData1904.coefficient178_252,
  OriginalRow227TriangleData1904.coefficient178_253,
  OriginalRow227TriangleData1904.coefficient178_254,
  OriginalRow227TriangleData1904.coefficient178_255,
  OriginalRow227TriangleData1904.coefficient178_256,
  OriginalRow227TriangleData1904.coefficient178_257,
  OriginalRow227TriangleData1904.coefficient178_258,
  OriginalRow227TriangleData1904.coefficient178_259,
  OriginalRow227TriangleData1904.coefficient178_260,
  OriginalRow227TriangleData1904.coefficient178_261,
  OriginalRow227TriangleData1904.coefficient178_262,
  OriginalRow227TriangleData1904.coefficient178_263,
  OriginalRow227TriangleData1904.coefficient178_264,
  OriginalRow227TriangleData1904.coefficient178_265,
  OriginalRow227TriangleData1904.coefficient178_266,
  OriginalRow227TriangleData1904.coefficient178_267,
  OriginalRow227TriangleData1904.coefficient178_268,
  OriginalRow227TriangleData1904.coefficient178_269,
  OriginalRow227TriangleData1904.coefficient178_270,
  OriginalRow227TriangleData1904.coefficient178_271,
  OriginalRow227TriangleData1904.coefficient178_272
]

theorem values1904_size : values1904.size = 32 := rfl

def block1904 : ℕ → Option IntervalDyadic := segment 241 values1904

theorem block1904_domain : ExactDomain block1904 241 273 := by
  simpa only [values1904_size] using segment_domain 241 values1904

theorem block1904_get (i : Fin 32) :
    block1904 (241 + i.val) = some (values1904[i.val]'(by rw [values1904_size]; exact i.isLt)) := by
  exact segment_get 241 values1904 ⟨i.val, by rw [values1904_size]; exact i.isLt⟩

def values1905 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1905.coefficient178_273,
  OriginalRow227TriangleData1905.coefficient178_274,
  OriginalRow227TriangleData1905.coefficient178_275,
  OriginalRow227TriangleData1905.coefficient178_276,
  OriginalRow227TriangleData1905.coefficient178_277,
  OriginalRow227TriangleData1905.coefficient178_278,
  OriginalRow227TriangleData1905.coefficient178_279,
  OriginalRow227TriangleData1905.coefficient178_280,
  OriginalRow227TriangleData1905.coefficient178_281,
  OriginalRow227TriangleData1905.coefficient178_282,
  OriginalRow227TriangleData1905.coefficient178_283,
  OriginalRow227TriangleData1905.coefficient178_284,
  OriginalRow227TriangleData1905.coefficient178_285,
  OriginalRow227TriangleData1905.coefficient178_286,
  OriginalRow227TriangleData1905.coefficient178_287,
  OriginalRow227TriangleData1905.coefficient178_288,
  OriginalRow227TriangleData1905.coefficient178_289,
  OriginalRow227TriangleData1905.coefficient178_290,
  OriginalRow227TriangleData1905.coefficient178_291,
  OriginalRow227TriangleData1905.coefficient178_292,
  OriginalRow227TriangleData1905.coefficient178_293,
  OriginalRow227TriangleData1905.coefficient178_294,
  OriginalRow227TriangleData1905.coefficient178_295,
  OriginalRow227TriangleData1905.coefficient178_296,
  OriginalRow227TriangleData1905.coefficient178_297,
  OriginalRow227TriangleData1905.coefficient178_298,
  OriginalRow227TriangleData1905.coefficient178_299,
  OriginalRow227TriangleData1905.coefficient178_300,
  OriginalRow227TriangleData1905.coefficient178_301,
  OriginalRow227TriangleData1905.coefficient178_302,
  OriginalRow227TriangleData1905.coefficient178_303,
  OriginalRow227TriangleData1905.coefficient178_304
]

theorem values1905_size : values1905.size = 32 := rfl

def block1905 : ℕ → Option IntervalDyadic := segment 273 values1905

theorem block1905_domain : ExactDomain block1905 273 305 := by
  simpa only [values1905_size] using segment_domain 273 values1905

theorem block1905_get (i : Fin 32) :
    block1905 (273 + i.val) = some (values1905[i.val]'(by rw [values1905_size]; exact i.isLt)) := by
  exact segment_get 273 values1905 ⟨i.val, by rw [values1905_size]; exact i.isLt⟩

def values1906 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1906.coefficient178_305,
  OriginalRow227TriangleData1906.coefficient178_306,
  OriginalRow227TriangleData1906.coefficient178_307,
  OriginalRow227TriangleData1906.coefficient178_308,
  OriginalRow227TriangleData1906.coefficient178_309,
  OriginalRow227TriangleData1906.coefficient178_310,
  OriginalRow227TriangleData1906.coefficient178_311,
  OriginalRow227TriangleData1906.coefficient178_312,
  OriginalRow227TriangleData1906.coefficient178_313,
  OriginalRow227TriangleData1906.coefficient178_314,
  OriginalRow227TriangleData1906.coefficient178_315,
  OriginalRow227TriangleData1906.coefficient178_316,
  OriginalRow227TriangleData1906.coefficient178_317,
  OriginalRow227TriangleData1906.coefficient178_318,
  OriginalRow227TriangleData1906.coefficient178_319,
  OriginalRow227TriangleData1906.coefficient178_320,
  OriginalRow227TriangleData1906.coefficient178_321,
  OriginalRow227TriangleData1906.coefficient178_322,
  OriginalRow227TriangleData1906.coefficient178_323
]

theorem values1906_size : values1906.size = 19 := rfl

def block1906 : ℕ → Option IntervalDyadic := segment 305 values1906

theorem block1906_domain : ExactDomain block1906 305 324 := by
  simpa only [values1906_size] using segment_domain 305 values1906

theorem block1906_get (i : Fin 19) :
    block1906 (305 + i.val) = some (values1906[i.val]'(by rw [values1906_size]; exact i.isLt)) := by
  exact segment_get 305 values1906 ⟨i.val, by rw [values1906_size]; exact i.isLt⟩

def node0177_0241 : ℕ → Option IntervalDyadic := split 209 block1902 block1903

theorem node0177_0241_domain : ExactDomain node0177_0241 177 241 := by
  exact split_domain (by decide) (by decide) block1902_domain block1903_domain

def node0273_0324 : ℕ → Option IntervalDyadic := split 305 block1905 block1906

theorem node0273_0324_domain : ExactDomain node0273_0324 273 324 := by
  exact split_domain (by decide) (by decide) block1905_domain block1906_domain

def node0241_0324 : ℕ → Option IntervalDyadic := split 273 block1904 node0273_0324

theorem node0241_0324_domain : ExactDomain node0241_0324 241 324 := by
  exact split_domain (by decide) (by decide) block1904_domain node0273_0324_domain

def node0177_0324 : ℕ → Option IntervalDyadic := split 241 node0177_0241 node0241_0324

theorem node0177_0324_domain : ExactDomain node0177_0324 177 324 := by
  exact split_domain (by decide) (by decide) node0177_0241_domain node0241_0324_domain

def lookup : ℕ → Option IntervalDyadic := node0177_0324

theorem lookup_domain : ExactDomain lookup 177 324 :=
  node0177_0324_domain

theorem block1902_lookup (i : Fin 32) :
    lookup (177 + i.val) = some (values1902[i.val]'(by rw [values1902_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0177_0324 (177 + i.val) = _
  rw [node0177_0324, split_left 241 node0177_0241 node0241_0324 (by omega)]
  rw [node0177_0241, split_left 209 block1902 block1903 (by omega)]
  exact block1902_get i

theorem block1903_lookup (i : Fin 32) :
    lookup (209 + i.val) = some (values1903[i.val]'(by rw [values1903_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0177_0324 (209 + i.val) = _
  rw [node0177_0324, split_left 241 node0177_0241 node0241_0324 (by omega)]
  rw [node0177_0241, split_right 209 block1902 block1903 (by omega)]
  exact block1903_get i

theorem block1904_lookup (i : Fin 32) :
    lookup (241 + i.val) = some (values1904[i.val]'(by rw [values1904_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0177_0324 (241 + i.val) = _
  rw [node0177_0324, split_right 241 node0177_0241 node0241_0324 (by omega)]
  rw [node0241_0324, split_left 273 block1904 node0273_0324 (by omega)]
  exact block1904_get i

theorem block1905_lookup (i : Fin 32) :
    lookup (273 + i.val) = some (values1905[i.val]'(by rw [values1905_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0177_0324 (273 + i.val) = _
  rw [node0177_0324, split_right 241 node0177_0241 node0241_0324 (by omega)]
  rw [node0241_0324, split_right 273 block1904 node0273_0324 (by omega)]
  rw [node0273_0324, split_left 305 block1905 block1906 (by omega)]
  exact block1905_get i

theorem block1906_lookup (i : Fin 19) :
    lookup (305 + i.val) = some (values1906[i.val]'(by rw [values1906_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0177_0324 (305 + i.val) = _
  rw [node0177_0324, split_right 241 node0177_0241 node0241_0324 (by omega)]
  rw [node0241_0324, split_right 273 block1904 node0273_0324 (by omega)]
  rw [node0273_0324, split_right 305 block1905 block1906 (by omega)]
  exact block1906_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1902_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1902_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1903_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1903_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1904_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1904_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1905_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1905_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1906_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1906_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1902_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1903_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1904_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1905_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow178.block1906_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow178
