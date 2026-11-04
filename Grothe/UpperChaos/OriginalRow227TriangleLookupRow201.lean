import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData2004
import Grothe.UpperChaos.OriginalRow227TriangleData2005
import Grothe.UpperChaos.OriginalRow227TriangleData2006
import Grothe.UpperChaos.OriginalRow227TriangleData2007

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow201

open ConditionalTableLookup

def values2004 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2004.coefficient201_200,
  OriginalRow227TriangleData2004.coefficient201_201,
  OriginalRow227TriangleData2004.coefficient201_202,
  OriginalRow227TriangleData2004.coefficient201_203,
  OriginalRow227TriangleData2004.coefficient201_204,
  OriginalRow227TriangleData2004.coefficient201_205,
  OriginalRow227TriangleData2004.coefficient201_206,
  OriginalRow227TriangleData2004.coefficient201_207,
  OriginalRow227TriangleData2004.coefficient201_208,
  OriginalRow227TriangleData2004.coefficient201_209,
  OriginalRow227TriangleData2004.coefficient201_210,
  OriginalRow227TriangleData2004.coefficient201_211,
  OriginalRow227TriangleData2004.coefficient201_212,
  OriginalRow227TriangleData2004.coefficient201_213,
  OriginalRow227TriangleData2004.coefficient201_214,
  OriginalRow227TriangleData2004.coefficient201_215,
  OriginalRow227TriangleData2004.coefficient201_216,
  OriginalRow227TriangleData2004.coefficient201_217,
  OriginalRow227TriangleData2004.coefficient201_218,
  OriginalRow227TriangleData2004.coefficient201_219,
  OriginalRow227TriangleData2004.coefficient201_220,
  OriginalRow227TriangleData2004.coefficient201_221,
  OriginalRow227TriangleData2004.coefficient201_222,
  OriginalRow227TriangleData2004.coefficient201_223,
  OriginalRow227TriangleData2004.coefficient201_224,
  OriginalRow227TriangleData2004.coefficient201_225,
  OriginalRow227TriangleData2004.coefficient201_226,
  OriginalRow227TriangleData2004.coefficient201_227,
  OriginalRow227TriangleData2004.coefficient201_228,
  OriginalRow227TriangleData2004.coefficient201_229,
  OriginalRow227TriangleData2004.coefficient201_230,
  OriginalRow227TriangleData2004.coefficient201_231
]

theorem values2004_size : values2004.size = 32 := rfl

def block2004 : ℕ → Option IntervalDyadic := segment 200 values2004

theorem block2004_domain : ExactDomain block2004 200 232 := by
  simpa only [values2004_size] using segment_domain 200 values2004

theorem block2004_get (i : Fin 32) :
    block2004 (200 + i.val) = some (values2004[i.val]'(by rw [values2004_size]; exact i.isLt)) := by
  exact segment_get 200 values2004 ⟨i.val, by rw [values2004_size]; exact i.isLt⟩

def values2005 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2005.coefficient201_232,
  OriginalRow227TriangleData2005.coefficient201_233,
  OriginalRow227TriangleData2005.coefficient201_234,
  OriginalRow227TriangleData2005.coefficient201_235,
  OriginalRow227TriangleData2005.coefficient201_236,
  OriginalRow227TriangleData2005.coefficient201_237,
  OriginalRow227TriangleData2005.coefficient201_238,
  OriginalRow227TriangleData2005.coefficient201_239,
  OriginalRow227TriangleData2005.coefficient201_240,
  OriginalRow227TriangleData2005.coefficient201_241,
  OriginalRow227TriangleData2005.coefficient201_242,
  OriginalRow227TriangleData2005.coefficient201_243,
  OriginalRow227TriangleData2005.coefficient201_244,
  OriginalRow227TriangleData2005.coefficient201_245,
  OriginalRow227TriangleData2005.coefficient201_246,
  OriginalRow227TriangleData2005.coefficient201_247,
  OriginalRow227TriangleData2005.coefficient201_248,
  OriginalRow227TriangleData2005.coefficient201_249,
  OriginalRow227TriangleData2005.coefficient201_250,
  OriginalRow227TriangleData2005.coefficient201_251,
  OriginalRow227TriangleData2005.coefficient201_252,
  OriginalRow227TriangleData2005.coefficient201_253,
  OriginalRow227TriangleData2005.coefficient201_254,
  OriginalRow227TriangleData2005.coefficient201_255,
  OriginalRow227TriangleData2005.coefficient201_256,
  OriginalRow227TriangleData2005.coefficient201_257,
  OriginalRow227TriangleData2005.coefficient201_258,
  OriginalRow227TriangleData2005.coefficient201_259,
  OriginalRow227TriangleData2005.coefficient201_260,
  OriginalRow227TriangleData2005.coefficient201_261,
  OriginalRow227TriangleData2005.coefficient201_262,
  OriginalRow227TriangleData2005.coefficient201_263
]

theorem values2005_size : values2005.size = 32 := rfl

def block2005 : ℕ → Option IntervalDyadic := segment 232 values2005

theorem block2005_domain : ExactDomain block2005 232 264 := by
  simpa only [values2005_size] using segment_domain 232 values2005

theorem block2005_get (i : Fin 32) :
    block2005 (232 + i.val) = some (values2005[i.val]'(by rw [values2005_size]; exact i.isLt)) := by
  exact segment_get 232 values2005 ⟨i.val, by rw [values2005_size]; exact i.isLt⟩

def values2006 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2006.coefficient201_264,
  OriginalRow227TriangleData2006.coefficient201_265,
  OriginalRow227TriangleData2006.coefficient201_266,
  OriginalRow227TriangleData2006.coefficient201_267,
  OriginalRow227TriangleData2006.coefficient201_268,
  OriginalRow227TriangleData2006.coefficient201_269,
  OriginalRow227TriangleData2006.coefficient201_270,
  OriginalRow227TriangleData2006.coefficient201_271,
  OriginalRow227TriangleData2006.coefficient201_272,
  OriginalRow227TriangleData2006.coefficient201_273,
  OriginalRow227TriangleData2006.coefficient201_274,
  OriginalRow227TriangleData2006.coefficient201_275,
  OriginalRow227TriangleData2006.coefficient201_276,
  OriginalRow227TriangleData2006.coefficient201_277,
  OriginalRow227TriangleData2006.coefficient201_278,
  OriginalRow227TriangleData2006.coefficient201_279,
  OriginalRow227TriangleData2006.coefficient201_280,
  OriginalRow227TriangleData2006.coefficient201_281,
  OriginalRow227TriangleData2006.coefficient201_282,
  OriginalRow227TriangleData2006.coefficient201_283,
  OriginalRow227TriangleData2006.coefficient201_284,
  OriginalRow227TriangleData2006.coefficient201_285,
  OriginalRow227TriangleData2006.coefficient201_286,
  OriginalRow227TriangleData2006.coefficient201_287,
  OriginalRow227TriangleData2006.coefficient201_288,
  OriginalRow227TriangleData2006.coefficient201_289,
  OriginalRow227TriangleData2006.coefficient201_290,
  OriginalRow227TriangleData2006.coefficient201_291,
  OriginalRow227TriangleData2006.coefficient201_292,
  OriginalRow227TriangleData2006.coefficient201_293,
  OriginalRow227TriangleData2006.coefficient201_294,
  OriginalRow227TriangleData2006.coefficient201_295
]

theorem values2006_size : values2006.size = 32 := rfl

def block2006 : ℕ → Option IntervalDyadic := segment 264 values2006

theorem block2006_domain : ExactDomain block2006 264 296 := by
  simpa only [values2006_size] using segment_domain 264 values2006

theorem block2006_get (i : Fin 32) :
    block2006 (264 + i.val) = some (values2006[i.val]'(by rw [values2006_size]; exact i.isLt)) := by
  exact segment_get 264 values2006 ⟨i.val, by rw [values2006_size]; exact i.isLt⟩

def values2007 : Array IntervalDyadic := #[
  OriginalRow227TriangleData2007.coefficient201_296,
  OriginalRow227TriangleData2007.coefficient201_297,
  OriginalRow227TriangleData2007.coefficient201_298,
  OriginalRow227TriangleData2007.coefficient201_299,
  OriginalRow227TriangleData2007.coefficient201_300
]

theorem values2007_size : values2007.size = 5 := rfl

def block2007 : ℕ → Option IntervalDyadic := segment 296 values2007

theorem block2007_domain : ExactDomain block2007 296 301 := by
  simpa only [values2007_size] using segment_domain 296 values2007

theorem block2007_get (i : Fin 5) :
    block2007 (296 + i.val) = some (values2007[i.val]'(by rw [values2007_size]; exact i.isLt)) := by
  exact segment_get 296 values2007 ⟨i.val, by rw [values2007_size]; exact i.isLt⟩

def node0200_0264 : ℕ → Option IntervalDyadic := split 232 block2004 block2005

theorem node0200_0264_domain : ExactDomain node0200_0264 200 264 := by
  exact split_domain (by decide) (by decide) block2004_domain block2005_domain

def node0264_0301 : ℕ → Option IntervalDyadic := split 296 block2006 block2007

theorem node0264_0301_domain : ExactDomain node0264_0301 264 301 := by
  exact split_domain (by decide) (by decide) block2006_domain block2007_domain

def node0200_0301 : ℕ → Option IntervalDyadic := split 264 node0200_0264 node0264_0301

theorem node0200_0301_domain : ExactDomain node0200_0301 200 301 := by
  exact split_domain (by decide) (by decide) node0200_0264_domain node0264_0301_domain

def lookup : ℕ → Option IntervalDyadic := node0200_0301

theorem lookup_domain : ExactDomain lookup 200 301 :=
  node0200_0301_domain

theorem block2004_lookup (i : Fin 32) :
    lookup (200 + i.val) = some (values2004[i.val]'(by rw [values2004_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0200_0301 (200 + i.val) = _
  rw [node0200_0301, split_left 264 node0200_0264 node0264_0301 (by omega)]
  rw [node0200_0264, split_left 232 block2004 block2005 (by omega)]
  exact block2004_get i

theorem block2005_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values2005[i.val]'(by rw [values2005_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0200_0301 (232 + i.val) = _
  rw [node0200_0301, split_left 264 node0200_0264 node0264_0301 (by omega)]
  rw [node0200_0264, split_right 232 block2004 block2005 (by omega)]
  exact block2005_get i

theorem block2006_lookup (i : Fin 32) :
    lookup (264 + i.val) = some (values2006[i.val]'(by rw [values2006_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0200_0301 (264 + i.val) = _
  rw [node0200_0301, split_right 264 node0200_0264 node0264_0301 (by omega)]
  rw [node0264_0301, split_left 296 block2006 block2007 (by omega)]
  exact block2006_get i

theorem block2007_lookup (i : Fin 5) :
    lookup (296 + i.val) = some (values2007[i.val]'(by rw [values2007_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0200_0301 (296 + i.val) = _
  rw [node0200_0301, split_right 264 node0200_0264 node0264_0301 (by omega)]
  rw [node0264_0301, split_right 296 block2006 block2007 (by omega)]
  exact block2007_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2004_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2004_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2005_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2005_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2006_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2006_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2007_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2007_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2004_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2005_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2006_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow201.block2007_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow201
