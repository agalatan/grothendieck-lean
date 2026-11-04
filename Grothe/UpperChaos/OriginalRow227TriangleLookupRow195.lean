import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1980
import Grothe.UpperChaos.OriginalRow227TriangleData1981
import Grothe.UpperChaos.OriginalRow227TriangleData1982
import Grothe.UpperChaos.OriginalRow227TriangleData1983

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow195

open ConditionalTableLookup

def values1980 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1980.coefficient195_194,
  OriginalRow227TriangleData1980.coefficient195_195,
  OriginalRow227TriangleData1980.coefficient195_196,
  OriginalRow227TriangleData1980.coefficient195_197,
  OriginalRow227TriangleData1980.coefficient195_198,
  OriginalRow227TriangleData1980.coefficient195_199,
  OriginalRow227TriangleData1980.coefficient195_200,
  OriginalRow227TriangleData1980.coefficient195_201,
  OriginalRow227TriangleData1980.coefficient195_202,
  OriginalRow227TriangleData1980.coefficient195_203,
  OriginalRow227TriangleData1980.coefficient195_204,
  OriginalRow227TriangleData1980.coefficient195_205,
  OriginalRow227TriangleData1980.coefficient195_206,
  OriginalRow227TriangleData1980.coefficient195_207,
  OriginalRow227TriangleData1980.coefficient195_208,
  OriginalRow227TriangleData1980.coefficient195_209,
  OriginalRow227TriangleData1980.coefficient195_210,
  OriginalRow227TriangleData1980.coefficient195_211,
  OriginalRow227TriangleData1980.coefficient195_212,
  OriginalRow227TriangleData1980.coefficient195_213,
  OriginalRow227TriangleData1980.coefficient195_214,
  OriginalRow227TriangleData1980.coefficient195_215,
  OriginalRow227TriangleData1980.coefficient195_216,
  OriginalRow227TriangleData1980.coefficient195_217,
  OriginalRow227TriangleData1980.coefficient195_218,
  OriginalRow227TriangleData1980.coefficient195_219,
  OriginalRow227TriangleData1980.coefficient195_220,
  OriginalRow227TriangleData1980.coefficient195_221,
  OriginalRow227TriangleData1980.coefficient195_222,
  OriginalRow227TriangleData1980.coefficient195_223,
  OriginalRow227TriangleData1980.coefficient195_224,
  OriginalRow227TriangleData1980.coefficient195_225
]

theorem values1980_size : values1980.size = 32 := rfl

def block1980 : ℕ → Option IntervalDyadic := segment 194 values1980

theorem block1980_domain : ExactDomain block1980 194 226 := by
  simpa only [values1980_size] using segment_domain 194 values1980

theorem block1980_get (i : Fin 32) :
    block1980 (194 + i.val) = some (values1980[i.val]'(by rw [values1980_size]; exact i.isLt)) := by
  exact segment_get 194 values1980 ⟨i.val, by rw [values1980_size]; exact i.isLt⟩

def values1981 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1981.coefficient195_226,
  OriginalRow227TriangleData1981.coefficient195_227,
  OriginalRow227TriangleData1981.coefficient195_228,
  OriginalRow227TriangleData1981.coefficient195_229,
  OriginalRow227TriangleData1981.coefficient195_230,
  OriginalRow227TriangleData1981.coefficient195_231,
  OriginalRow227TriangleData1981.coefficient195_232,
  OriginalRow227TriangleData1981.coefficient195_233,
  OriginalRow227TriangleData1981.coefficient195_234,
  OriginalRow227TriangleData1981.coefficient195_235,
  OriginalRow227TriangleData1981.coefficient195_236,
  OriginalRow227TriangleData1981.coefficient195_237,
  OriginalRow227TriangleData1981.coefficient195_238,
  OriginalRow227TriangleData1981.coefficient195_239,
  OriginalRow227TriangleData1981.coefficient195_240,
  OriginalRow227TriangleData1981.coefficient195_241,
  OriginalRow227TriangleData1981.coefficient195_242,
  OriginalRow227TriangleData1981.coefficient195_243,
  OriginalRow227TriangleData1981.coefficient195_244,
  OriginalRow227TriangleData1981.coefficient195_245,
  OriginalRow227TriangleData1981.coefficient195_246,
  OriginalRow227TriangleData1981.coefficient195_247,
  OriginalRow227TriangleData1981.coefficient195_248,
  OriginalRow227TriangleData1981.coefficient195_249,
  OriginalRow227TriangleData1981.coefficient195_250,
  OriginalRow227TriangleData1981.coefficient195_251,
  OriginalRow227TriangleData1981.coefficient195_252,
  OriginalRow227TriangleData1981.coefficient195_253,
  OriginalRow227TriangleData1981.coefficient195_254,
  OriginalRow227TriangleData1981.coefficient195_255,
  OriginalRow227TriangleData1981.coefficient195_256,
  OriginalRow227TriangleData1981.coefficient195_257
]

theorem values1981_size : values1981.size = 32 := rfl

def block1981 : ℕ → Option IntervalDyadic := segment 226 values1981

theorem block1981_domain : ExactDomain block1981 226 258 := by
  simpa only [values1981_size] using segment_domain 226 values1981

theorem block1981_get (i : Fin 32) :
    block1981 (226 + i.val) = some (values1981[i.val]'(by rw [values1981_size]; exact i.isLt)) := by
  exact segment_get 226 values1981 ⟨i.val, by rw [values1981_size]; exact i.isLt⟩

def values1982 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1982.coefficient195_258,
  OriginalRow227TriangleData1982.coefficient195_259,
  OriginalRow227TriangleData1982.coefficient195_260,
  OriginalRow227TriangleData1982.coefficient195_261,
  OriginalRow227TriangleData1982.coefficient195_262,
  OriginalRow227TriangleData1982.coefficient195_263,
  OriginalRow227TriangleData1982.coefficient195_264,
  OriginalRow227TriangleData1982.coefficient195_265,
  OriginalRow227TriangleData1982.coefficient195_266,
  OriginalRow227TriangleData1982.coefficient195_267,
  OriginalRow227TriangleData1982.coefficient195_268,
  OriginalRow227TriangleData1982.coefficient195_269,
  OriginalRow227TriangleData1982.coefficient195_270,
  OriginalRow227TriangleData1982.coefficient195_271,
  OriginalRow227TriangleData1982.coefficient195_272,
  OriginalRow227TriangleData1982.coefficient195_273,
  OriginalRow227TriangleData1982.coefficient195_274,
  OriginalRow227TriangleData1982.coefficient195_275,
  OriginalRow227TriangleData1982.coefficient195_276,
  OriginalRow227TriangleData1982.coefficient195_277,
  OriginalRow227TriangleData1982.coefficient195_278,
  OriginalRow227TriangleData1982.coefficient195_279,
  OriginalRow227TriangleData1982.coefficient195_280,
  OriginalRow227TriangleData1982.coefficient195_281,
  OriginalRow227TriangleData1982.coefficient195_282,
  OriginalRow227TriangleData1982.coefficient195_283,
  OriginalRow227TriangleData1982.coefficient195_284,
  OriginalRow227TriangleData1982.coefficient195_285,
  OriginalRow227TriangleData1982.coefficient195_286,
  OriginalRow227TriangleData1982.coefficient195_287,
  OriginalRow227TriangleData1982.coefficient195_288,
  OriginalRow227TriangleData1982.coefficient195_289
]

theorem values1982_size : values1982.size = 32 := rfl

def block1982 : ℕ → Option IntervalDyadic := segment 258 values1982

theorem block1982_domain : ExactDomain block1982 258 290 := by
  simpa only [values1982_size] using segment_domain 258 values1982

theorem block1982_get (i : Fin 32) :
    block1982 (258 + i.val) = some (values1982[i.val]'(by rw [values1982_size]; exact i.isLt)) := by
  exact segment_get 258 values1982 ⟨i.val, by rw [values1982_size]; exact i.isLt⟩

def values1983 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1983.coefficient195_290,
  OriginalRow227TriangleData1983.coefficient195_291,
  OriginalRow227TriangleData1983.coefficient195_292,
  OriginalRow227TriangleData1983.coefficient195_293,
  OriginalRow227TriangleData1983.coefficient195_294,
  OriginalRow227TriangleData1983.coefficient195_295,
  OriginalRow227TriangleData1983.coefficient195_296,
  OriginalRow227TriangleData1983.coefficient195_297,
  OriginalRow227TriangleData1983.coefficient195_298,
  OriginalRow227TriangleData1983.coefficient195_299,
  OriginalRow227TriangleData1983.coefficient195_300,
  OriginalRow227TriangleData1983.coefficient195_301,
  OriginalRow227TriangleData1983.coefficient195_302,
  OriginalRow227TriangleData1983.coefficient195_303,
  OriginalRow227TriangleData1983.coefficient195_304,
  OriginalRow227TriangleData1983.coefficient195_305,
  OriginalRow227TriangleData1983.coefficient195_306
]

theorem values1983_size : values1983.size = 17 := rfl

def block1983 : ℕ → Option IntervalDyadic := segment 290 values1983

theorem block1983_domain : ExactDomain block1983 290 307 := by
  simpa only [values1983_size] using segment_domain 290 values1983

theorem block1983_get (i : Fin 17) :
    block1983 (290 + i.val) = some (values1983[i.val]'(by rw [values1983_size]; exact i.isLt)) := by
  exact segment_get 290 values1983 ⟨i.val, by rw [values1983_size]; exact i.isLt⟩

def node0194_0258 : ℕ → Option IntervalDyadic := split 226 block1980 block1981

theorem node0194_0258_domain : ExactDomain node0194_0258 194 258 := by
  exact split_domain (by decide) (by decide) block1980_domain block1981_domain

def node0258_0307 : ℕ → Option IntervalDyadic := split 290 block1982 block1983

theorem node0258_0307_domain : ExactDomain node0258_0307 258 307 := by
  exact split_domain (by decide) (by decide) block1982_domain block1983_domain

def node0194_0307 : ℕ → Option IntervalDyadic := split 258 node0194_0258 node0258_0307

theorem node0194_0307_domain : ExactDomain node0194_0307 194 307 := by
  exact split_domain (by decide) (by decide) node0194_0258_domain node0258_0307_domain

def lookup : ℕ → Option IntervalDyadic := node0194_0307

theorem lookup_domain : ExactDomain lookup 194 307 :=
  node0194_0307_domain

theorem block1980_lookup (i : Fin 32) :
    lookup (194 + i.val) = some (values1980[i.val]'(by rw [values1980_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0194_0307 (194 + i.val) = _
  rw [node0194_0307, split_left 258 node0194_0258 node0258_0307 (by omega)]
  rw [node0194_0258, split_left 226 block1980 block1981 (by omega)]
  exact block1980_get i

theorem block1981_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values1981[i.val]'(by rw [values1981_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0194_0307 (226 + i.val) = _
  rw [node0194_0307, split_left 258 node0194_0258 node0258_0307 (by omega)]
  rw [node0194_0258, split_right 226 block1980 block1981 (by omega)]
  exact block1981_get i

theorem block1982_lookup (i : Fin 32) :
    lookup (258 + i.val) = some (values1982[i.val]'(by rw [values1982_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0194_0307 (258 + i.val) = _
  rw [node0194_0307, split_right 258 node0194_0258 node0258_0307 (by omega)]
  rw [node0258_0307, split_left 290 block1982 block1983 (by omega)]
  exact block1982_get i

theorem block1983_lookup (i : Fin 17) :
    lookup (290 + i.val) = some (values1983[i.val]'(by rw [values1983_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0194_0307 (290 + i.val) = _
  rw [node0194_0307, split_right 258 node0194_0258 node0258_0307 (by omega)]
  rw [node0258_0307, split_right 290 block1982 block1983 (by omega)]
  exact block1983_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1980_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1980_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1981_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1981_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1982_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1982_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1983_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1983_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1980_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1981_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1982_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow195.block1983_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow195
