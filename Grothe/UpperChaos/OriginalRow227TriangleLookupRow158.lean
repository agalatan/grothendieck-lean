import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1788
import Grothe.UpperChaos.OriginalRow227TriangleData1789
import Grothe.UpperChaos.OriginalRow227TriangleData1790
import Grothe.UpperChaos.OriginalRow227TriangleData1791
import Grothe.UpperChaos.OriginalRow227TriangleData1792
import Grothe.UpperChaos.OriginalRow227TriangleData1793

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow158

open ConditionalTableLookup

def values1788 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1788.coefficient158_157,
  OriginalRow227TriangleData1788.coefficient158_158,
  OriginalRow227TriangleData1788.coefficient158_159,
  OriginalRow227TriangleData1788.coefficient158_160,
  OriginalRow227TriangleData1788.coefficient158_161,
  OriginalRow227TriangleData1788.coefficient158_162,
  OriginalRow227TriangleData1788.coefficient158_163,
  OriginalRow227TriangleData1788.coefficient158_164,
  OriginalRow227TriangleData1788.coefficient158_165,
  OriginalRow227TriangleData1788.coefficient158_166,
  OriginalRow227TriangleData1788.coefficient158_167,
  OriginalRow227TriangleData1788.coefficient158_168,
  OriginalRow227TriangleData1788.coefficient158_169,
  OriginalRow227TriangleData1788.coefficient158_170,
  OriginalRow227TriangleData1788.coefficient158_171,
  OriginalRow227TriangleData1788.coefficient158_172,
  OriginalRow227TriangleData1788.coefficient158_173,
  OriginalRow227TriangleData1788.coefficient158_174,
  OriginalRow227TriangleData1788.coefficient158_175,
  OriginalRow227TriangleData1788.coefficient158_176,
  OriginalRow227TriangleData1788.coefficient158_177,
  OriginalRow227TriangleData1788.coefficient158_178,
  OriginalRow227TriangleData1788.coefficient158_179,
  OriginalRow227TriangleData1788.coefficient158_180,
  OriginalRow227TriangleData1788.coefficient158_181,
  OriginalRow227TriangleData1788.coefficient158_182,
  OriginalRow227TriangleData1788.coefficient158_183,
  OriginalRow227TriangleData1788.coefficient158_184,
  OriginalRow227TriangleData1788.coefficient158_185,
  OriginalRow227TriangleData1788.coefficient158_186,
  OriginalRow227TriangleData1788.coefficient158_187,
  OriginalRow227TriangleData1788.coefficient158_188
]

theorem values1788_size : values1788.size = 32 := rfl

def block1788 : ℕ → Option IntervalDyadic := segment 157 values1788

theorem block1788_domain : ExactDomain block1788 157 189 := by
  simpa only [values1788_size] using segment_domain 157 values1788

theorem block1788_get (i : Fin 32) :
    block1788 (157 + i.val) = some (values1788[i.val]'(by rw [values1788_size]; exact i.isLt)) := by
  exact segment_get 157 values1788 ⟨i.val, by rw [values1788_size]; exact i.isLt⟩

def values1789 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1789.coefficient158_189,
  OriginalRow227TriangleData1789.coefficient158_190,
  OriginalRow227TriangleData1789.coefficient158_191,
  OriginalRow227TriangleData1789.coefficient158_192,
  OriginalRow227TriangleData1789.coefficient158_193,
  OriginalRow227TriangleData1789.coefficient158_194,
  OriginalRow227TriangleData1789.coefficient158_195,
  OriginalRow227TriangleData1789.coefficient158_196,
  OriginalRow227TriangleData1789.coefficient158_197,
  OriginalRow227TriangleData1789.coefficient158_198,
  OriginalRow227TriangleData1789.coefficient158_199,
  OriginalRow227TriangleData1789.coefficient158_200,
  OriginalRow227TriangleData1789.coefficient158_201,
  OriginalRow227TriangleData1789.coefficient158_202,
  OriginalRow227TriangleData1789.coefficient158_203,
  OriginalRow227TriangleData1789.coefficient158_204,
  OriginalRow227TriangleData1789.coefficient158_205,
  OriginalRow227TriangleData1789.coefficient158_206,
  OriginalRow227TriangleData1789.coefficient158_207,
  OriginalRow227TriangleData1789.coefficient158_208,
  OriginalRow227TriangleData1789.coefficient158_209,
  OriginalRow227TriangleData1789.coefficient158_210,
  OriginalRow227TriangleData1789.coefficient158_211,
  OriginalRow227TriangleData1789.coefficient158_212,
  OriginalRow227TriangleData1789.coefficient158_213,
  OriginalRow227TriangleData1789.coefficient158_214,
  OriginalRow227TriangleData1789.coefficient158_215,
  OriginalRow227TriangleData1789.coefficient158_216,
  OriginalRow227TriangleData1789.coefficient158_217,
  OriginalRow227TriangleData1789.coefficient158_218,
  OriginalRow227TriangleData1789.coefficient158_219,
  OriginalRow227TriangleData1789.coefficient158_220
]

theorem values1789_size : values1789.size = 32 := rfl

def block1789 : ℕ → Option IntervalDyadic := segment 189 values1789

theorem block1789_domain : ExactDomain block1789 189 221 := by
  simpa only [values1789_size] using segment_domain 189 values1789

theorem block1789_get (i : Fin 32) :
    block1789 (189 + i.val) = some (values1789[i.val]'(by rw [values1789_size]; exact i.isLt)) := by
  exact segment_get 189 values1789 ⟨i.val, by rw [values1789_size]; exact i.isLt⟩

def values1790 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1790.coefficient158_221,
  OriginalRow227TriangleData1790.coefficient158_222,
  OriginalRow227TriangleData1790.coefficient158_223,
  OriginalRow227TriangleData1790.coefficient158_224,
  OriginalRow227TriangleData1790.coefficient158_225,
  OriginalRow227TriangleData1790.coefficient158_226,
  OriginalRow227TriangleData1790.coefficient158_227,
  OriginalRow227TriangleData1790.coefficient158_228,
  OriginalRow227TriangleData1790.coefficient158_229,
  OriginalRow227TriangleData1790.coefficient158_230,
  OriginalRow227TriangleData1790.coefficient158_231,
  OriginalRow227TriangleData1790.coefficient158_232,
  OriginalRow227TriangleData1790.coefficient158_233,
  OriginalRow227TriangleData1790.coefficient158_234,
  OriginalRow227TriangleData1790.coefficient158_235,
  OriginalRow227TriangleData1790.coefficient158_236,
  OriginalRow227TriangleData1790.coefficient158_237,
  OriginalRow227TriangleData1790.coefficient158_238,
  OriginalRow227TriangleData1790.coefficient158_239,
  OriginalRow227TriangleData1790.coefficient158_240,
  OriginalRow227TriangleData1790.coefficient158_241,
  OriginalRow227TriangleData1790.coefficient158_242,
  OriginalRow227TriangleData1790.coefficient158_243,
  OriginalRow227TriangleData1790.coefficient158_244,
  OriginalRow227TriangleData1790.coefficient158_245,
  OriginalRow227TriangleData1790.coefficient158_246,
  OriginalRow227TriangleData1790.coefficient158_247,
  OriginalRow227TriangleData1790.coefficient158_248,
  OriginalRow227TriangleData1790.coefficient158_249,
  OriginalRow227TriangleData1790.coefficient158_250,
  OriginalRow227TriangleData1790.coefficient158_251,
  OriginalRow227TriangleData1790.coefficient158_252
]

theorem values1790_size : values1790.size = 32 := rfl

def block1790 : ℕ → Option IntervalDyadic := segment 221 values1790

theorem block1790_domain : ExactDomain block1790 221 253 := by
  simpa only [values1790_size] using segment_domain 221 values1790

theorem block1790_get (i : Fin 32) :
    block1790 (221 + i.val) = some (values1790[i.val]'(by rw [values1790_size]; exact i.isLt)) := by
  exact segment_get 221 values1790 ⟨i.val, by rw [values1790_size]; exact i.isLt⟩

def values1791 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1791.coefficient158_253,
  OriginalRow227TriangleData1791.coefficient158_254,
  OriginalRow227TriangleData1791.coefficient158_255,
  OriginalRow227TriangleData1791.coefficient158_256,
  OriginalRow227TriangleData1791.coefficient158_257,
  OriginalRow227TriangleData1791.coefficient158_258,
  OriginalRow227TriangleData1791.coefficient158_259,
  OriginalRow227TriangleData1791.coefficient158_260,
  OriginalRow227TriangleData1791.coefficient158_261,
  OriginalRow227TriangleData1791.coefficient158_262,
  OriginalRow227TriangleData1791.coefficient158_263,
  OriginalRow227TriangleData1791.coefficient158_264,
  OriginalRow227TriangleData1791.coefficient158_265,
  OriginalRow227TriangleData1791.coefficient158_266,
  OriginalRow227TriangleData1791.coefficient158_267,
  OriginalRow227TriangleData1791.coefficient158_268,
  OriginalRow227TriangleData1791.coefficient158_269,
  OriginalRow227TriangleData1791.coefficient158_270,
  OriginalRow227TriangleData1791.coefficient158_271,
  OriginalRow227TriangleData1791.coefficient158_272,
  OriginalRow227TriangleData1791.coefficient158_273,
  OriginalRow227TriangleData1791.coefficient158_274,
  OriginalRow227TriangleData1791.coefficient158_275,
  OriginalRow227TriangleData1791.coefficient158_276,
  OriginalRow227TriangleData1791.coefficient158_277,
  OriginalRow227TriangleData1791.coefficient158_278,
  OriginalRow227TriangleData1791.coefficient158_279,
  OriginalRow227TriangleData1791.coefficient158_280,
  OriginalRow227TriangleData1791.coefficient158_281,
  OriginalRow227TriangleData1791.coefficient158_282,
  OriginalRow227TriangleData1791.coefficient158_283,
  OriginalRow227TriangleData1791.coefficient158_284
]

theorem values1791_size : values1791.size = 32 := rfl

def block1791 : ℕ → Option IntervalDyadic := segment 253 values1791

theorem block1791_domain : ExactDomain block1791 253 285 := by
  simpa only [values1791_size] using segment_domain 253 values1791

theorem block1791_get (i : Fin 32) :
    block1791 (253 + i.val) = some (values1791[i.val]'(by rw [values1791_size]; exact i.isLt)) := by
  exact segment_get 253 values1791 ⟨i.val, by rw [values1791_size]; exact i.isLt⟩

def values1792 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1792.coefficient158_285,
  OriginalRow227TriangleData1792.coefficient158_286,
  OriginalRow227TriangleData1792.coefficient158_287,
  OriginalRow227TriangleData1792.coefficient158_288,
  OriginalRow227TriangleData1792.coefficient158_289,
  OriginalRow227TriangleData1792.coefficient158_290,
  OriginalRow227TriangleData1792.coefficient158_291,
  OriginalRow227TriangleData1792.coefficient158_292,
  OriginalRow227TriangleData1792.coefficient158_293,
  OriginalRow227TriangleData1792.coefficient158_294,
  OriginalRow227TriangleData1792.coefficient158_295,
  OriginalRow227TriangleData1792.coefficient158_296,
  OriginalRow227TriangleData1792.coefficient158_297,
  OriginalRow227TriangleData1792.coefficient158_298,
  OriginalRow227TriangleData1792.coefficient158_299,
  OriginalRow227TriangleData1792.coefficient158_300,
  OriginalRow227TriangleData1792.coefficient158_301,
  OriginalRow227TriangleData1792.coefficient158_302,
  OriginalRow227TriangleData1792.coefficient158_303,
  OriginalRow227TriangleData1792.coefficient158_304,
  OriginalRow227TriangleData1792.coefficient158_305,
  OriginalRow227TriangleData1792.coefficient158_306,
  OriginalRow227TriangleData1792.coefficient158_307,
  OriginalRow227TriangleData1792.coefficient158_308,
  OriginalRow227TriangleData1792.coefficient158_309,
  OriginalRow227TriangleData1792.coefficient158_310,
  OriginalRow227TriangleData1792.coefficient158_311,
  OriginalRow227TriangleData1792.coefficient158_312,
  OriginalRow227TriangleData1792.coefficient158_313,
  OriginalRow227TriangleData1792.coefficient158_314,
  OriginalRow227TriangleData1792.coefficient158_315,
  OriginalRow227TriangleData1792.coefficient158_316
]

theorem values1792_size : values1792.size = 32 := rfl

def block1792 : ℕ → Option IntervalDyadic := segment 285 values1792

theorem block1792_domain : ExactDomain block1792 285 317 := by
  simpa only [values1792_size] using segment_domain 285 values1792

theorem block1792_get (i : Fin 32) :
    block1792 (285 + i.val) = some (values1792[i.val]'(by rw [values1792_size]; exact i.isLt)) := by
  exact segment_get 285 values1792 ⟨i.val, by rw [values1792_size]; exact i.isLt⟩

def values1793 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1793.coefficient158_317,
  OriginalRow227TriangleData1793.coefficient158_318,
  OriginalRow227TriangleData1793.coefficient158_319,
  OriginalRow227TriangleData1793.coefficient158_320,
  OriginalRow227TriangleData1793.coefficient158_321,
  OriginalRow227TriangleData1793.coefficient158_322,
  OriginalRow227TriangleData1793.coefficient158_323,
  OriginalRow227TriangleData1793.coefficient158_324,
  OriginalRow227TriangleData1793.coefficient158_325,
  OriginalRow227TriangleData1793.coefficient158_326,
  OriginalRow227TriangleData1793.coefficient158_327,
  OriginalRow227TriangleData1793.coefficient158_328,
  OriginalRow227TriangleData1793.coefficient158_329,
  OriginalRow227TriangleData1793.coefficient158_330,
  OriginalRow227TriangleData1793.coefficient158_331,
  OriginalRow227TriangleData1793.coefficient158_332,
  OriginalRow227TriangleData1793.coefficient158_333,
  OriginalRow227TriangleData1793.coefficient158_334,
  OriginalRow227TriangleData1793.coefficient158_335,
  OriginalRow227TriangleData1793.coefficient158_336,
  OriginalRow227TriangleData1793.coefficient158_337,
  OriginalRow227TriangleData1793.coefficient158_338,
  OriginalRow227TriangleData1793.coefficient158_339,
  OriginalRow227TriangleData1793.coefficient158_340,
  OriginalRow227TriangleData1793.coefficient158_341,
  OriginalRow227TriangleData1793.coefficient158_342,
  OriginalRow227TriangleData1793.coefficient158_343
]

theorem values1793_size : values1793.size = 27 := rfl

def block1793 : ℕ → Option IntervalDyadic := segment 317 values1793

theorem block1793_domain : ExactDomain block1793 317 344 := by
  simpa only [values1793_size] using segment_domain 317 values1793

theorem block1793_get (i : Fin 27) :
    block1793 (317 + i.val) = some (values1793[i.val]'(by rw [values1793_size]; exact i.isLt)) := by
  exact segment_get 317 values1793 ⟨i.val, by rw [values1793_size]; exact i.isLt⟩

def node0189_0253 : ℕ → Option IntervalDyadic := split 221 block1789 block1790

theorem node0189_0253_domain : ExactDomain node0189_0253 189 253 := by
  exact split_domain (by decide) (by decide) block1789_domain block1790_domain

def node0157_0253 : ℕ → Option IntervalDyadic := split 189 block1788 node0189_0253

theorem node0157_0253_domain : ExactDomain node0157_0253 157 253 := by
  exact split_domain (by decide) (by decide) block1788_domain node0189_0253_domain

def node0285_0344 : ℕ → Option IntervalDyadic := split 317 block1792 block1793

theorem node0285_0344_domain : ExactDomain node0285_0344 285 344 := by
  exact split_domain (by decide) (by decide) block1792_domain block1793_domain

def node0253_0344 : ℕ → Option IntervalDyadic := split 285 block1791 node0285_0344

theorem node0253_0344_domain : ExactDomain node0253_0344 253 344 := by
  exact split_domain (by decide) (by decide) block1791_domain node0285_0344_domain

def node0157_0344 : ℕ → Option IntervalDyadic := split 253 node0157_0253 node0253_0344

theorem node0157_0344_domain : ExactDomain node0157_0344 157 344 := by
  exact split_domain (by decide) (by decide) node0157_0253_domain node0253_0344_domain

def lookup : ℕ → Option IntervalDyadic := node0157_0344

theorem lookup_domain : ExactDomain lookup 157 344 :=
  node0157_0344_domain

theorem block1788_lookup (i : Fin 32) :
    lookup (157 + i.val) = some (values1788[i.val]'(by rw [values1788_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0157_0344 (157 + i.val) = _
  rw [node0157_0344, split_left 253 node0157_0253 node0253_0344 (by omega)]
  rw [node0157_0253, split_left 189 block1788 node0189_0253 (by omega)]
  exact block1788_get i

theorem block1789_lookup (i : Fin 32) :
    lookup (189 + i.val) = some (values1789[i.val]'(by rw [values1789_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0157_0344 (189 + i.val) = _
  rw [node0157_0344, split_left 253 node0157_0253 node0253_0344 (by omega)]
  rw [node0157_0253, split_right 189 block1788 node0189_0253 (by omega)]
  rw [node0189_0253, split_left 221 block1789 block1790 (by omega)]
  exact block1789_get i

theorem block1790_lookup (i : Fin 32) :
    lookup (221 + i.val) = some (values1790[i.val]'(by rw [values1790_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0157_0344 (221 + i.val) = _
  rw [node0157_0344, split_left 253 node0157_0253 node0253_0344 (by omega)]
  rw [node0157_0253, split_right 189 block1788 node0189_0253 (by omega)]
  rw [node0189_0253, split_right 221 block1789 block1790 (by omega)]
  exact block1790_get i

theorem block1791_lookup (i : Fin 32) :
    lookup (253 + i.val) = some (values1791[i.val]'(by rw [values1791_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0157_0344 (253 + i.val) = _
  rw [node0157_0344, split_right 253 node0157_0253 node0253_0344 (by omega)]
  rw [node0253_0344, split_left 285 block1791 node0285_0344 (by omega)]
  exact block1791_get i

theorem block1792_lookup (i : Fin 32) :
    lookup (285 + i.val) = some (values1792[i.val]'(by rw [values1792_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0157_0344 (285 + i.val) = _
  rw [node0157_0344, split_right 253 node0157_0253 node0253_0344 (by omega)]
  rw [node0253_0344, split_right 285 block1791 node0285_0344 (by omega)]
  rw [node0285_0344, split_left 317 block1792 block1793 (by omega)]
  exact block1792_get i

theorem block1793_lookup (i : Fin 27) :
    lookup (317 + i.val) = some (values1793[i.val]'(by rw [values1793_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0157_0344 (317 + i.val) = _
  rw [node0157_0344, split_right 253 node0157_0253 node0253_0344 (by omega)]
  rw [node0253_0344, split_right 285 block1791 node0285_0344 (by omega)]
  rw [node0285_0344, split_right 317 block1792 block1793 (by omega)]
  exact block1793_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1788_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1788_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1789_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1789_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1790_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1790_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1791_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1791_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1792_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1792_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1793_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1793_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1788_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1789_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1790_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1791_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1792_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow158.block1793_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow158
