import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1800
import Grothe.UpperChaos.OriginalRow227TriangleData1801
import Grothe.UpperChaos.OriginalRow227TriangleData1802
import Grothe.UpperChaos.OriginalRow227TriangleData1803
import Grothe.UpperChaos.OriginalRow227TriangleData1804
import Grothe.UpperChaos.OriginalRow227TriangleData1805

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow160

open ConditionalTableLookup

def values1800 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1800.coefficient160_159,
  OriginalRow227TriangleData1800.coefficient160_160,
  OriginalRow227TriangleData1800.coefficient160_161,
  OriginalRow227TriangleData1800.coefficient160_162,
  OriginalRow227TriangleData1800.coefficient160_163,
  OriginalRow227TriangleData1800.coefficient160_164,
  OriginalRow227TriangleData1800.coefficient160_165,
  OriginalRow227TriangleData1800.coefficient160_166,
  OriginalRow227TriangleData1800.coefficient160_167,
  OriginalRow227TriangleData1800.coefficient160_168,
  OriginalRow227TriangleData1800.coefficient160_169,
  OriginalRow227TriangleData1800.coefficient160_170,
  OriginalRow227TriangleData1800.coefficient160_171,
  OriginalRow227TriangleData1800.coefficient160_172,
  OriginalRow227TriangleData1800.coefficient160_173,
  OriginalRow227TriangleData1800.coefficient160_174,
  OriginalRow227TriangleData1800.coefficient160_175,
  OriginalRow227TriangleData1800.coefficient160_176,
  OriginalRow227TriangleData1800.coefficient160_177,
  OriginalRow227TriangleData1800.coefficient160_178,
  OriginalRow227TriangleData1800.coefficient160_179,
  OriginalRow227TriangleData1800.coefficient160_180,
  OriginalRow227TriangleData1800.coefficient160_181,
  OriginalRow227TriangleData1800.coefficient160_182,
  OriginalRow227TriangleData1800.coefficient160_183,
  OriginalRow227TriangleData1800.coefficient160_184,
  OriginalRow227TriangleData1800.coefficient160_185,
  OriginalRow227TriangleData1800.coefficient160_186,
  OriginalRow227TriangleData1800.coefficient160_187,
  OriginalRow227TriangleData1800.coefficient160_188,
  OriginalRow227TriangleData1800.coefficient160_189,
  OriginalRow227TriangleData1800.coefficient160_190
]

theorem values1800_size : values1800.size = 32 := rfl

def block1800 : ℕ → Option IntervalDyadic := segment 159 values1800

theorem block1800_domain : ExactDomain block1800 159 191 := by
  simpa only [values1800_size] using segment_domain 159 values1800

theorem block1800_get (i : Fin 32) :
    block1800 (159 + i.val) = some (values1800[i.val]'(by rw [values1800_size]; exact i.isLt)) := by
  exact segment_get 159 values1800 ⟨i.val, by rw [values1800_size]; exact i.isLt⟩

def values1801 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1801.coefficient160_191,
  OriginalRow227TriangleData1801.coefficient160_192,
  OriginalRow227TriangleData1801.coefficient160_193,
  OriginalRow227TriangleData1801.coefficient160_194,
  OriginalRow227TriangleData1801.coefficient160_195,
  OriginalRow227TriangleData1801.coefficient160_196,
  OriginalRow227TriangleData1801.coefficient160_197,
  OriginalRow227TriangleData1801.coefficient160_198,
  OriginalRow227TriangleData1801.coefficient160_199,
  OriginalRow227TriangleData1801.coefficient160_200,
  OriginalRow227TriangleData1801.coefficient160_201,
  OriginalRow227TriangleData1801.coefficient160_202,
  OriginalRow227TriangleData1801.coefficient160_203,
  OriginalRow227TriangleData1801.coefficient160_204,
  OriginalRow227TriangleData1801.coefficient160_205,
  OriginalRow227TriangleData1801.coefficient160_206,
  OriginalRow227TriangleData1801.coefficient160_207,
  OriginalRow227TriangleData1801.coefficient160_208,
  OriginalRow227TriangleData1801.coefficient160_209,
  OriginalRow227TriangleData1801.coefficient160_210,
  OriginalRow227TriangleData1801.coefficient160_211,
  OriginalRow227TriangleData1801.coefficient160_212,
  OriginalRow227TriangleData1801.coefficient160_213,
  OriginalRow227TriangleData1801.coefficient160_214,
  OriginalRow227TriangleData1801.coefficient160_215,
  OriginalRow227TriangleData1801.coefficient160_216,
  OriginalRow227TriangleData1801.coefficient160_217,
  OriginalRow227TriangleData1801.coefficient160_218,
  OriginalRow227TriangleData1801.coefficient160_219,
  OriginalRow227TriangleData1801.coefficient160_220,
  OriginalRow227TriangleData1801.coefficient160_221,
  OriginalRow227TriangleData1801.coefficient160_222
]

theorem values1801_size : values1801.size = 32 := rfl

def block1801 : ℕ → Option IntervalDyadic := segment 191 values1801

theorem block1801_domain : ExactDomain block1801 191 223 := by
  simpa only [values1801_size] using segment_domain 191 values1801

theorem block1801_get (i : Fin 32) :
    block1801 (191 + i.val) = some (values1801[i.val]'(by rw [values1801_size]; exact i.isLt)) := by
  exact segment_get 191 values1801 ⟨i.val, by rw [values1801_size]; exact i.isLt⟩

def values1802 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1802.coefficient160_223,
  OriginalRow227TriangleData1802.coefficient160_224,
  OriginalRow227TriangleData1802.coefficient160_225,
  OriginalRow227TriangleData1802.coefficient160_226,
  OriginalRow227TriangleData1802.coefficient160_227,
  OriginalRow227TriangleData1802.coefficient160_228,
  OriginalRow227TriangleData1802.coefficient160_229,
  OriginalRow227TriangleData1802.coefficient160_230,
  OriginalRow227TriangleData1802.coefficient160_231,
  OriginalRow227TriangleData1802.coefficient160_232,
  OriginalRow227TriangleData1802.coefficient160_233,
  OriginalRow227TriangleData1802.coefficient160_234,
  OriginalRow227TriangleData1802.coefficient160_235,
  OriginalRow227TriangleData1802.coefficient160_236,
  OriginalRow227TriangleData1802.coefficient160_237,
  OriginalRow227TriangleData1802.coefficient160_238,
  OriginalRow227TriangleData1802.coefficient160_239,
  OriginalRow227TriangleData1802.coefficient160_240,
  OriginalRow227TriangleData1802.coefficient160_241,
  OriginalRow227TriangleData1802.coefficient160_242,
  OriginalRow227TriangleData1802.coefficient160_243,
  OriginalRow227TriangleData1802.coefficient160_244,
  OriginalRow227TriangleData1802.coefficient160_245,
  OriginalRow227TriangleData1802.coefficient160_246,
  OriginalRow227TriangleData1802.coefficient160_247,
  OriginalRow227TriangleData1802.coefficient160_248,
  OriginalRow227TriangleData1802.coefficient160_249,
  OriginalRow227TriangleData1802.coefficient160_250,
  OriginalRow227TriangleData1802.coefficient160_251,
  OriginalRow227TriangleData1802.coefficient160_252,
  OriginalRow227TriangleData1802.coefficient160_253,
  OriginalRow227TriangleData1802.coefficient160_254
]

theorem values1802_size : values1802.size = 32 := rfl

def block1802 : ℕ → Option IntervalDyadic := segment 223 values1802

theorem block1802_domain : ExactDomain block1802 223 255 := by
  simpa only [values1802_size] using segment_domain 223 values1802

theorem block1802_get (i : Fin 32) :
    block1802 (223 + i.val) = some (values1802[i.val]'(by rw [values1802_size]; exact i.isLt)) := by
  exact segment_get 223 values1802 ⟨i.val, by rw [values1802_size]; exact i.isLt⟩

def values1803 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1803.coefficient160_255,
  OriginalRow227TriangleData1803.coefficient160_256,
  OriginalRow227TriangleData1803.coefficient160_257,
  OriginalRow227TriangleData1803.coefficient160_258,
  OriginalRow227TriangleData1803.coefficient160_259,
  OriginalRow227TriangleData1803.coefficient160_260,
  OriginalRow227TriangleData1803.coefficient160_261,
  OriginalRow227TriangleData1803.coefficient160_262,
  OriginalRow227TriangleData1803.coefficient160_263,
  OriginalRow227TriangleData1803.coefficient160_264,
  OriginalRow227TriangleData1803.coefficient160_265,
  OriginalRow227TriangleData1803.coefficient160_266,
  OriginalRow227TriangleData1803.coefficient160_267,
  OriginalRow227TriangleData1803.coefficient160_268,
  OriginalRow227TriangleData1803.coefficient160_269,
  OriginalRow227TriangleData1803.coefficient160_270,
  OriginalRow227TriangleData1803.coefficient160_271,
  OriginalRow227TriangleData1803.coefficient160_272,
  OriginalRow227TriangleData1803.coefficient160_273,
  OriginalRow227TriangleData1803.coefficient160_274,
  OriginalRow227TriangleData1803.coefficient160_275,
  OriginalRow227TriangleData1803.coefficient160_276,
  OriginalRow227TriangleData1803.coefficient160_277,
  OriginalRow227TriangleData1803.coefficient160_278,
  OriginalRow227TriangleData1803.coefficient160_279,
  OriginalRow227TriangleData1803.coefficient160_280,
  OriginalRow227TriangleData1803.coefficient160_281,
  OriginalRow227TriangleData1803.coefficient160_282,
  OriginalRow227TriangleData1803.coefficient160_283,
  OriginalRow227TriangleData1803.coefficient160_284,
  OriginalRow227TriangleData1803.coefficient160_285,
  OriginalRow227TriangleData1803.coefficient160_286
]

theorem values1803_size : values1803.size = 32 := rfl

def block1803 : ℕ → Option IntervalDyadic := segment 255 values1803

theorem block1803_domain : ExactDomain block1803 255 287 := by
  simpa only [values1803_size] using segment_domain 255 values1803

theorem block1803_get (i : Fin 32) :
    block1803 (255 + i.val) = some (values1803[i.val]'(by rw [values1803_size]; exact i.isLt)) := by
  exact segment_get 255 values1803 ⟨i.val, by rw [values1803_size]; exact i.isLt⟩

def values1804 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1804.coefficient160_287,
  OriginalRow227TriangleData1804.coefficient160_288,
  OriginalRow227TriangleData1804.coefficient160_289,
  OriginalRow227TriangleData1804.coefficient160_290,
  OriginalRow227TriangleData1804.coefficient160_291,
  OriginalRow227TriangleData1804.coefficient160_292,
  OriginalRow227TriangleData1804.coefficient160_293,
  OriginalRow227TriangleData1804.coefficient160_294,
  OriginalRow227TriangleData1804.coefficient160_295,
  OriginalRow227TriangleData1804.coefficient160_296,
  OriginalRow227TriangleData1804.coefficient160_297,
  OriginalRow227TriangleData1804.coefficient160_298,
  OriginalRow227TriangleData1804.coefficient160_299,
  OriginalRow227TriangleData1804.coefficient160_300,
  OriginalRow227TriangleData1804.coefficient160_301,
  OriginalRow227TriangleData1804.coefficient160_302,
  OriginalRow227TriangleData1804.coefficient160_303,
  OriginalRow227TriangleData1804.coefficient160_304,
  OriginalRow227TriangleData1804.coefficient160_305,
  OriginalRow227TriangleData1804.coefficient160_306,
  OriginalRow227TriangleData1804.coefficient160_307,
  OriginalRow227TriangleData1804.coefficient160_308,
  OriginalRow227TriangleData1804.coefficient160_309,
  OriginalRow227TriangleData1804.coefficient160_310,
  OriginalRow227TriangleData1804.coefficient160_311,
  OriginalRow227TriangleData1804.coefficient160_312,
  OriginalRow227TriangleData1804.coefficient160_313,
  OriginalRow227TriangleData1804.coefficient160_314,
  OriginalRow227TriangleData1804.coefficient160_315,
  OriginalRow227TriangleData1804.coefficient160_316,
  OriginalRow227TriangleData1804.coefficient160_317,
  OriginalRow227TriangleData1804.coefficient160_318
]

theorem values1804_size : values1804.size = 32 := rfl

def block1804 : ℕ → Option IntervalDyadic := segment 287 values1804

theorem block1804_domain : ExactDomain block1804 287 319 := by
  simpa only [values1804_size] using segment_domain 287 values1804

theorem block1804_get (i : Fin 32) :
    block1804 (287 + i.val) = some (values1804[i.val]'(by rw [values1804_size]; exact i.isLt)) := by
  exact segment_get 287 values1804 ⟨i.val, by rw [values1804_size]; exact i.isLt⟩

def values1805 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1805.coefficient160_319,
  OriginalRow227TriangleData1805.coefficient160_320,
  OriginalRow227TriangleData1805.coefficient160_321,
  OriginalRow227TriangleData1805.coefficient160_322,
  OriginalRow227TriangleData1805.coefficient160_323,
  OriginalRow227TriangleData1805.coefficient160_324,
  OriginalRow227TriangleData1805.coefficient160_325,
  OriginalRow227TriangleData1805.coefficient160_326,
  OriginalRow227TriangleData1805.coefficient160_327,
  OriginalRow227TriangleData1805.coefficient160_328,
  OriginalRow227TriangleData1805.coefficient160_329,
  OriginalRow227TriangleData1805.coefficient160_330,
  OriginalRow227TriangleData1805.coefficient160_331,
  OriginalRow227TriangleData1805.coefficient160_332,
  OriginalRow227TriangleData1805.coefficient160_333,
  OriginalRow227TriangleData1805.coefficient160_334,
  OriginalRow227TriangleData1805.coefficient160_335,
  OriginalRow227TriangleData1805.coefficient160_336,
  OriginalRow227TriangleData1805.coefficient160_337,
  OriginalRow227TriangleData1805.coefficient160_338,
  OriginalRow227TriangleData1805.coefficient160_339,
  OriginalRow227TriangleData1805.coefficient160_340,
  OriginalRow227TriangleData1805.coefficient160_341
]

theorem values1805_size : values1805.size = 23 := rfl

def block1805 : ℕ → Option IntervalDyadic := segment 319 values1805

theorem block1805_domain : ExactDomain block1805 319 342 := by
  simpa only [values1805_size] using segment_domain 319 values1805

theorem block1805_get (i : Fin 23) :
    block1805 (319 + i.val) = some (values1805[i.val]'(by rw [values1805_size]; exact i.isLt)) := by
  exact segment_get 319 values1805 ⟨i.val, by rw [values1805_size]; exact i.isLt⟩

def node0191_0255 : ℕ → Option IntervalDyadic := split 223 block1801 block1802

theorem node0191_0255_domain : ExactDomain node0191_0255 191 255 := by
  exact split_domain (by decide) (by decide) block1801_domain block1802_domain

def node0159_0255 : ℕ → Option IntervalDyadic := split 191 block1800 node0191_0255

theorem node0159_0255_domain : ExactDomain node0159_0255 159 255 := by
  exact split_domain (by decide) (by decide) block1800_domain node0191_0255_domain

def node0287_0342 : ℕ → Option IntervalDyadic := split 319 block1804 block1805

theorem node0287_0342_domain : ExactDomain node0287_0342 287 342 := by
  exact split_domain (by decide) (by decide) block1804_domain block1805_domain

def node0255_0342 : ℕ → Option IntervalDyadic := split 287 block1803 node0287_0342

theorem node0255_0342_domain : ExactDomain node0255_0342 255 342 := by
  exact split_domain (by decide) (by decide) block1803_domain node0287_0342_domain

def node0159_0342 : ℕ → Option IntervalDyadic := split 255 node0159_0255 node0255_0342

theorem node0159_0342_domain : ExactDomain node0159_0342 159 342 := by
  exact split_domain (by decide) (by decide) node0159_0255_domain node0255_0342_domain

def lookup : ℕ → Option IntervalDyadic := node0159_0342

theorem lookup_domain : ExactDomain lookup 159 342 :=
  node0159_0342_domain

theorem block1800_lookup (i : Fin 32) :
    lookup (159 + i.val) = some (values1800[i.val]'(by rw [values1800_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0159_0342 (159 + i.val) = _
  rw [node0159_0342, split_left 255 node0159_0255 node0255_0342 (by omega)]
  rw [node0159_0255, split_left 191 block1800 node0191_0255 (by omega)]
  exact block1800_get i

theorem block1801_lookup (i : Fin 32) :
    lookup (191 + i.val) = some (values1801[i.val]'(by rw [values1801_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0159_0342 (191 + i.val) = _
  rw [node0159_0342, split_left 255 node0159_0255 node0255_0342 (by omega)]
  rw [node0159_0255, split_right 191 block1800 node0191_0255 (by omega)]
  rw [node0191_0255, split_left 223 block1801 block1802 (by omega)]
  exact block1801_get i

theorem block1802_lookup (i : Fin 32) :
    lookup (223 + i.val) = some (values1802[i.val]'(by rw [values1802_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0159_0342 (223 + i.val) = _
  rw [node0159_0342, split_left 255 node0159_0255 node0255_0342 (by omega)]
  rw [node0159_0255, split_right 191 block1800 node0191_0255 (by omega)]
  rw [node0191_0255, split_right 223 block1801 block1802 (by omega)]
  exact block1802_get i

theorem block1803_lookup (i : Fin 32) :
    lookup (255 + i.val) = some (values1803[i.val]'(by rw [values1803_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0159_0342 (255 + i.val) = _
  rw [node0159_0342, split_right 255 node0159_0255 node0255_0342 (by omega)]
  rw [node0255_0342, split_left 287 block1803 node0287_0342 (by omega)]
  exact block1803_get i

theorem block1804_lookup (i : Fin 32) :
    lookup (287 + i.val) = some (values1804[i.val]'(by rw [values1804_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0159_0342 (287 + i.val) = _
  rw [node0159_0342, split_right 255 node0159_0255 node0255_0342 (by omega)]
  rw [node0255_0342, split_right 287 block1803 node0287_0342 (by omega)]
  rw [node0287_0342, split_left 319 block1804 block1805 (by omega)]
  exact block1804_get i

theorem block1805_lookup (i : Fin 23) :
    lookup (319 + i.val) = some (values1805[i.val]'(by rw [values1805_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0159_0342 (319 + i.val) = _
  rw [node0159_0342, split_right 255 node0159_0255 node0255_0342 (by omega)]
  rw [node0255_0342, split_right 287 block1803 node0287_0342 (by omega)]
  rw [node0287_0342, split_right 319 block1804 block1805 (by omega)]
  exact block1805_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1800_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1800_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1801_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1801_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1802_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1802_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1803_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1803_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1804_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1804_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1805_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1805_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1800_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1801_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1802_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1803_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1804_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow160.block1805_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow160
