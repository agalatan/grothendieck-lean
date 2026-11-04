import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1782
import Grothe.UpperChaos.OriginalRow227TriangleData1783
import Grothe.UpperChaos.OriginalRow227TriangleData1784
import Grothe.UpperChaos.OriginalRow227TriangleData1785
import Grothe.UpperChaos.OriginalRow227TriangleData1786
import Grothe.UpperChaos.OriginalRow227TriangleData1787

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow157

open ConditionalTableLookup

def values1782 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1782.coefficient157_156,
  OriginalRow227TriangleData1782.coefficient157_157,
  OriginalRow227TriangleData1782.coefficient157_158,
  OriginalRow227TriangleData1782.coefficient157_159,
  OriginalRow227TriangleData1782.coefficient157_160,
  OriginalRow227TriangleData1782.coefficient157_161,
  OriginalRow227TriangleData1782.coefficient157_162,
  OriginalRow227TriangleData1782.coefficient157_163,
  OriginalRow227TriangleData1782.coefficient157_164,
  OriginalRow227TriangleData1782.coefficient157_165,
  OriginalRow227TriangleData1782.coefficient157_166,
  OriginalRow227TriangleData1782.coefficient157_167,
  OriginalRow227TriangleData1782.coefficient157_168,
  OriginalRow227TriangleData1782.coefficient157_169,
  OriginalRow227TriangleData1782.coefficient157_170,
  OriginalRow227TriangleData1782.coefficient157_171,
  OriginalRow227TriangleData1782.coefficient157_172,
  OriginalRow227TriangleData1782.coefficient157_173,
  OriginalRow227TriangleData1782.coefficient157_174,
  OriginalRow227TriangleData1782.coefficient157_175,
  OriginalRow227TriangleData1782.coefficient157_176,
  OriginalRow227TriangleData1782.coefficient157_177,
  OriginalRow227TriangleData1782.coefficient157_178,
  OriginalRow227TriangleData1782.coefficient157_179,
  OriginalRow227TriangleData1782.coefficient157_180,
  OriginalRow227TriangleData1782.coefficient157_181,
  OriginalRow227TriangleData1782.coefficient157_182,
  OriginalRow227TriangleData1782.coefficient157_183,
  OriginalRow227TriangleData1782.coefficient157_184,
  OriginalRow227TriangleData1782.coefficient157_185,
  OriginalRow227TriangleData1782.coefficient157_186,
  OriginalRow227TriangleData1782.coefficient157_187
]

theorem values1782_size : values1782.size = 32 := rfl

def block1782 : ℕ → Option IntervalDyadic := segment 156 values1782

theorem block1782_domain : ExactDomain block1782 156 188 := by
  simpa only [values1782_size] using segment_domain 156 values1782

theorem block1782_get (i : Fin 32) :
    block1782 (156 + i.val) = some (values1782[i.val]'(by rw [values1782_size]; exact i.isLt)) := by
  exact segment_get 156 values1782 ⟨i.val, by rw [values1782_size]; exact i.isLt⟩

def values1783 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1783.coefficient157_188,
  OriginalRow227TriangleData1783.coefficient157_189,
  OriginalRow227TriangleData1783.coefficient157_190,
  OriginalRow227TriangleData1783.coefficient157_191,
  OriginalRow227TriangleData1783.coefficient157_192,
  OriginalRow227TriangleData1783.coefficient157_193,
  OriginalRow227TriangleData1783.coefficient157_194,
  OriginalRow227TriangleData1783.coefficient157_195,
  OriginalRow227TriangleData1783.coefficient157_196,
  OriginalRow227TriangleData1783.coefficient157_197,
  OriginalRow227TriangleData1783.coefficient157_198,
  OriginalRow227TriangleData1783.coefficient157_199,
  OriginalRow227TriangleData1783.coefficient157_200,
  OriginalRow227TriangleData1783.coefficient157_201,
  OriginalRow227TriangleData1783.coefficient157_202,
  OriginalRow227TriangleData1783.coefficient157_203,
  OriginalRow227TriangleData1783.coefficient157_204,
  OriginalRow227TriangleData1783.coefficient157_205,
  OriginalRow227TriangleData1783.coefficient157_206,
  OriginalRow227TriangleData1783.coefficient157_207,
  OriginalRow227TriangleData1783.coefficient157_208,
  OriginalRow227TriangleData1783.coefficient157_209,
  OriginalRow227TriangleData1783.coefficient157_210,
  OriginalRow227TriangleData1783.coefficient157_211,
  OriginalRow227TriangleData1783.coefficient157_212,
  OriginalRow227TriangleData1783.coefficient157_213,
  OriginalRow227TriangleData1783.coefficient157_214,
  OriginalRow227TriangleData1783.coefficient157_215,
  OriginalRow227TriangleData1783.coefficient157_216,
  OriginalRow227TriangleData1783.coefficient157_217,
  OriginalRow227TriangleData1783.coefficient157_218,
  OriginalRow227TriangleData1783.coefficient157_219
]

theorem values1783_size : values1783.size = 32 := rfl

def block1783 : ℕ → Option IntervalDyadic := segment 188 values1783

theorem block1783_domain : ExactDomain block1783 188 220 := by
  simpa only [values1783_size] using segment_domain 188 values1783

theorem block1783_get (i : Fin 32) :
    block1783 (188 + i.val) = some (values1783[i.val]'(by rw [values1783_size]; exact i.isLt)) := by
  exact segment_get 188 values1783 ⟨i.val, by rw [values1783_size]; exact i.isLt⟩

def values1784 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1784.coefficient157_220,
  OriginalRow227TriangleData1784.coefficient157_221,
  OriginalRow227TriangleData1784.coefficient157_222,
  OriginalRow227TriangleData1784.coefficient157_223,
  OriginalRow227TriangleData1784.coefficient157_224,
  OriginalRow227TriangleData1784.coefficient157_225,
  OriginalRow227TriangleData1784.coefficient157_226,
  OriginalRow227TriangleData1784.coefficient157_227,
  OriginalRow227TriangleData1784.coefficient157_228,
  OriginalRow227TriangleData1784.coefficient157_229,
  OriginalRow227TriangleData1784.coefficient157_230,
  OriginalRow227TriangleData1784.coefficient157_231,
  OriginalRow227TriangleData1784.coefficient157_232,
  OriginalRow227TriangleData1784.coefficient157_233,
  OriginalRow227TriangleData1784.coefficient157_234,
  OriginalRow227TriangleData1784.coefficient157_235,
  OriginalRow227TriangleData1784.coefficient157_236,
  OriginalRow227TriangleData1784.coefficient157_237,
  OriginalRow227TriangleData1784.coefficient157_238,
  OriginalRow227TriangleData1784.coefficient157_239,
  OriginalRow227TriangleData1784.coefficient157_240,
  OriginalRow227TriangleData1784.coefficient157_241,
  OriginalRow227TriangleData1784.coefficient157_242,
  OriginalRow227TriangleData1784.coefficient157_243,
  OriginalRow227TriangleData1784.coefficient157_244,
  OriginalRow227TriangleData1784.coefficient157_245,
  OriginalRow227TriangleData1784.coefficient157_246,
  OriginalRow227TriangleData1784.coefficient157_247,
  OriginalRow227TriangleData1784.coefficient157_248,
  OriginalRow227TriangleData1784.coefficient157_249,
  OriginalRow227TriangleData1784.coefficient157_250,
  OriginalRow227TriangleData1784.coefficient157_251
]

theorem values1784_size : values1784.size = 32 := rfl

def block1784 : ℕ → Option IntervalDyadic := segment 220 values1784

theorem block1784_domain : ExactDomain block1784 220 252 := by
  simpa only [values1784_size] using segment_domain 220 values1784

theorem block1784_get (i : Fin 32) :
    block1784 (220 + i.val) = some (values1784[i.val]'(by rw [values1784_size]; exact i.isLt)) := by
  exact segment_get 220 values1784 ⟨i.val, by rw [values1784_size]; exact i.isLt⟩

def values1785 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1785.coefficient157_252,
  OriginalRow227TriangleData1785.coefficient157_253,
  OriginalRow227TriangleData1785.coefficient157_254,
  OriginalRow227TriangleData1785.coefficient157_255,
  OriginalRow227TriangleData1785.coefficient157_256,
  OriginalRow227TriangleData1785.coefficient157_257,
  OriginalRow227TriangleData1785.coefficient157_258,
  OriginalRow227TriangleData1785.coefficient157_259,
  OriginalRow227TriangleData1785.coefficient157_260,
  OriginalRow227TriangleData1785.coefficient157_261,
  OriginalRow227TriangleData1785.coefficient157_262,
  OriginalRow227TriangleData1785.coefficient157_263,
  OriginalRow227TriangleData1785.coefficient157_264,
  OriginalRow227TriangleData1785.coefficient157_265,
  OriginalRow227TriangleData1785.coefficient157_266,
  OriginalRow227TriangleData1785.coefficient157_267,
  OriginalRow227TriangleData1785.coefficient157_268,
  OriginalRow227TriangleData1785.coefficient157_269,
  OriginalRow227TriangleData1785.coefficient157_270,
  OriginalRow227TriangleData1785.coefficient157_271,
  OriginalRow227TriangleData1785.coefficient157_272,
  OriginalRow227TriangleData1785.coefficient157_273,
  OriginalRow227TriangleData1785.coefficient157_274,
  OriginalRow227TriangleData1785.coefficient157_275,
  OriginalRow227TriangleData1785.coefficient157_276,
  OriginalRow227TriangleData1785.coefficient157_277,
  OriginalRow227TriangleData1785.coefficient157_278,
  OriginalRow227TriangleData1785.coefficient157_279,
  OriginalRow227TriangleData1785.coefficient157_280,
  OriginalRow227TriangleData1785.coefficient157_281,
  OriginalRow227TriangleData1785.coefficient157_282,
  OriginalRow227TriangleData1785.coefficient157_283
]

theorem values1785_size : values1785.size = 32 := rfl

def block1785 : ℕ → Option IntervalDyadic := segment 252 values1785

theorem block1785_domain : ExactDomain block1785 252 284 := by
  simpa only [values1785_size] using segment_domain 252 values1785

theorem block1785_get (i : Fin 32) :
    block1785 (252 + i.val) = some (values1785[i.val]'(by rw [values1785_size]; exact i.isLt)) := by
  exact segment_get 252 values1785 ⟨i.val, by rw [values1785_size]; exact i.isLt⟩

def values1786 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1786.coefficient157_284,
  OriginalRow227TriangleData1786.coefficient157_285,
  OriginalRow227TriangleData1786.coefficient157_286,
  OriginalRow227TriangleData1786.coefficient157_287,
  OriginalRow227TriangleData1786.coefficient157_288,
  OriginalRow227TriangleData1786.coefficient157_289,
  OriginalRow227TriangleData1786.coefficient157_290,
  OriginalRow227TriangleData1786.coefficient157_291,
  OriginalRow227TriangleData1786.coefficient157_292,
  OriginalRow227TriangleData1786.coefficient157_293,
  OriginalRow227TriangleData1786.coefficient157_294,
  OriginalRow227TriangleData1786.coefficient157_295,
  OriginalRow227TriangleData1786.coefficient157_296,
  OriginalRow227TriangleData1786.coefficient157_297,
  OriginalRow227TriangleData1786.coefficient157_298,
  OriginalRow227TriangleData1786.coefficient157_299,
  OriginalRow227TriangleData1786.coefficient157_300,
  OriginalRow227TriangleData1786.coefficient157_301,
  OriginalRow227TriangleData1786.coefficient157_302,
  OriginalRow227TriangleData1786.coefficient157_303,
  OriginalRow227TriangleData1786.coefficient157_304,
  OriginalRow227TriangleData1786.coefficient157_305,
  OriginalRow227TriangleData1786.coefficient157_306,
  OriginalRow227TriangleData1786.coefficient157_307,
  OriginalRow227TriangleData1786.coefficient157_308,
  OriginalRow227TriangleData1786.coefficient157_309,
  OriginalRow227TriangleData1786.coefficient157_310,
  OriginalRow227TriangleData1786.coefficient157_311,
  OriginalRow227TriangleData1786.coefficient157_312,
  OriginalRow227TriangleData1786.coefficient157_313,
  OriginalRow227TriangleData1786.coefficient157_314,
  OriginalRow227TriangleData1786.coefficient157_315
]

theorem values1786_size : values1786.size = 32 := rfl

def block1786 : ℕ → Option IntervalDyadic := segment 284 values1786

theorem block1786_domain : ExactDomain block1786 284 316 := by
  simpa only [values1786_size] using segment_domain 284 values1786

theorem block1786_get (i : Fin 32) :
    block1786 (284 + i.val) = some (values1786[i.val]'(by rw [values1786_size]; exact i.isLt)) := by
  exact segment_get 284 values1786 ⟨i.val, by rw [values1786_size]; exact i.isLt⟩

def values1787 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1787.coefficient157_316,
  OriginalRow227TriangleData1787.coefficient157_317,
  OriginalRow227TriangleData1787.coefficient157_318,
  OriginalRow227TriangleData1787.coefficient157_319,
  OriginalRow227TriangleData1787.coefficient157_320,
  OriginalRow227TriangleData1787.coefficient157_321,
  OriginalRow227TriangleData1787.coefficient157_322,
  OriginalRow227TriangleData1787.coefficient157_323,
  OriginalRow227TriangleData1787.coefficient157_324,
  OriginalRow227TriangleData1787.coefficient157_325,
  OriginalRow227TriangleData1787.coefficient157_326,
  OriginalRow227TriangleData1787.coefficient157_327,
  OriginalRow227TriangleData1787.coefficient157_328,
  OriginalRow227TriangleData1787.coefficient157_329,
  OriginalRow227TriangleData1787.coefficient157_330,
  OriginalRow227TriangleData1787.coefficient157_331,
  OriginalRow227TriangleData1787.coefficient157_332,
  OriginalRow227TriangleData1787.coefficient157_333,
  OriginalRow227TriangleData1787.coefficient157_334,
  OriginalRow227TriangleData1787.coefficient157_335,
  OriginalRow227TriangleData1787.coefficient157_336,
  OriginalRow227TriangleData1787.coefficient157_337,
  OriginalRow227TriangleData1787.coefficient157_338,
  OriginalRow227TriangleData1787.coefficient157_339,
  OriginalRow227TriangleData1787.coefficient157_340,
  OriginalRow227TriangleData1787.coefficient157_341,
  OriginalRow227TriangleData1787.coefficient157_342,
  OriginalRow227TriangleData1787.coefficient157_343,
  OriginalRow227TriangleData1787.coefficient157_344
]

theorem values1787_size : values1787.size = 29 := rfl

def block1787 : ℕ → Option IntervalDyadic := segment 316 values1787

theorem block1787_domain : ExactDomain block1787 316 345 := by
  simpa only [values1787_size] using segment_domain 316 values1787

theorem block1787_get (i : Fin 29) :
    block1787 (316 + i.val) = some (values1787[i.val]'(by rw [values1787_size]; exact i.isLt)) := by
  exact segment_get 316 values1787 ⟨i.val, by rw [values1787_size]; exact i.isLt⟩

def node0188_0252 : ℕ → Option IntervalDyadic := split 220 block1783 block1784

theorem node0188_0252_domain : ExactDomain node0188_0252 188 252 := by
  exact split_domain (by decide) (by decide) block1783_domain block1784_domain

def node0156_0252 : ℕ → Option IntervalDyadic := split 188 block1782 node0188_0252

theorem node0156_0252_domain : ExactDomain node0156_0252 156 252 := by
  exact split_domain (by decide) (by decide) block1782_domain node0188_0252_domain

def node0284_0345 : ℕ → Option IntervalDyadic := split 316 block1786 block1787

theorem node0284_0345_domain : ExactDomain node0284_0345 284 345 := by
  exact split_domain (by decide) (by decide) block1786_domain block1787_domain

def node0252_0345 : ℕ → Option IntervalDyadic := split 284 block1785 node0284_0345

theorem node0252_0345_domain : ExactDomain node0252_0345 252 345 := by
  exact split_domain (by decide) (by decide) block1785_domain node0284_0345_domain

def node0156_0345 : ℕ → Option IntervalDyadic := split 252 node0156_0252 node0252_0345

theorem node0156_0345_domain : ExactDomain node0156_0345 156 345 := by
  exact split_domain (by decide) (by decide) node0156_0252_domain node0252_0345_domain

def lookup : ℕ → Option IntervalDyadic := node0156_0345

theorem lookup_domain : ExactDomain lookup 156 345 :=
  node0156_0345_domain

theorem block1782_lookup (i : Fin 32) :
    lookup (156 + i.val) = some (values1782[i.val]'(by rw [values1782_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0156_0345 (156 + i.val) = _
  rw [node0156_0345, split_left 252 node0156_0252 node0252_0345 (by omega)]
  rw [node0156_0252, split_left 188 block1782 node0188_0252 (by omega)]
  exact block1782_get i

theorem block1783_lookup (i : Fin 32) :
    lookup (188 + i.val) = some (values1783[i.val]'(by rw [values1783_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0156_0345 (188 + i.val) = _
  rw [node0156_0345, split_left 252 node0156_0252 node0252_0345 (by omega)]
  rw [node0156_0252, split_right 188 block1782 node0188_0252 (by omega)]
  rw [node0188_0252, split_left 220 block1783 block1784 (by omega)]
  exact block1783_get i

theorem block1784_lookup (i : Fin 32) :
    lookup (220 + i.val) = some (values1784[i.val]'(by rw [values1784_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0156_0345 (220 + i.val) = _
  rw [node0156_0345, split_left 252 node0156_0252 node0252_0345 (by omega)]
  rw [node0156_0252, split_right 188 block1782 node0188_0252 (by omega)]
  rw [node0188_0252, split_right 220 block1783 block1784 (by omega)]
  exact block1784_get i

theorem block1785_lookup (i : Fin 32) :
    lookup (252 + i.val) = some (values1785[i.val]'(by rw [values1785_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0156_0345 (252 + i.val) = _
  rw [node0156_0345, split_right 252 node0156_0252 node0252_0345 (by omega)]
  rw [node0252_0345, split_left 284 block1785 node0284_0345 (by omega)]
  exact block1785_get i

theorem block1786_lookup (i : Fin 32) :
    lookup (284 + i.val) = some (values1786[i.val]'(by rw [values1786_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0156_0345 (284 + i.val) = _
  rw [node0156_0345, split_right 252 node0156_0252 node0252_0345 (by omega)]
  rw [node0252_0345, split_right 284 block1785 node0284_0345 (by omega)]
  rw [node0284_0345, split_left 316 block1786 block1787 (by omega)]
  exact block1786_get i

theorem block1787_lookup (i : Fin 29) :
    lookup (316 + i.val) = some (values1787[i.val]'(by rw [values1787_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0156_0345 (316 + i.val) = _
  rw [node0156_0345, split_right 252 node0156_0252 node0252_0345 (by omega)]
  rw [node0252_0345, split_right 284 block1785 node0284_0345 (by omega)]
  rw [node0284_0345, split_right 316 block1786 block1787 (by omega)]
  exact block1787_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1782_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1782_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1783_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1783_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1784_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1784_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1785_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1785_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1786_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1786_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1787_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1787_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1782_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1783_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1784_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1785_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1786_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow157.block1787_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow157
