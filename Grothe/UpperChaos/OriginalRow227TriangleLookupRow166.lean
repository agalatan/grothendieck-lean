import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1836
import Grothe.UpperChaos.OriginalRow227TriangleData1837
import Grothe.UpperChaos.OriginalRow227TriangleData1838
import Grothe.UpperChaos.OriginalRow227TriangleData1839
import Grothe.UpperChaos.OriginalRow227TriangleData1840
import Grothe.UpperChaos.OriginalRow227TriangleData1841

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow166

open ConditionalTableLookup

def values1836 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1836.coefficient166_165,
  OriginalRow227TriangleData1836.coefficient166_166,
  OriginalRow227TriangleData1836.coefficient166_167,
  OriginalRow227TriangleData1836.coefficient166_168,
  OriginalRow227TriangleData1836.coefficient166_169,
  OriginalRow227TriangleData1836.coefficient166_170,
  OriginalRow227TriangleData1836.coefficient166_171,
  OriginalRow227TriangleData1836.coefficient166_172,
  OriginalRow227TriangleData1836.coefficient166_173,
  OriginalRow227TriangleData1836.coefficient166_174,
  OriginalRow227TriangleData1836.coefficient166_175,
  OriginalRow227TriangleData1836.coefficient166_176,
  OriginalRow227TriangleData1836.coefficient166_177,
  OriginalRow227TriangleData1836.coefficient166_178,
  OriginalRow227TriangleData1836.coefficient166_179,
  OriginalRow227TriangleData1836.coefficient166_180,
  OriginalRow227TriangleData1836.coefficient166_181,
  OriginalRow227TriangleData1836.coefficient166_182,
  OriginalRow227TriangleData1836.coefficient166_183,
  OriginalRow227TriangleData1836.coefficient166_184,
  OriginalRow227TriangleData1836.coefficient166_185,
  OriginalRow227TriangleData1836.coefficient166_186,
  OriginalRow227TriangleData1836.coefficient166_187,
  OriginalRow227TriangleData1836.coefficient166_188,
  OriginalRow227TriangleData1836.coefficient166_189,
  OriginalRow227TriangleData1836.coefficient166_190,
  OriginalRow227TriangleData1836.coefficient166_191,
  OriginalRow227TriangleData1836.coefficient166_192,
  OriginalRow227TriangleData1836.coefficient166_193,
  OriginalRow227TriangleData1836.coefficient166_194,
  OriginalRow227TriangleData1836.coefficient166_195,
  OriginalRow227TriangleData1836.coefficient166_196
]

theorem values1836_size : values1836.size = 32 := rfl

def block1836 : ℕ → Option IntervalDyadic := segment 165 values1836

theorem block1836_domain : ExactDomain block1836 165 197 := by
  simpa only [values1836_size] using segment_domain 165 values1836

theorem block1836_get (i : Fin 32) :
    block1836 (165 + i.val) = some (values1836[i.val]'(by rw [values1836_size]; exact i.isLt)) := by
  exact segment_get 165 values1836 ⟨i.val, by rw [values1836_size]; exact i.isLt⟩

def values1837 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1837.coefficient166_197,
  OriginalRow227TriangleData1837.coefficient166_198,
  OriginalRow227TriangleData1837.coefficient166_199,
  OriginalRow227TriangleData1837.coefficient166_200,
  OriginalRow227TriangleData1837.coefficient166_201,
  OriginalRow227TriangleData1837.coefficient166_202,
  OriginalRow227TriangleData1837.coefficient166_203,
  OriginalRow227TriangleData1837.coefficient166_204,
  OriginalRow227TriangleData1837.coefficient166_205,
  OriginalRow227TriangleData1837.coefficient166_206,
  OriginalRow227TriangleData1837.coefficient166_207,
  OriginalRow227TriangleData1837.coefficient166_208,
  OriginalRow227TriangleData1837.coefficient166_209,
  OriginalRow227TriangleData1837.coefficient166_210,
  OriginalRow227TriangleData1837.coefficient166_211,
  OriginalRow227TriangleData1837.coefficient166_212,
  OriginalRow227TriangleData1837.coefficient166_213,
  OriginalRow227TriangleData1837.coefficient166_214,
  OriginalRow227TriangleData1837.coefficient166_215,
  OriginalRow227TriangleData1837.coefficient166_216,
  OriginalRow227TriangleData1837.coefficient166_217,
  OriginalRow227TriangleData1837.coefficient166_218,
  OriginalRow227TriangleData1837.coefficient166_219,
  OriginalRow227TriangleData1837.coefficient166_220,
  OriginalRow227TriangleData1837.coefficient166_221,
  OriginalRow227TriangleData1837.coefficient166_222,
  OriginalRow227TriangleData1837.coefficient166_223,
  OriginalRow227TriangleData1837.coefficient166_224,
  OriginalRow227TriangleData1837.coefficient166_225,
  OriginalRow227TriangleData1837.coefficient166_226,
  OriginalRow227TriangleData1837.coefficient166_227,
  OriginalRow227TriangleData1837.coefficient166_228
]

theorem values1837_size : values1837.size = 32 := rfl

def block1837 : ℕ → Option IntervalDyadic := segment 197 values1837

theorem block1837_domain : ExactDomain block1837 197 229 := by
  simpa only [values1837_size] using segment_domain 197 values1837

theorem block1837_get (i : Fin 32) :
    block1837 (197 + i.val) = some (values1837[i.val]'(by rw [values1837_size]; exact i.isLt)) := by
  exact segment_get 197 values1837 ⟨i.val, by rw [values1837_size]; exact i.isLt⟩

def values1838 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1838.coefficient166_229,
  OriginalRow227TriangleData1838.coefficient166_230,
  OriginalRow227TriangleData1838.coefficient166_231,
  OriginalRow227TriangleData1838.coefficient166_232,
  OriginalRow227TriangleData1838.coefficient166_233,
  OriginalRow227TriangleData1838.coefficient166_234,
  OriginalRow227TriangleData1838.coefficient166_235,
  OriginalRow227TriangleData1838.coefficient166_236,
  OriginalRow227TriangleData1838.coefficient166_237,
  OriginalRow227TriangleData1838.coefficient166_238,
  OriginalRow227TriangleData1838.coefficient166_239,
  OriginalRow227TriangleData1838.coefficient166_240,
  OriginalRow227TriangleData1838.coefficient166_241,
  OriginalRow227TriangleData1838.coefficient166_242,
  OriginalRow227TriangleData1838.coefficient166_243,
  OriginalRow227TriangleData1838.coefficient166_244,
  OriginalRow227TriangleData1838.coefficient166_245,
  OriginalRow227TriangleData1838.coefficient166_246,
  OriginalRow227TriangleData1838.coefficient166_247,
  OriginalRow227TriangleData1838.coefficient166_248,
  OriginalRow227TriangleData1838.coefficient166_249,
  OriginalRow227TriangleData1838.coefficient166_250,
  OriginalRow227TriangleData1838.coefficient166_251,
  OriginalRow227TriangleData1838.coefficient166_252,
  OriginalRow227TriangleData1838.coefficient166_253,
  OriginalRow227TriangleData1838.coefficient166_254,
  OriginalRow227TriangleData1838.coefficient166_255,
  OriginalRow227TriangleData1838.coefficient166_256,
  OriginalRow227TriangleData1838.coefficient166_257,
  OriginalRow227TriangleData1838.coefficient166_258,
  OriginalRow227TriangleData1838.coefficient166_259,
  OriginalRow227TriangleData1838.coefficient166_260
]

theorem values1838_size : values1838.size = 32 := rfl

def block1838 : ℕ → Option IntervalDyadic := segment 229 values1838

theorem block1838_domain : ExactDomain block1838 229 261 := by
  simpa only [values1838_size] using segment_domain 229 values1838

theorem block1838_get (i : Fin 32) :
    block1838 (229 + i.val) = some (values1838[i.val]'(by rw [values1838_size]; exact i.isLt)) := by
  exact segment_get 229 values1838 ⟨i.val, by rw [values1838_size]; exact i.isLt⟩

def values1839 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1839.coefficient166_261,
  OriginalRow227TriangleData1839.coefficient166_262,
  OriginalRow227TriangleData1839.coefficient166_263,
  OriginalRow227TriangleData1839.coefficient166_264,
  OriginalRow227TriangleData1839.coefficient166_265,
  OriginalRow227TriangleData1839.coefficient166_266,
  OriginalRow227TriangleData1839.coefficient166_267,
  OriginalRow227TriangleData1839.coefficient166_268,
  OriginalRow227TriangleData1839.coefficient166_269,
  OriginalRow227TriangleData1839.coefficient166_270,
  OriginalRow227TriangleData1839.coefficient166_271,
  OriginalRow227TriangleData1839.coefficient166_272,
  OriginalRow227TriangleData1839.coefficient166_273,
  OriginalRow227TriangleData1839.coefficient166_274,
  OriginalRow227TriangleData1839.coefficient166_275,
  OriginalRow227TriangleData1839.coefficient166_276,
  OriginalRow227TriangleData1839.coefficient166_277,
  OriginalRow227TriangleData1839.coefficient166_278,
  OriginalRow227TriangleData1839.coefficient166_279,
  OriginalRow227TriangleData1839.coefficient166_280,
  OriginalRow227TriangleData1839.coefficient166_281,
  OriginalRow227TriangleData1839.coefficient166_282,
  OriginalRow227TriangleData1839.coefficient166_283,
  OriginalRow227TriangleData1839.coefficient166_284,
  OriginalRow227TriangleData1839.coefficient166_285,
  OriginalRow227TriangleData1839.coefficient166_286,
  OriginalRow227TriangleData1839.coefficient166_287,
  OriginalRow227TriangleData1839.coefficient166_288,
  OriginalRow227TriangleData1839.coefficient166_289,
  OriginalRow227TriangleData1839.coefficient166_290,
  OriginalRow227TriangleData1839.coefficient166_291,
  OriginalRow227TriangleData1839.coefficient166_292
]

theorem values1839_size : values1839.size = 32 := rfl

def block1839 : ℕ → Option IntervalDyadic := segment 261 values1839

theorem block1839_domain : ExactDomain block1839 261 293 := by
  simpa only [values1839_size] using segment_domain 261 values1839

theorem block1839_get (i : Fin 32) :
    block1839 (261 + i.val) = some (values1839[i.val]'(by rw [values1839_size]; exact i.isLt)) := by
  exact segment_get 261 values1839 ⟨i.val, by rw [values1839_size]; exact i.isLt⟩

def values1840 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1840.coefficient166_293,
  OriginalRow227TriangleData1840.coefficient166_294,
  OriginalRow227TriangleData1840.coefficient166_295,
  OriginalRow227TriangleData1840.coefficient166_296,
  OriginalRow227TriangleData1840.coefficient166_297,
  OriginalRow227TriangleData1840.coefficient166_298,
  OriginalRow227TriangleData1840.coefficient166_299,
  OriginalRow227TriangleData1840.coefficient166_300,
  OriginalRow227TriangleData1840.coefficient166_301,
  OriginalRow227TriangleData1840.coefficient166_302,
  OriginalRow227TriangleData1840.coefficient166_303,
  OriginalRow227TriangleData1840.coefficient166_304,
  OriginalRow227TriangleData1840.coefficient166_305,
  OriginalRow227TriangleData1840.coefficient166_306,
  OriginalRow227TriangleData1840.coefficient166_307,
  OriginalRow227TriangleData1840.coefficient166_308,
  OriginalRow227TriangleData1840.coefficient166_309,
  OriginalRow227TriangleData1840.coefficient166_310,
  OriginalRow227TriangleData1840.coefficient166_311,
  OriginalRow227TriangleData1840.coefficient166_312,
  OriginalRow227TriangleData1840.coefficient166_313,
  OriginalRow227TriangleData1840.coefficient166_314,
  OriginalRow227TriangleData1840.coefficient166_315,
  OriginalRow227TriangleData1840.coefficient166_316,
  OriginalRow227TriangleData1840.coefficient166_317,
  OriginalRow227TriangleData1840.coefficient166_318,
  OriginalRow227TriangleData1840.coefficient166_319,
  OriginalRow227TriangleData1840.coefficient166_320,
  OriginalRow227TriangleData1840.coefficient166_321,
  OriginalRow227TriangleData1840.coefficient166_322,
  OriginalRow227TriangleData1840.coefficient166_323,
  OriginalRow227TriangleData1840.coefficient166_324
]

theorem values1840_size : values1840.size = 32 := rfl

def block1840 : ℕ → Option IntervalDyadic := segment 293 values1840

theorem block1840_domain : ExactDomain block1840 293 325 := by
  simpa only [values1840_size] using segment_domain 293 values1840

theorem block1840_get (i : Fin 32) :
    block1840 (293 + i.val) = some (values1840[i.val]'(by rw [values1840_size]; exact i.isLt)) := by
  exact segment_get 293 values1840 ⟨i.val, by rw [values1840_size]; exact i.isLt⟩

def values1841 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1841.coefficient166_325,
  OriginalRow227TriangleData1841.coefficient166_326,
  OriginalRow227TriangleData1841.coefficient166_327,
  OriginalRow227TriangleData1841.coefficient166_328,
  OriginalRow227TriangleData1841.coefficient166_329,
  OriginalRow227TriangleData1841.coefficient166_330,
  OriginalRow227TriangleData1841.coefficient166_331,
  OriginalRow227TriangleData1841.coefficient166_332,
  OriginalRow227TriangleData1841.coefficient166_333,
  OriginalRow227TriangleData1841.coefficient166_334,
  OriginalRow227TriangleData1841.coefficient166_335
]

theorem values1841_size : values1841.size = 11 := rfl

def block1841 : ℕ → Option IntervalDyadic := segment 325 values1841

theorem block1841_domain : ExactDomain block1841 325 336 := by
  simpa only [values1841_size] using segment_domain 325 values1841

theorem block1841_get (i : Fin 11) :
    block1841 (325 + i.val) = some (values1841[i.val]'(by rw [values1841_size]; exact i.isLt)) := by
  exact segment_get 325 values1841 ⟨i.val, by rw [values1841_size]; exact i.isLt⟩

def node0197_0261 : ℕ → Option IntervalDyadic := split 229 block1837 block1838

theorem node0197_0261_domain : ExactDomain node0197_0261 197 261 := by
  exact split_domain (by decide) (by decide) block1837_domain block1838_domain

def node0165_0261 : ℕ → Option IntervalDyadic := split 197 block1836 node0197_0261

theorem node0165_0261_domain : ExactDomain node0165_0261 165 261 := by
  exact split_domain (by decide) (by decide) block1836_domain node0197_0261_domain

def node0293_0336 : ℕ → Option IntervalDyadic := split 325 block1840 block1841

theorem node0293_0336_domain : ExactDomain node0293_0336 293 336 := by
  exact split_domain (by decide) (by decide) block1840_domain block1841_domain

def node0261_0336 : ℕ → Option IntervalDyadic := split 293 block1839 node0293_0336

theorem node0261_0336_domain : ExactDomain node0261_0336 261 336 := by
  exact split_domain (by decide) (by decide) block1839_domain node0293_0336_domain

def node0165_0336 : ℕ → Option IntervalDyadic := split 261 node0165_0261 node0261_0336

theorem node0165_0336_domain : ExactDomain node0165_0336 165 336 := by
  exact split_domain (by decide) (by decide) node0165_0261_domain node0261_0336_domain

def lookup : ℕ → Option IntervalDyadic := node0165_0336

theorem lookup_domain : ExactDomain lookup 165 336 :=
  node0165_0336_domain

theorem block1836_lookup (i : Fin 32) :
    lookup (165 + i.val) = some (values1836[i.val]'(by rw [values1836_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0165_0336 (165 + i.val) = _
  rw [node0165_0336, split_left 261 node0165_0261 node0261_0336 (by omega)]
  rw [node0165_0261, split_left 197 block1836 node0197_0261 (by omega)]
  exact block1836_get i

theorem block1837_lookup (i : Fin 32) :
    lookup (197 + i.val) = some (values1837[i.val]'(by rw [values1837_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0165_0336 (197 + i.val) = _
  rw [node0165_0336, split_left 261 node0165_0261 node0261_0336 (by omega)]
  rw [node0165_0261, split_right 197 block1836 node0197_0261 (by omega)]
  rw [node0197_0261, split_left 229 block1837 block1838 (by omega)]
  exact block1837_get i

theorem block1838_lookup (i : Fin 32) :
    lookup (229 + i.val) = some (values1838[i.val]'(by rw [values1838_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0165_0336 (229 + i.val) = _
  rw [node0165_0336, split_left 261 node0165_0261 node0261_0336 (by omega)]
  rw [node0165_0261, split_right 197 block1836 node0197_0261 (by omega)]
  rw [node0197_0261, split_right 229 block1837 block1838 (by omega)]
  exact block1838_get i

theorem block1839_lookup (i : Fin 32) :
    lookup (261 + i.val) = some (values1839[i.val]'(by rw [values1839_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0165_0336 (261 + i.val) = _
  rw [node0165_0336, split_right 261 node0165_0261 node0261_0336 (by omega)]
  rw [node0261_0336, split_left 293 block1839 node0293_0336 (by omega)]
  exact block1839_get i

theorem block1840_lookup (i : Fin 32) :
    lookup (293 + i.val) = some (values1840[i.val]'(by rw [values1840_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0165_0336 (293 + i.val) = _
  rw [node0165_0336, split_right 261 node0165_0261 node0261_0336 (by omega)]
  rw [node0261_0336, split_right 293 block1839 node0293_0336 (by omega)]
  rw [node0293_0336, split_left 325 block1840 block1841 (by omega)]
  exact block1840_get i

theorem block1841_lookup (i : Fin 11) :
    lookup (325 + i.val) = some (values1841[i.val]'(by rw [values1841_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0165_0336 (325 + i.val) = _
  rw [node0165_0336, split_right 261 node0165_0261 node0261_0336 (by omega)]
  rw [node0261_0336, split_right 293 block1839 node0293_0336 (by omega)]
  rw [node0293_0336, split_right 325 block1840 block1841 (by omega)]
  exact block1841_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1836_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1836_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1837_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1837_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1838_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1838_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1839_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1839_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1840_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1840_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1841_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1841_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1836_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1837_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1838_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1839_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1840_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow166.block1841_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow166
