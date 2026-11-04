import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2000
import Grothe.UpperChaos.OriginalRow227TriangleData2001
import Grothe.UpperChaos.OriginalRow227TriangleData2002
import Grothe.UpperChaos.OriginalRow227TriangleData2003

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow200

open ConditionalTableLookup

def values2000 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2000.coefficient200_199,
  OriginalRow227TriangleData2000.coefficient200_200,
  OriginalRow227TriangleData2000.coefficient200_201,
  OriginalRow227TriangleData2000.coefficient200_202,
  OriginalRow227TriangleData2000.coefficient200_203,
  OriginalRow227TriangleData2000.coefficient200_204,
  OriginalRow227TriangleData2000.coefficient200_205,
  OriginalRow227TriangleData2000.coefficient200_206,
  OriginalRow227TriangleData2000.coefficient200_207,
  OriginalRow227TriangleData2000.coefficient200_208,
  OriginalRow227TriangleData2000.coefficient200_209,
  OriginalRow227TriangleData2000.coefficient200_210,
  OriginalRow227TriangleData2000.coefficient200_211,
  OriginalRow227TriangleData2000.coefficient200_212,
  OriginalRow227TriangleData2000.coefficient200_213,
  OriginalRow227TriangleData2000.coefficient200_214,
  OriginalRow227TriangleData2000.coefficient200_215,
  OriginalRow227TriangleData2000.coefficient200_216,
  OriginalRow227TriangleData2000.coefficient200_217,
  OriginalRow227TriangleData2000.coefficient200_218,
  OriginalRow227TriangleData2000.coefficient200_219,
  OriginalRow227TriangleData2000.coefficient200_220,
  OriginalRow227TriangleData2000.coefficient200_221,
  OriginalRow227TriangleData2000.coefficient200_222,
  OriginalRow227TriangleData2000.coefficient200_223,
  OriginalRow227TriangleData2000.coefficient200_224,
  OriginalRow227TriangleData2000.coefficient200_225,
  OriginalRow227TriangleData2000.coefficient200_226,
  OriginalRow227TriangleData2000.coefficient200_227,
  OriginalRow227TriangleData2000.coefficient200_228,
  OriginalRow227TriangleData2000.coefficient200_229,
  OriginalRow227TriangleData2000.coefficient200_230
]

theorem values2000_size : values2000.size = 32 := rfl

def block2000 : ℕ → Option IntervalDyadic := segment 199 values2000

theorem block2000_domain : ExactDomain block2000 199 231 := by
  simpa only [values2000_size] using segment_domain 199 values2000

theorem block2000_get (i : Fin 32) :
    block2000 (199 + i.val) = some (values2000[i.val]'(by rw [values2000_size]; exact i.isLt)) := by
  exact segment_get 199 values2000 ⟨i.val, by rw [values2000_size]; exact i.isLt⟩

def values2001 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2001.coefficient200_231,
  OriginalRow227TriangleData2001.coefficient200_232,
  OriginalRow227TriangleData2001.coefficient200_233,
  OriginalRow227TriangleData2001.coefficient200_234,
  OriginalRow227TriangleData2001.coefficient200_235,
  OriginalRow227TriangleData2001.coefficient200_236,
  OriginalRow227TriangleData2001.coefficient200_237,
  OriginalRow227TriangleData2001.coefficient200_238,
  OriginalRow227TriangleData2001.coefficient200_239,
  OriginalRow227TriangleData2001.coefficient200_240,
  OriginalRow227TriangleData2001.coefficient200_241,
  OriginalRow227TriangleData2001.coefficient200_242,
  OriginalRow227TriangleData2001.coefficient200_243,
  OriginalRow227TriangleData2001.coefficient200_244,
  OriginalRow227TriangleData2001.coefficient200_245,
  OriginalRow227TriangleData2001.coefficient200_246,
  OriginalRow227TriangleData2001.coefficient200_247,
  OriginalRow227TriangleData2001.coefficient200_248,
  OriginalRow227TriangleData2001.coefficient200_249,
  OriginalRow227TriangleData2001.coefficient200_250,
  OriginalRow227TriangleData2001.coefficient200_251,
  OriginalRow227TriangleData2001.coefficient200_252,
  OriginalRow227TriangleData2001.coefficient200_253,
  OriginalRow227TriangleData2001.coefficient200_254,
  OriginalRow227TriangleData2001.coefficient200_255,
  OriginalRow227TriangleData2001.coefficient200_256,
  OriginalRow227TriangleData2001.coefficient200_257,
  OriginalRow227TriangleData2001.coefficient200_258,
  OriginalRow227TriangleData2001.coefficient200_259,
  OriginalRow227TriangleData2001.coefficient200_260,
  OriginalRow227TriangleData2001.coefficient200_261,
  OriginalRow227TriangleData2001.coefficient200_262
]

theorem values2001_size : values2001.size = 32 := rfl

def block2001 : ℕ → Option IntervalDyadic := segment 231 values2001

theorem block2001_domain : ExactDomain block2001 231 263 := by
  simpa only [values2001_size] using segment_domain 231 values2001

theorem block2001_get (i : Fin 32) :
    block2001 (231 + i.val) = some (values2001[i.val]'(by rw [values2001_size]; exact i.isLt)) := by
  exact segment_get 231 values2001 ⟨i.val, by rw [values2001_size]; exact i.isLt⟩

def values2002 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2002.coefficient200_263,
  OriginalRow227TriangleData2002.coefficient200_264,
  OriginalRow227TriangleData2002.coefficient200_265,
  OriginalRow227TriangleData2002.coefficient200_266,
  OriginalRow227TriangleData2002.coefficient200_267,
  OriginalRow227TriangleData2002.coefficient200_268,
  OriginalRow227TriangleData2002.coefficient200_269,
  OriginalRow227TriangleData2002.coefficient200_270,
  OriginalRow227TriangleData2002.coefficient200_271,
  OriginalRow227TriangleData2002.coefficient200_272,
  OriginalRow227TriangleData2002.coefficient200_273,
  OriginalRow227TriangleData2002.coefficient200_274,
  OriginalRow227TriangleData2002.coefficient200_275,
  OriginalRow227TriangleData2002.coefficient200_276,
  OriginalRow227TriangleData2002.coefficient200_277,
  OriginalRow227TriangleData2002.coefficient200_278,
  OriginalRow227TriangleData2002.coefficient200_279,
  OriginalRow227TriangleData2002.coefficient200_280,
  OriginalRow227TriangleData2002.coefficient200_281,
  OriginalRow227TriangleData2002.coefficient200_282,
  OriginalRow227TriangleData2002.coefficient200_283,
  OriginalRow227TriangleData2002.coefficient200_284,
  OriginalRow227TriangleData2002.coefficient200_285,
  OriginalRow227TriangleData2002.coefficient200_286,
  OriginalRow227TriangleData2002.coefficient200_287,
  OriginalRow227TriangleData2002.coefficient200_288,
  OriginalRow227TriangleData2002.coefficient200_289,
  OriginalRow227TriangleData2002.coefficient200_290,
  OriginalRow227TriangleData2002.coefficient200_291,
  OriginalRow227TriangleData2002.coefficient200_292,
  OriginalRow227TriangleData2002.coefficient200_293,
  OriginalRow227TriangleData2002.coefficient200_294
]

theorem values2002_size : values2002.size = 32 := rfl

def block2002 : ℕ → Option IntervalDyadic := segment 263 values2002

theorem block2002_domain : ExactDomain block2002 263 295 := by
  simpa only [values2002_size] using segment_domain 263 values2002

theorem block2002_get (i : Fin 32) :
    block2002 (263 + i.val) = some (values2002[i.val]'(by rw [values2002_size]; exact i.isLt)) := by
  exact segment_get 263 values2002 ⟨i.val, by rw [values2002_size]; exact i.isLt⟩

def values2003 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2003.coefficient200_295,
  OriginalRow227TriangleData2003.coefficient200_296,
  OriginalRow227TriangleData2003.coefficient200_297,
  OriginalRow227TriangleData2003.coefficient200_298,
  OriginalRow227TriangleData2003.coefficient200_299,
  OriginalRow227TriangleData2003.coefficient200_300,
  OriginalRow227TriangleData2003.coefficient200_301
]

theorem values2003_size : values2003.size = 7 := rfl

def block2003 : ℕ → Option IntervalDyadic := segment 295 values2003

theorem block2003_domain : ExactDomain block2003 295 302 := by
  simpa only [values2003_size] using segment_domain 295 values2003

theorem block2003_get (i : Fin 7) :
    block2003 (295 + i.val) = some (values2003[i.val]'(by rw [values2003_size]; exact i.isLt)) := by
  exact segment_get 295 values2003 ⟨i.val, by rw [values2003_size]; exact i.isLt⟩

def node0199_0263 : ℕ → Option IntervalDyadic := split 231 block2000 block2001

theorem node0199_0263_domain : ExactDomain node0199_0263 199 263 := by
  exact split_domain (by decide) (by decide) block2000_domain block2001_domain

def node0263_0302 : ℕ → Option IntervalDyadic := split 295 block2002 block2003

theorem node0263_0302_domain : ExactDomain node0263_0302 263 302 := by
  exact split_domain (by decide) (by decide) block2002_domain block2003_domain

def node0199_0302 : ℕ → Option IntervalDyadic := split 263 node0199_0263 node0263_0302

theorem node0199_0302_domain : ExactDomain node0199_0302 199 302 := by
  exact split_domain (by decide) (by decide) node0199_0263_domain node0263_0302_domain

def lookup : ℕ → Option IntervalDyadic := node0199_0302

theorem lookup_domain : ExactDomain lookup 199 302 :=
  node0199_0302_domain

theorem block2000_lookup (i : Fin 32) :
    lookup (199 + i.val) = some (values2000[i.val]'(by rw [values2000_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0199_0302 (199 + i.val) = _
  rw [node0199_0302, split_left 263 node0199_0263 node0263_0302 (by omega)]
  rw [node0199_0263, split_left 231 block2000 block2001 (by omega)]
  exact block2000_get i

theorem block2001_lookup (i : Fin 32) :
    lookup (231 + i.val) = some (values2001[i.val]'(by rw [values2001_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0199_0302 (231 + i.val) = _
  rw [node0199_0302, split_left 263 node0199_0263 node0263_0302 (by omega)]
  rw [node0199_0263, split_right 231 block2000 block2001 (by omega)]
  exact block2001_get i

theorem block2002_lookup (i : Fin 32) :
    lookup (263 + i.val) = some (values2002[i.val]'(by rw [values2002_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0199_0302 (263 + i.val) = _
  rw [node0199_0302, split_right 263 node0199_0263 node0263_0302 (by omega)]
  rw [node0263_0302, split_left 295 block2002 block2003 (by omega)]
  exact block2002_get i

theorem block2003_lookup (i : Fin 7) :
    lookup (295 + i.val) = some (values2003[i.val]'(by rw [values2003_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0199_0302 (295 + i.val) = _
  rw [node0199_0302, split_right 263 node0199_0263 node0263_0302 (by omega)]
  rw [node0263_0302, split_right 295 block2002 block2003 (by omega)]
  exact block2003_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2000_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2000_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2001_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2001_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2002_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2002_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2003_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2003_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2000_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2001_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2002_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow200.block2003_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow200
