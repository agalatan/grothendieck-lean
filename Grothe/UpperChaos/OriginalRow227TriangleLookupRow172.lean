import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1872
import Grothe.UpperChaos.OriginalRow227TriangleData1873
import Grothe.UpperChaos.OriginalRow227TriangleData1874
import Grothe.UpperChaos.OriginalRow227TriangleData1875
import Grothe.UpperChaos.OriginalRow227TriangleData1876

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow172

open ConditionalTableLookup

def values1872 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1872.coefficient172_171,
  OriginalRow227TriangleData1872.coefficient172_172,
  OriginalRow227TriangleData1872.coefficient172_173,
  OriginalRow227TriangleData1872.coefficient172_174,
  OriginalRow227TriangleData1872.coefficient172_175,
  OriginalRow227TriangleData1872.coefficient172_176,
  OriginalRow227TriangleData1872.coefficient172_177,
  OriginalRow227TriangleData1872.coefficient172_178,
  OriginalRow227TriangleData1872.coefficient172_179,
  OriginalRow227TriangleData1872.coefficient172_180,
  OriginalRow227TriangleData1872.coefficient172_181,
  OriginalRow227TriangleData1872.coefficient172_182,
  OriginalRow227TriangleData1872.coefficient172_183,
  OriginalRow227TriangleData1872.coefficient172_184,
  OriginalRow227TriangleData1872.coefficient172_185,
  OriginalRow227TriangleData1872.coefficient172_186,
  OriginalRow227TriangleData1872.coefficient172_187,
  OriginalRow227TriangleData1872.coefficient172_188,
  OriginalRow227TriangleData1872.coefficient172_189,
  OriginalRow227TriangleData1872.coefficient172_190,
  OriginalRow227TriangleData1872.coefficient172_191,
  OriginalRow227TriangleData1872.coefficient172_192,
  OriginalRow227TriangleData1872.coefficient172_193,
  OriginalRow227TriangleData1872.coefficient172_194,
  OriginalRow227TriangleData1872.coefficient172_195,
  OriginalRow227TriangleData1872.coefficient172_196,
  OriginalRow227TriangleData1872.coefficient172_197,
  OriginalRow227TriangleData1872.coefficient172_198,
  OriginalRow227TriangleData1872.coefficient172_199,
  OriginalRow227TriangleData1872.coefficient172_200,
  OriginalRow227TriangleData1872.coefficient172_201,
  OriginalRow227TriangleData1872.coefficient172_202
]

theorem values1872_size : values1872.size = 32 := rfl

def block1872 : ℕ → Option IntervalDyadic := segment 171 values1872

theorem block1872_domain : ExactDomain block1872 171 203 := by
  simpa only [values1872_size] using segment_domain 171 values1872

theorem block1872_get (i : Fin 32) :
    block1872 (171 + i.val) = some (values1872[i.val]'(by rw [values1872_size]; exact i.isLt)) := by
  exact segment_get 171 values1872 ⟨i.val, by rw [values1872_size]; exact i.isLt⟩

def values1873 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1873.coefficient172_203,
  OriginalRow227TriangleData1873.coefficient172_204,
  OriginalRow227TriangleData1873.coefficient172_205,
  OriginalRow227TriangleData1873.coefficient172_206,
  OriginalRow227TriangleData1873.coefficient172_207,
  OriginalRow227TriangleData1873.coefficient172_208,
  OriginalRow227TriangleData1873.coefficient172_209,
  OriginalRow227TriangleData1873.coefficient172_210,
  OriginalRow227TriangleData1873.coefficient172_211,
  OriginalRow227TriangleData1873.coefficient172_212,
  OriginalRow227TriangleData1873.coefficient172_213,
  OriginalRow227TriangleData1873.coefficient172_214,
  OriginalRow227TriangleData1873.coefficient172_215,
  OriginalRow227TriangleData1873.coefficient172_216,
  OriginalRow227TriangleData1873.coefficient172_217,
  OriginalRow227TriangleData1873.coefficient172_218,
  OriginalRow227TriangleData1873.coefficient172_219,
  OriginalRow227TriangleData1873.coefficient172_220,
  OriginalRow227TriangleData1873.coefficient172_221,
  OriginalRow227TriangleData1873.coefficient172_222,
  OriginalRow227TriangleData1873.coefficient172_223,
  OriginalRow227TriangleData1873.coefficient172_224,
  OriginalRow227TriangleData1873.coefficient172_225,
  OriginalRow227TriangleData1873.coefficient172_226,
  OriginalRow227TriangleData1873.coefficient172_227,
  OriginalRow227TriangleData1873.coefficient172_228,
  OriginalRow227TriangleData1873.coefficient172_229,
  OriginalRow227TriangleData1873.coefficient172_230,
  OriginalRow227TriangleData1873.coefficient172_231,
  OriginalRow227TriangleData1873.coefficient172_232,
  OriginalRow227TriangleData1873.coefficient172_233,
  OriginalRow227TriangleData1873.coefficient172_234
]

theorem values1873_size : values1873.size = 32 := rfl

def block1873 : ℕ → Option IntervalDyadic := segment 203 values1873

theorem block1873_domain : ExactDomain block1873 203 235 := by
  simpa only [values1873_size] using segment_domain 203 values1873

theorem block1873_get (i : Fin 32) :
    block1873 (203 + i.val) = some (values1873[i.val]'(by rw [values1873_size]; exact i.isLt)) := by
  exact segment_get 203 values1873 ⟨i.val, by rw [values1873_size]; exact i.isLt⟩

def values1874 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1874.coefficient172_235,
  OriginalRow227TriangleData1874.coefficient172_236,
  OriginalRow227TriangleData1874.coefficient172_237,
  OriginalRow227TriangleData1874.coefficient172_238,
  OriginalRow227TriangleData1874.coefficient172_239,
  OriginalRow227TriangleData1874.coefficient172_240,
  OriginalRow227TriangleData1874.coefficient172_241,
  OriginalRow227TriangleData1874.coefficient172_242,
  OriginalRow227TriangleData1874.coefficient172_243,
  OriginalRow227TriangleData1874.coefficient172_244,
  OriginalRow227TriangleData1874.coefficient172_245,
  OriginalRow227TriangleData1874.coefficient172_246,
  OriginalRow227TriangleData1874.coefficient172_247,
  OriginalRow227TriangleData1874.coefficient172_248,
  OriginalRow227TriangleData1874.coefficient172_249,
  OriginalRow227TriangleData1874.coefficient172_250,
  OriginalRow227TriangleData1874.coefficient172_251,
  OriginalRow227TriangleData1874.coefficient172_252,
  OriginalRow227TriangleData1874.coefficient172_253,
  OriginalRow227TriangleData1874.coefficient172_254,
  OriginalRow227TriangleData1874.coefficient172_255,
  OriginalRow227TriangleData1874.coefficient172_256,
  OriginalRow227TriangleData1874.coefficient172_257,
  OriginalRow227TriangleData1874.coefficient172_258,
  OriginalRow227TriangleData1874.coefficient172_259,
  OriginalRow227TriangleData1874.coefficient172_260,
  OriginalRow227TriangleData1874.coefficient172_261,
  OriginalRow227TriangleData1874.coefficient172_262,
  OriginalRow227TriangleData1874.coefficient172_263,
  OriginalRow227TriangleData1874.coefficient172_264,
  OriginalRow227TriangleData1874.coefficient172_265,
  OriginalRow227TriangleData1874.coefficient172_266
]

theorem values1874_size : values1874.size = 32 := rfl

def block1874 : ℕ → Option IntervalDyadic := segment 235 values1874

theorem block1874_domain : ExactDomain block1874 235 267 := by
  simpa only [values1874_size] using segment_domain 235 values1874

theorem block1874_get (i : Fin 32) :
    block1874 (235 + i.val) = some (values1874[i.val]'(by rw [values1874_size]; exact i.isLt)) := by
  exact segment_get 235 values1874 ⟨i.val, by rw [values1874_size]; exact i.isLt⟩

def values1875 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1875.coefficient172_267,
  OriginalRow227TriangleData1875.coefficient172_268,
  OriginalRow227TriangleData1875.coefficient172_269,
  OriginalRow227TriangleData1875.coefficient172_270,
  OriginalRow227TriangleData1875.coefficient172_271,
  OriginalRow227TriangleData1875.coefficient172_272,
  OriginalRow227TriangleData1875.coefficient172_273,
  OriginalRow227TriangleData1875.coefficient172_274,
  OriginalRow227TriangleData1875.coefficient172_275,
  OriginalRow227TriangleData1875.coefficient172_276,
  OriginalRow227TriangleData1875.coefficient172_277,
  OriginalRow227TriangleData1875.coefficient172_278,
  OriginalRow227TriangleData1875.coefficient172_279,
  OriginalRow227TriangleData1875.coefficient172_280,
  OriginalRow227TriangleData1875.coefficient172_281,
  OriginalRow227TriangleData1875.coefficient172_282,
  OriginalRow227TriangleData1875.coefficient172_283,
  OriginalRow227TriangleData1875.coefficient172_284,
  OriginalRow227TriangleData1875.coefficient172_285,
  OriginalRow227TriangleData1875.coefficient172_286,
  OriginalRow227TriangleData1875.coefficient172_287,
  OriginalRow227TriangleData1875.coefficient172_288,
  OriginalRow227TriangleData1875.coefficient172_289,
  OriginalRow227TriangleData1875.coefficient172_290,
  OriginalRow227TriangleData1875.coefficient172_291,
  OriginalRow227TriangleData1875.coefficient172_292,
  OriginalRow227TriangleData1875.coefficient172_293,
  OriginalRow227TriangleData1875.coefficient172_294,
  OriginalRow227TriangleData1875.coefficient172_295,
  OriginalRow227TriangleData1875.coefficient172_296,
  OriginalRow227TriangleData1875.coefficient172_297,
  OriginalRow227TriangleData1875.coefficient172_298
]

theorem values1875_size : values1875.size = 32 := rfl

def block1875 : ℕ → Option IntervalDyadic := segment 267 values1875

theorem block1875_domain : ExactDomain block1875 267 299 := by
  simpa only [values1875_size] using segment_domain 267 values1875

theorem block1875_get (i : Fin 32) :
    block1875 (267 + i.val) = some (values1875[i.val]'(by rw [values1875_size]; exact i.isLt)) := by
  exact segment_get 267 values1875 ⟨i.val, by rw [values1875_size]; exact i.isLt⟩

def values1876 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1876.coefficient172_299,
  OriginalRow227TriangleData1876.coefficient172_300,
  OriginalRow227TriangleData1876.coefficient172_301,
  OriginalRow227TriangleData1876.coefficient172_302,
  OriginalRow227TriangleData1876.coefficient172_303,
  OriginalRow227TriangleData1876.coefficient172_304,
  OriginalRow227TriangleData1876.coefficient172_305,
  OriginalRow227TriangleData1876.coefficient172_306,
  OriginalRow227TriangleData1876.coefficient172_307,
  OriginalRow227TriangleData1876.coefficient172_308,
  OriginalRow227TriangleData1876.coefficient172_309,
  OriginalRow227TriangleData1876.coefficient172_310,
  OriginalRow227TriangleData1876.coefficient172_311,
  OriginalRow227TriangleData1876.coefficient172_312,
  OriginalRow227TriangleData1876.coefficient172_313,
  OriginalRow227TriangleData1876.coefficient172_314,
  OriginalRow227TriangleData1876.coefficient172_315,
  OriginalRow227TriangleData1876.coefficient172_316,
  OriginalRow227TriangleData1876.coefficient172_317,
  OriginalRow227TriangleData1876.coefficient172_318,
  OriginalRow227TriangleData1876.coefficient172_319,
  OriginalRow227TriangleData1876.coefficient172_320,
  OriginalRow227TriangleData1876.coefficient172_321,
  OriginalRow227TriangleData1876.coefficient172_322,
  OriginalRow227TriangleData1876.coefficient172_323,
  OriginalRow227TriangleData1876.coefficient172_324,
  OriginalRow227TriangleData1876.coefficient172_325,
  OriginalRow227TriangleData1876.coefficient172_326,
  OriginalRow227TriangleData1876.coefficient172_327,
  OriginalRow227TriangleData1876.coefficient172_328,
  OriginalRow227TriangleData1876.coefficient172_329
]

theorem values1876_size : values1876.size = 31 := rfl

def block1876 : ℕ → Option IntervalDyadic := segment 299 values1876

theorem block1876_domain : ExactDomain block1876 299 330 := by
  simpa only [values1876_size] using segment_domain 299 values1876

theorem block1876_get (i : Fin 31) :
    block1876 (299 + i.val) = some (values1876[i.val]'(by rw [values1876_size]; exact i.isLt)) := by
  exact segment_get 299 values1876 ⟨i.val, by rw [values1876_size]; exact i.isLt⟩

def node0171_0235 : ℕ → Option IntervalDyadic := split 203 block1872 block1873

theorem node0171_0235_domain : ExactDomain node0171_0235 171 235 := by
  exact split_domain (by decide) (by decide) block1872_domain block1873_domain

def node0267_0330 : ℕ → Option IntervalDyadic := split 299 block1875 block1876

theorem node0267_0330_domain : ExactDomain node0267_0330 267 330 := by
  exact split_domain (by decide) (by decide) block1875_domain block1876_domain

def node0235_0330 : ℕ → Option IntervalDyadic := split 267 block1874 node0267_0330

theorem node0235_0330_domain : ExactDomain node0235_0330 235 330 := by
  exact split_domain (by decide) (by decide) block1874_domain node0267_0330_domain

def node0171_0330 : ℕ → Option IntervalDyadic := split 235 node0171_0235 node0235_0330

theorem node0171_0330_domain : ExactDomain node0171_0330 171 330 := by
  exact split_domain (by decide) (by decide) node0171_0235_domain node0235_0330_domain

def lookup : ℕ → Option IntervalDyadic := node0171_0330

theorem lookup_domain : ExactDomain lookup 171 330 :=
  node0171_0330_domain

theorem block1872_lookup (i : Fin 32) :
    lookup (171 + i.val) = some (values1872[i.val]'(by rw [values1872_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0171_0330 (171 + i.val) = _
  rw [node0171_0330, split_left 235 node0171_0235 node0235_0330 (by omega)]
  rw [node0171_0235, split_left 203 block1872 block1873 (by omega)]
  exact block1872_get i

theorem block1873_lookup (i : Fin 32) :
    lookup (203 + i.val) = some (values1873[i.val]'(by rw [values1873_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0171_0330 (203 + i.val) = _
  rw [node0171_0330, split_left 235 node0171_0235 node0235_0330 (by omega)]
  rw [node0171_0235, split_right 203 block1872 block1873 (by omega)]
  exact block1873_get i

theorem block1874_lookup (i : Fin 32) :
    lookup (235 + i.val) = some (values1874[i.val]'(by rw [values1874_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0171_0330 (235 + i.val) = _
  rw [node0171_0330, split_right 235 node0171_0235 node0235_0330 (by omega)]
  rw [node0235_0330, split_left 267 block1874 node0267_0330 (by omega)]
  exact block1874_get i

theorem block1875_lookup (i : Fin 32) :
    lookup (267 + i.val) = some (values1875[i.val]'(by rw [values1875_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0171_0330 (267 + i.val) = _
  rw [node0171_0330, split_right 235 node0171_0235 node0235_0330 (by omega)]
  rw [node0235_0330, split_right 267 block1874 node0267_0330 (by omega)]
  rw [node0267_0330, split_left 299 block1875 block1876 (by omega)]
  exact block1875_get i

theorem block1876_lookup (i : Fin 31) :
    lookup (299 + i.val) = some (values1876[i.val]'(by rw [values1876_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0171_0330 (299 + i.val) = _
  rw [node0171_0330, split_right 235 node0171_0235 node0235_0330 (by omega)]
  rw [node0235_0330, split_right 267 block1874 node0267_0330 (by omega)]
  rw [node0267_0330, split_right 299 block1875 block1876 (by omega)]
  exact block1876_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1872_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1872_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1873_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1873_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1874_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1874_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1875_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1875_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1876_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1876_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1872_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1873_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1874_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1875_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow172.block1876_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow172
