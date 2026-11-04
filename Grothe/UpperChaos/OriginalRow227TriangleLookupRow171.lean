import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1866
import Grothe.UpperChaos.OriginalRow227TriangleData1867
import Grothe.UpperChaos.OriginalRow227TriangleData1868
import Grothe.UpperChaos.OriginalRow227TriangleData1869
import Grothe.UpperChaos.OriginalRow227TriangleData1870
import Grothe.UpperChaos.OriginalRow227TriangleData1871

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow171

open ConditionalTableLookup

def values1866 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1866.coefficient171_170,
  OriginalRow227TriangleData1866.coefficient171_171,
  OriginalRow227TriangleData1866.coefficient171_172,
  OriginalRow227TriangleData1866.coefficient171_173,
  OriginalRow227TriangleData1866.coefficient171_174,
  OriginalRow227TriangleData1866.coefficient171_175,
  OriginalRow227TriangleData1866.coefficient171_176,
  OriginalRow227TriangleData1866.coefficient171_177,
  OriginalRow227TriangleData1866.coefficient171_178,
  OriginalRow227TriangleData1866.coefficient171_179,
  OriginalRow227TriangleData1866.coefficient171_180,
  OriginalRow227TriangleData1866.coefficient171_181,
  OriginalRow227TriangleData1866.coefficient171_182,
  OriginalRow227TriangleData1866.coefficient171_183,
  OriginalRow227TriangleData1866.coefficient171_184,
  OriginalRow227TriangleData1866.coefficient171_185,
  OriginalRow227TriangleData1866.coefficient171_186,
  OriginalRow227TriangleData1866.coefficient171_187,
  OriginalRow227TriangleData1866.coefficient171_188,
  OriginalRow227TriangleData1866.coefficient171_189,
  OriginalRow227TriangleData1866.coefficient171_190,
  OriginalRow227TriangleData1866.coefficient171_191,
  OriginalRow227TriangleData1866.coefficient171_192,
  OriginalRow227TriangleData1866.coefficient171_193,
  OriginalRow227TriangleData1866.coefficient171_194,
  OriginalRow227TriangleData1866.coefficient171_195,
  OriginalRow227TriangleData1866.coefficient171_196,
  OriginalRow227TriangleData1866.coefficient171_197,
  OriginalRow227TriangleData1866.coefficient171_198,
  OriginalRow227TriangleData1866.coefficient171_199,
  OriginalRow227TriangleData1866.coefficient171_200,
  OriginalRow227TriangleData1866.coefficient171_201
]

theorem values1866_size : values1866.size = 32 := rfl

def block1866 : ℕ → Option IntervalDyadic := segment 170 values1866

theorem block1866_domain : ExactDomain block1866 170 202 := by
  simpa only [values1866_size] using segment_domain 170 values1866

theorem block1866_get (i : Fin 32) :
    block1866 (170 + i.val) = some (values1866[i.val]'(by rw [values1866_size]; exact i.isLt)) := by
  exact segment_get 170 values1866 ⟨i.val, by rw [values1866_size]; exact i.isLt⟩

def values1867 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1867.coefficient171_202,
  OriginalRow227TriangleData1867.coefficient171_203,
  OriginalRow227TriangleData1867.coefficient171_204,
  OriginalRow227TriangleData1867.coefficient171_205,
  OriginalRow227TriangleData1867.coefficient171_206,
  OriginalRow227TriangleData1867.coefficient171_207,
  OriginalRow227TriangleData1867.coefficient171_208,
  OriginalRow227TriangleData1867.coefficient171_209,
  OriginalRow227TriangleData1867.coefficient171_210,
  OriginalRow227TriangleData1867.coefficient171_211,
  OriginalRow227TriangleData1867.coefficient171_212,
  OriginalRow227TriangleData1867.coefficient171_213,
  OriginalRow227TriangleData1867.coefficient171_214,
  OriginalRow227TriangleData1867.coefficient171_215,
  OriginalRow227TriangleData1867.coefficient171_216,
  OriginalRow227TriangleData1867.coefficient171_217,
  OriginalRow227TriangleData1867.coefficient171_218,
  OriginalRow227TriangleData1867.coefficient171_219,
  OriginalRow227TriangleData1867.coefficient171_220,
  OriginalRow227TriangleData1867.coefficient171_221,
  OriginalRow227TriangleData1867.coefficient171_222,
  OriginalRow227TriangleData1867.coefficient171_223,
  OriginalRow227TriangleData1867.coefficient171_224,
  OriginalRow227TriangleData1867.coefficient171_225,
  OriginalRow227TriangleData1867.coefficient171_226,
  OriginalRow227TriangleData1867.coefficient171_227,
  OriginalRow227TriangleData1867.coefficient171_228,
  OriginalRow227TriangleData1867.coefficient171_229,
  OriginalRow227TriangleData1867.coefficient171_230,
  OriginalRow227TriangleData1867.coefficient171_231,
  OriginalRow227TriangleData1867.coefficient171_232,
  OriginalRow227TriangleData1867.coefficient171_233
]

theorem values1867_size : values1867.size = 32 := rfl

def block1867 : ℕ → Option IntervalDyadic := segment 202 values1867

theorem block1867_domain : ExactDomain block1867 202 234 := by
  simpa only [values1867_size] using segment_domain 202 values1867

theorem block1867_get (i : Fin 32) :
    block1867 (202 + i.val) = some (values1867[i.val]'(by rw [values1867_size]; exact i.isLt)) := by
  exact segment_get 202 values1867 ⟨i.val, by rw [values1867_size]; exact i.isLt⟩

def values1868 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1868.coefficient171_234,
  OriginalRow227TriangleData1868.coefficient171_235,
  OriginalRow227TriangleData1868.coefficient171_236,
  OriginalRow227TriangleData1868.coefficient171_237,
  OriginalRow227TriangleData1868.coefficient171_238,
  OriginalRow227TriangleData1868.coefficient171_239,
  OriginalRow227TriangleData1868.coefficient171_240,
  OriginalRow227TriangleData1868.coefficient171_241,
  OriginalRow227TriangleData1868.coefficient171_242,
  OriginalRow227TriangleData1868.coefficient171_243,
  OriginalRow227TriangleData1868.coefficient171_244,
  OriginalRow227TriangleData1868.coefficient171_245,
  OriginalRow227TriangleData1868.coefficient171_246,
  OriginalRow227TriangleData1868.coefficient171_247,
  OriginalRow227TriangleData1868.coefficient171_248,
  OriginalRow227TriangleData1868.coefficient171_249,
  OriginalRow227TriangleData1868.coefficient171_250,
  OriginalRow227TriangleData1868.coefficient171_251,
  OriginalRow227TriangleData1868.coefficient171_252,
  OriginalRow227TriangleData1868.coefficient171_253,
  OriginalRow227TriangleData1868.coefficient171_254,
  OriginalRow227TriangleData1868.coefficient171_255,
  OriginalRow227TriangleData1868.coefficient171_256,
  OriginalRow227TriangleData1868.coefficient171_257,
  OriginalRow227TriangleData1868.coefficient171_258,
  OriginalRow227TriangleData1868.coefficient171_259,
  OriginalRow227TriangleData1868.coefficient171_260,
  OriginalRow227TriangleData1868.coefficient171_261,
  OriginalRow227TriangleData1868.coefficient171_262,
  OriginalRow227TriangleData1868.coefficient171_263,
  OriginalRow227TriangleData1868.coefficient171_264,
  OriginalRow227TriangleData1868.coefficient171_265
]

theorem values1868_size : values1868.size = 32 := rfl

def block1868 : ℕ → Option IntervalDyadic := segment 234 values1868

theorem block1868_domain : ExactDomain block1868 234 266 := by
  simpa only [values1868_size] using segment_domain 234 values1868

theorem block1868_get (i : Fin 32) :
    block1868 (234 + i.val) = some (values1868[i.val]'(by rw [values1868_size]; exact i.isLt)) := by
  exact segment_get 234 values1868 ⟨i.val, by rw [values1868_size]; exact i.isLt⟩

def values1869 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1869.coefficient171_266,
  OriginalRow227TriangleData1869.coefficient171_267,
  OriginalRow227TriangleData1869.coefficient171_268,
  OriginalRow227TriangleData1869.coefficient171_269,
  OriginalRow227TriangleData1869.coefficient171_270,
  OriginalRow227TriangleData1869.coefficient171_271,
  OriginalRow227TriangleData1869.coefficient171_272,
  OriginalRow227TriangleData1869.coefficient171_273,
  OriginalRow227TriangleData1869.coefficient171_274,
  OriginalRow227TriangleData1869.coefficient171_275,
  OriginalRow227TriangleData1869.coefficient171_276,
  OriginalRow227TriangleData1869.coefficient171_277,
  OriginalRow227TriangleData1869.coefficient171_278,
  OriginalRow227TriangleData1869.coefficient171_279,
  OriginalRow227TriangleData1869.coefficient171_280,
  OriginalRow227TriangleData1869.coefficient171_281,
  OriginalRow227TriangleData1869.coefficient171_282,
  OriginalRow227TriangleData1869.coefficient171_283,
  OriginalRow227TriangleData1869.coefficient171_284,
  OriginalRow227TriangleData1869.coefficient171_285,
  OriginalRow227TriangleData1869.coefficient171_286,
  OriginalRow227TriangleData1869.coefficient171_287,
  OriginalRow227TriangleData1869.coefficient171_288,
  OriginalRow227TriangleData1869.coefficient171_289,
  OriginalRow227TriangleData1869.coefficient171_290,
  OriginalRow227TriangleData1869.coefficient171_291,
  OriginalRow227TriangleData1869.coefficient171_292,
  OriginalRow227TriangleData1869.coefficient171_293,
  OriginalRow227TriangleData1869.coefficient171_294,
  OriginalRow227TriangleData1869.coefficient171_295,
  OriginalRow227TriangleData1869.coefficient171_296,
  OriginalRow227TriangleData1869.coefficient171_297
]

theorem values1869_size : values1869.size = 32 := rfl

def block1869 : ℕ → Option IntervalDyadic := segment 266 values1869

theorem block1869_domain : ExactDomain block1869 266 298 := by
  simpa only [values1869_size] using segment_domain 266 values1869

theorem block1869_get (i : Fin 32) :
    block1869 (266 + i.val) = some (values1869[i.val]'(by rw [values1869_size]; exact i.isLt)) := by
  exact segment_get 266 values1869 ⟨i.val, by rw [values1869_size]; exact i.isLt⟩

def values1870 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1870.coefficient171_298,
  OriginalRow227TriangleData1870.coefficient171_299,
  OriginalRow227TriangleData1870.coefficient171_300,
  OriginalRow227TriangleData1870.coefficient171_301,
  OriginalRow227TriangleData1870.coefficient171_302,
  OriginalRow227TriangleData1870.coefficient171_303,
  OriginalRow227TriangleData1870.coefficient171_304,
  OriginalRow227TriangleData1870.coefficient171_305,
  OriginalRow227TriangleData1870.coefficient171_306,
  OriginalRow227TriangleData1870.coefficient171_307,
  OriginalRow227TriangleData1870.coefficient171_308,
  OriginalRow227TriangleData1870.coefficient171_309,
  OriginalRow227TriangleData1870.coefficient171_310,
  OriginalRow227TriangleData1870.coefficient171_311,
  OriginalRow227TriangleData1870.coefficient171_312,
  OriginalRow227TriangleData1870.coefficient171_313,
  OriginalRow227TriangleData1870.coefficient171_314,
  OriginalRow227TriangleData1870.coefficient171_315,
  OriginalRow227TriangleData1870.coefficient171_316,
  OriginalRow227TriangleData1870.coefficient171_317,
  OriginalRow227TriangleData1870.coefficient171_318,
  OriginalRow227TriangleData1870.coefficient171_319,
  OriginalRow227TriangleData1870.coefficient171_320,
  OriginalRow227TriangleData1870.coefficient171_321,
  OriginalRow227TriangleData1870.coefficient171_322,
  OriginalRow227TriangleData1870.coefficient171_323,
  OriginalRow227TriangleData1870.coefficient171_324,
  OriginalRow227TriangleData1870.coefficient171_325,
  OriginalRow227TriangleData1870.coefficient171_326,
  OriginalRow227TriangleData1870.coefficient171_327,
  OriginalRow227TriangleData1870.coefficient171_328,
  OriginalRow227TriangleData1870.coefficient171_329
]

theorem values1870_size : values1870.size = 32 := rfl

def block1870 : ℕ → Option IntervalDyadic := segment 298 values1870

theorem block1870_domain : ExactDomain block1870 298 330 := by
  simpa only [values1870_size] using segment_domain 298 values1870

theorem block1870_get (i : Fin 32) :
    block1870 (298 + i.val) = some (values1870[i.val]'(by rw [values1870_size]; exact i.isLt)) := by
  exact segment_get 298 values1870 ⟨i.val, by rw [values1870_size]; exact i.isLt⟩

def values1871 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1871.coefficient171_330
]

theorem values1871_size : values1871.size = 1 := rfl

def block1871 : ℕ → Option IntervalDyadic := segment 330 values1871

theorem block1871_domain : ExactDomain block1871 330 331 := by
  simpa only [values1871_size] using segment_domain 330 values1871

theorem block1871_get (i : Fin 1) :
    block1871 (330 + i.val) = some (values1871[i.val]'(by rw [values1871_size]; exact i.isLt)) := by
  exact segment_get 330 values1871 ⟨i.val, by rw [values1871_size]; exact i.isLt⟩

def node0202_0266 : ℕ → Option IntervalDyadic := split 234 block1867 block1868

theorem node0202_0266_domain : ExactDomain node0202_0266 202 266 := by
  exact split_domain (by decide) (by decide) block1867_domain block1868_domain

def node0170_0266 : ℕ → Option IntervalDyadic := split 202 block1866 node0202_0266

theorem node0170_0266_domain : ExactDomain node0170_0266 170 266 := by
  exact split_domain (by decide) (by decide) block1866_domain node0202_0266_domain

def node0298_0331 : ℕ → Option IntervalDyadic := split 330 block1870 block1871

theorem node0298_0331_domain : ExactDomain node0298_0331 298 331 := by
  exact split_domain (by decide) (by decide) block1870_domain block1871_domain

def node0266_0331 : ℕ → Option IntervalDyadic := split 298 block1869 node0298_0331

theorem node0266_0331_domain : ExactDomain node0266_0331 266 331 := by
  exact split_domain (by decide) (by decide) block1869_domain node0298_0331_domain

def node0170_0331 : ℕ → Option IntervalDyadic := split 266 node0170_0266 node0266_0331

theorem node0170_0331_domain : ExactDomain node0170_0331 170 331 := by
  exact split_domain (by decide) (by decide) node0170_0266_domain node0266_0331_domain

def lookup : ℕ → Option IntervalDyadic := node0170_0331

theorem lookup_domain : ExactDomain lookup 170 331 :=
  node0170_0331_domain

theorem block1866_lookup (i : Fin 32) :
    lookup (170 + i.val) = some (values1866[i.val]'(by rw [values1866_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0170_0331 (170 + i.val) = _
  rw [node0170_0331, split_left 266 node0170_0266 node0266_0331 (by omega)]
  rw [node0170_0266, split_left 202 block1866 node0202_0266 (by omega)]
  exact block1866_get i

theorem block1867_lookup (i : Fin 32) :
    lookup (202 + i.val) = some (values1867[i.val]'(by rw [values1867_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0170_0331 (202 + i.val) = _
  rw [node0170_0331, split_left 266 node0170_0266 node0266_0331 (by omega)]
  rw [node0170_0266, split_right 202 block1866 node0202_0266 (by omega)]
  rw [node0202_0266, split_left 234 block1867 block1868 (by omega)]
  exact block1867_get i

theorem block1868_lookup (i : Fin 32) :
    lookup (234 + i.val) = some (values1868[i.val]'(by rw [values1868_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0170_0331 (234 + i.val) = _
  rw [node0170_0331, split_left 266 node0170_0266 node0266_0331 (by omega)]
  rw [node0170_0266, split_right 202 block1866 node0202_0266 (by omega)]
  rw [node0202_0266, split_right 234 block1867 block1868 (by omega)]
  exact block1868_get i

theorem block1869_lookup (i : Fin 32) :
    lookup (266 + i.val) = some (values1869[i.val]'(by rw [values1869_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0170_0331 (266 + i.val) = _
  rw [node0170_0331, split_right 266 node0170_0266 node0266_0331 (by omega)]
  rw [node0266_0331, split_left 298 block1869 node0298_0331 (by omega)]
  exact block1869_get i

theorem block1870_lookup (i : Fin 32) :
    lookup (298 + i.val) = some (values1870[i.val]'(by rw [values1870_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0170_0331 (298 + i.val) = _
  rw [node0170_0331, split_right 266 node0170_0266 node0266_0331 (by omega)]
  rw [node0266_0331, split_right 298 block1869 node0298_0331 (by omega)]
  rw [node0298_0331, split_left 330 block1870 block1871 (by omega)]
  exact block1870_get i

theorem block1871_lookup (i : Fin 1) :
    lookup (330 + i.val) = some (values1871[i.val]'(by rw [values1871_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0170_0331 (330 + i.val) = _
  rw [node0170_0331, split_right 266 node0170_0266 node0266_0331 (by omega)]
  rw [node0266_0331, split_right 298 block1869 node0298_0331 (by omega)]
  rw [node0298_0331, split_right 330 block1870 block1871 (by omega)]
  exact block1871_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1866_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1866_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1867_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1867_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1868_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1868_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1869_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1869_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1870_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1870_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1871_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1871_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1866_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1867_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1868_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1869_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1870_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow171.block1871_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow171
