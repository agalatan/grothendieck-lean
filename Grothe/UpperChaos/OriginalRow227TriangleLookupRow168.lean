import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1848
import Grothe.UpperChaos.OriginalRow227TriangleData1849
import Grothe.UpperChaos.OriginalRow227TriangleData1850
import Grothe.UpperChaos.OriginalRow227TriangleData1851
import Grothe.UpperChaos.OriginalRow227TriangleData1852
import Grothe.UpperChaos.OriginalRow227TriangleData1853

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow168

open ConditionalTableLookup

def values1848 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1848.coefficient168_167,
  OriginalRow227TriangleData1848.coefficient168_168,
  OriginalRow227TriangleData1848.coefficient168_169,
  OriginalRow227TriangleData1848.coefficient168_170,
  OriginalRow227TriangleData1848.coefficient168_171,
  OriginalRow227TriangleData1848.coefficient168_172,
  OriginalRow227TriangleData1848.coefficient168_173,
  OriginalRow227TriangleData1848.coefficient168_174,
  OriginalRow227TriangleData1848.coefficient168_175,
  OriginalRow227TriangleData1848.coefficient168_176,
  OriginalRow227TriangleData1848.coefficient168_177,
  OriginalRow227TriangleData1848.coefficient168_178,
  OriginalRow227TriangleData1848.coefficient168_179,
  OriginalRow227TriangleData1848.coefficient168_180,
  OriginalRow227TriangleData1848.coefficient168_181,
  OriginalRow227TriangleData1848.coefficient168_182,
  OriginalRow227TriangleData1848.coefficient168_183,
  OriginalRow227TriangleData1848.coefficient168_184,
  OriginalRow227TriangleData1848.coefficient168_185,
  OriginalRow227TriangleData1848.coefficient168_186,
  OriginalRow227TriangleData1848.coefficient168_187,
  OriginalRow227TriangleData1848.coefficient168_188,
  OriginalRow227TriangleData1848.coefficient168_189,
  OriginalRow227TriangleData1848.coefficient168_190,
  OriginalRow227TriangleData1848.coefficient168_191,
  OriginalRow227TriangleData1848.coefficient168_192,
  OriginalRow227TriangleData1848.coefficient168_193,
  OriginalRow227TriangleData1848.coefficient168_194,
  OriginalRow227TriangleData1848.coefficient168_195,
  OriginalRow227TriangleData1848.coefficient168_196,
  OriginalRow227TriangleData1848.coefficient168_197,
  OriginalRow227TriangleData1848.coefficient168_198
]

theorem values1848_size : values1848.size = 32 := rfl

def block1848 : ℕ → Option IntervalDyadic := segment 167 values1848

theorem block1848_domain : ExactDomain block1848 167 199 := by
  simpa only [values1848_size] using segment_domain 167 values1848

theorem block1848_get (i : Fin 32) :
    block1848 (167 + i.val) = some (values1848[i.val]'(by rw [values1848_size]; exact i.isLt)) := by
  exact segment_get 167 values1848 ⟨i.val, by rw [values1848_size]; exact i.isLt⟩

def values1849 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1849.coefficient168_199,
  OriginalRow227TriangleData1849.coefficient168_200,
  OriginalRow227TriangleData1849.coefficient168_201,
  OriginalRow227TriangleData1849.coefficient168_202,
  OriginalRow227TriangleData1849.coefficient168_203,
  OriginalRow227TriangleData1849.coefficient168_204,
  OriginalRow227TriangleData1849.coefficient168_205,
  OriginalRow227TriangleData1849.coefficient168_206,
  OriginalRow227TriangleData1849.coefficient168_207,
  OriginalRow227TriangleData1849.coefficient168_208,
  OriginalRow227TriangleData1849.coefficient168_209,
  OriginalRow227TriangleData1849.coefficient168_210,
  OriginalRow227TriangleData1849.coefficient168_211,
  OriginalRow227TriangleData1849.coefficient168_212,
  OriginalRow227TriangleData1849.coefficient168_213,
  OriginalRow227TriangleData1849.coefficient168_214,
  OriginalRow227TriangleData1849.coefficient168_215,
  OriginalRow227TriangleData1849.coefficient168_216,
  OriginalRow227TriangleData1849.coefficient168_217,
  OriginalRow227TriangleData1849.coefficient168_218,
  OriginalRow227TriangleData1849.coefficient168_219,
  OriginalRow227TriangleData1849.coefficient168_220,
  OriginalRow227TriangleData1849.coefficient168_221,
  OriginalRow227TriangleData1849.coefficient168_222,
  OriginalRow227TriangleData1849.coefficient168_223,
  OriginalRow227TriangleData1849.coefficient168_224,
  OriginalRow227TriangleData1849.coefficient168_225,
  OriginalRow227TriangleData1849.coefficient168_226,
  OriginalRow227TriangleData1849.coefficient168_227,
  OriginalRow227TriangleData1849.coefficient168_228,
  OriginalRow227TriangleData1849.coefficient168_229,
  OriginalRow227TriangleData1849.coefficient168_230
]

theorem values1849_size : values1849.size = 32 := rfl

def block1849 : ℕ → Option IntervalDyadic := segment 199 values1849

theorem block1849_domain : ExactDomain block1849 199 231 := by
  simpa only [values1849_size] using segment_domain 199 values1849

theorem block1849_get (i : Fin 32) :
    block1849 (199 + i.val) = some (values1849[i.val]'(by rw [values1849_size]; exact i.isLt)) := by
  exact segment_get 199 values1849 ⟨i.val, by rw [values1849_size]; exact i.isLt⟩

def values1850 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1850.coefficient168_231,
  OriginalRow227TriangleData1850.coefficient168_232,
  OriginalRow227TriangleData1850.coefficient168_233,
  OriginalRow227TriangleData1850.coefficient168_234,
  OriginalRow227TriangleData1850.coefficient168_235,
  OriginalRow227TriangleData1850.coefficient168_236,
  OriginalRow227TriangleData1850.coefficient168_237,
  OriginalRow227TriangleData1850.coefficient168_238,
  OriginalRow227TriangleData1850.coefficient168_239,
  OriginalRow227TriangleData1850.coefficient168_240,
  OriginalRow227TriangleData1850.coefficient168_241,
  OriginalRow227TriangleData1850.coefficient168_242,
  OriginalRow227TriangleData1850.coefficient168_243,
  OriginalRow227TriangleData1850.coefficient168_244,
  OriginalRow227TriangleData1850.coefficient168_245,
  OriginalRow227TriangleData1850.coefficient168_246,
  OriginalRow227TriangleData1850.coefficient168_247,
  OriginalRow227TriangleData1850.coefficient168_248,
  OriginalRow227TriangleData1850.coefficient168_249,
  OriginalRow227TriangleData1850.coefficient168_250,
  OriginalRow227TriangleData1850.coefficient168_251,
  OriginalRow227TriangleData1850.coefficient168_252,
  OriginalRow227TriangleData1850.coefficient168_253,
  OriginalRow227TriangleData1850.coefficient168_254,
  OriginalRow227TriangleData1850.coefficient168_255,
  OriginalRow227TriangleData1850.coefficient168_256,
  OriginalRow227TriangleData1850.coefficient168_257,
  OriginalRow227TriangleData1850.coefficient168_258,
  OriginalRow227TriangleData1850.coefficient168_259,
  OriginalRow227TriangleData1850.coefficient168_260,
  OriginalRow227TriangleData1850.coefficient168_261,
  OriginalRow227TriangleData1850.coefficient168_262
]

theorem values1850_size : values1850.size = 32 := rfl

def block1850 : ℕ → Option IntervalDyadic := segment 231 values1850

theorem block1850_domain : ExactDomain block1850 231 263 := by
  simpa only [values1850_size] using segment_domain 231 values1850

theorem block1850_get (i : Fin 32) :
    block1850 (231 + i.val) = some (values1850[i.val]'(by rw [values1850_size]; exact i.isLt)) := by
  exact segment_get 231 values1850 ⟨i.val, by rw [values1850_size]; exact i.isLt⟩

def values1851 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1851.coefficient168_263,
  OriginalRow227TriangleData1851.coefficient168_264,
  OriginalRow227TriangleData1851.coefficient168_265,
  OriginalRow227TriangleData1851.coefficient168_266,
  OriginalRow227TriangleData1851.coefficient168_267,
  OriginalRow227TriangleData1851.coefficient168_268,
  OriginalRow227TriangleData1851.coefficient168_269,
  OriginalRow227TriangleData1851.coefficient168_270,
  OriginalRow227TriangleData1851.coefficient168_271,
  OriginalRow227TriangleData1851.coefficient168_272,
  OriginalRow227TriangleData1851.coefficient168_273,
  OriginalRow227TriangleData1851.coefficient168_274,
  OriginalRow227TriangleData1851.coefficient168_275,
  OriginalRow227TriangleData1851.coefficient168_276,
  OriginalRow227TriangleData1851.coefficient168_277,
  OriginalRow227TriangleData1851.coefficient168_278,
  OriginalRow227TriangleData1851.coefficient168_279,
  OriginalRow227TriangleData1851.coefficient168_280,
  OriginalRow227TriangleData1851.coefficient168_281,
  OriginalRow227TriangleData1851.coefficient168_282,
  OriginalRow227TriangleData1851.coefficient168_283,
  OriginalRow227TriangleData1851.coefficient168_284,
  OriginalRow227TriangleData1851.coefficient168_285,
  OriginalRow227TriangleData1851.coefficient168_286,
  OriginalRow227TriangleData1851.coefficient168_287,
  OriginalRow227TriangleData1851.coefficient168_288,
  OriginalRow227TriangleData1851.coefficient168_289,
  OriginalRow227TriangleData1851.coefficient168_290,
  OriginalRow227TriangleData1851.coefficient168_291,
  OriginalRow227TriangleData1851.coefficient168_292,
  OriginalRow227TriangleData1851.coefficient168_293,
  OriginalRow227TriangleData1851.coefficient168_294
]

theorem values1851_size : values1851.size = 32 := rfl

def block1851 : ℕ → Option IntervalDyadic := segment 263 values1851

theorem block1851_domain : ExactDomain block1851 263 295 := by
  simpa only [values1851_size] using segment_domain 263 values1851

theorem block1851_get (i : Fin 32) :
    block1851 (263 + i.val) = some (values1851[i.val]'(by rw [values1851_size]; exact i.isLt)) := by
  exact segment_get 263 values1851 ⟨i.val, by rw [values1851_size]; exact i.isLt⟩

def values1852 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1852.coefficient168_295,
  OriginalRow227TriangleData1852.coefficient168_296,
  OriginalRow227TriangleData1852.coefficient168_297,
  OriginalRow227TriangleData1852.coefficient168_298,
  OriginalRow227TriangleData1852.coefficient168_299,
  OriginalRow227TriangleData1852.coefficient168_300,
  OriginalRow227TriangleData1852.coefficient168_301,
  OriginalRow227TriangleData1852.coefficient168_302,
  OriginalRow227TriangleData1852.coefficient168_303,
  OriginalRow227TriangleData1852.coefficient168_304,
  OriginalRow227TriangleData1852.coefficient168_305,
  OriginalRow227TriangleData1852.coefficient168_306,
  OriginalRow227TriangleData1852.coefficient168_307,
  OriginalRow227TriangleData1852.coefficient168_308,
  OriginalRow227TriangleData1852.coefficient168_309,
  OriginalRow227TriangleData1852.coefficient168_310,
  OriginalRow227TriangleData1852.coefficient168_311,
  OriginalRow227TriangleData1852.coefficient168_312,
  OriginalRow227TriangleData1852.coefficient168_313,
  OriginalRow227TriangleData1852.coefficient168_314,
  OriginalRow227TriangleData1852.coefficient168_315,
  OriginalRow227TriangleData1852.coefficient168_316,
  OriginalRow227TriangleData1852.coefficient168_317,
  OriginalRow227TriangleData1852.coefficient168_318,
  OriginalRow227TriangleData1852.coefficient168_319,
  OriginalRow227TriangleData1852.coefficient168_320,
  OriginalRow227TriangleData1852.coefficient168_321,
  OriginalRow227TriangleData1852.coefficient168_322,
  OriginalRow227TriangleData1852.coefficient168_323,
  OriginalRow227TriangleData1852.coefficient168_324,
  OriginalRow227TriangleData1852.coefficient168_325,
  OriginalRow227TriangleData1852.coefficient168_326
]

theorem values1852_size : values1852.size = 32 := rfl

def block1852 : ℕ → Option IntervalDyadic := segment 295 values1852

theorem block1852_domain : ExactDomain block1852 295 327 := by
  simpa only [values1852_size] using segment_domain 295 values1852

theorem block1852_get (i : Fin 32) :
    block1852 (295 + i.val) = some (values1852[i.val]'(by rw [values1852_size]; exact i.isLt)) := by
  exact segment_get 295 values1852 ⟨i.val, by rw [values1852_size]; exact i.isLt⟩

def values1853 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1853.coefficient168_327,
  OriginalRow227TriangleData1853.coefficient168_328,
  OriginalRow227TriangleData1853.coefficient168_329,
  OriginalRow227TriangleData1853.coefficient168_330,
  OriginalRow227TriangleData1853.coefficient168_331,
  OriginalRow227TriangleData1853.coefficient168_332,
  OriginalRow227TriangleData1853.coefficient168_333
]

theorem values1853_size : values1853.size = 7 := rfl

def block1853 : ℕ → Option IntervalDyadic := segment 327 values1853

theorem block1853_domain : ExactDomain block1853 327 334 := by
  simpa only [values1853_size] using segment_domain 327 values1853

theorem block1853_get (i : Fin 7) :
    block1853 (327 + i.val) = some (values1853[i.val]'(by rw [values1853_size]; exact i.isLt)) := by
  exact segment_get 327 values1853 ⟨i.val, by rw [values1853_size]; exact i.isLt⟩

def node0199_0263 : ℕ → Option IntervalDyadic := split 231 block1849 block1850

theorem node0199_0263_domain : ExactDomain node0199_0263 199 263 := by
  exact split_domain (by decide) (by decide) block1849_domain block1850_domain

def node0167_0263 : ℕ → Option IntervalDyadic := split 199 block1848 node0199_0263

theorem node0167_0263_domain : ExactDomain node0167_0263 167 263 := by
  exact split_domain (by decide) (by decide) block1848_domain node0199_0263_domain

def node0295_0334 : ℕ → Option IntervalDyadic := split 327 block1852 block1853

theorem node0295_0334_domain : ExactDomain node0295_0334 295 334 := by
  exact split_domain (by decide) (by decide) block1852_domain block1853_domain

def node0263_0334 : ℕ → Option IntervalDyadic := split 295 block1851 node0295_0334

theorem node0263_0334_domain : ExactDomain node0263_0334 263 334 := by
  exact split_domain (by decide) (by decide) block1851_domain node0295_0334_domain

def node0167_0334 : ℕ → Option IntervalDyadic := split 263 node0167_0263 node0263_0334

theorem node0167_0334_domain : ExactDomain node0167_0334 167 334 := by
  exact split_domain (by decide) (by decide) node0167_0263_domain node0263_0334_domain

def lookup : ℕ → Option IntervalDyadic := node0167_0334

theorem lookup_domain : ExactDomain lookup 167 334 :=
  node0167_0334_domain

theorem block1848_lookup (i : Fin 32) :
    lookup (167 + i.val) = some (values1848[i.val]'(by rw [values1848_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0167_0334 (167 + i.val) = _
  rw [node0167_0334, split_left 263 node0167_0263 node0263_0334 (by omega)]
  rw [node0167_0263, split_left 199 block1848 node0199_0263 (by omega)]
  exact block1848_get i

theorem block1849_lookup (i : Fin 32) :
    lookup (199 + i.val) = some (values1849[i.val]'(by rw [values1849_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0167_0334 (199 + i.val) = _
  rw [node0167_0334, split_left 263 node0167_0263 node0263_0334 (by omega)]
  rw [node0167_0263, split_right 199 block1848 node0199_0263 (by omega)]
  rw [node0199_0263, split_left 231 block1849 block1850 (by omega)]
  exact block1849_get i

theorem block1850_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values1850[i.val]'(by rw [values1850_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0167_0334 (231 + i.val) = _
  rw [node0167_0334, split_left 263 node0167_0263 node0263_0334 (by omega)]
  rw [node0167_0263, split_right 199 block1848 node0199_0263 (by omega)]
  rw [node0199_0263, split_right 231 block1849 block1850 (by omega)]
  exact block1850_get i

theorem block1851_lookup (i : Fin 32) :
    lookup (263 + i.val) = some (values1851[i.val]'(by rw [values1851_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0167_0334 (263 + i.val) = _
  rw [node0167_0334, split_right 263 node0167_0263 node0263_0334 (by omega)]
  rw [node0263_0334, split_left 295 block1851 node0295_0334 (by omega)]
  exact block1851_get i

theorem block1852_lookup (i : Fin 32) :
    lookup (295 + i.val) = some (values1852[i.val]'(by rw [values1852_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0167_0334 (295 + i.val) = _
  rw [node0167_0334, split_right 263 node0167_0263 node0263_0334 (by omega)]
  rw [node0263_0334, split_right 295 block1851 node0295_0334 (by omega)]
  rw [node0295_0334, split_left 327 block1852 block1853 (by omega)]
  exact block1852_get i

theorem block1853_lookup (i : Fin 7) :
    lookup (327 + i.val) = some (values1853[i.val]'(by rw [values1853_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0167_0334 (327 + i.val) = _
  rw [node0167_0334, split_right 263 node0167_0263 node0263_0334 (by omega)]
  rw [node0263_0334, split_right 295 block1851 node0295_0334 (by omega)]
  rw [node0295_0334, split_right 327 block1852 block1853 (by omega)]
  exact block1853_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1848_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1848_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1849_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1849_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1850_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1850_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1851_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1851_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1852_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1852_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1853_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1853_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1848_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1849_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1850_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1851_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1852_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow168.block1853_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow168
