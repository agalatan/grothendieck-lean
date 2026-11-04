import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1794
import Grothe.UpperChaos.OriginalRow227TriangleData1795
import Grothe.UpperChaos.OriginalRow227TriangleData1796
import Grothe.UpperChaos.OriginalRow227TriangleData1797
import Grothe.UpperChaos.OriginalRow227TriangleData1798
import Grothe.UpperChaos.OriginalRow227TriangleData1799

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow159

open ConditionalTableLookup

def values1794 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1794.coefficient159_158,
  OriginalRow227TriangleData1794.coefficient159_159,
  OriginalRow227TriangleData1794.coefficient159_160,
  OriginalRow227TriangleData1794.coefficient159_161,
  OriginalRow227TriangleData1794.coefficient159_162,
  OriginalRow227TriangleData1794.coefficient159_163,
  OriginalRow227TriangleData1794.coefficient159_164,
  OriginalRow227TriangleData1794.coefficient159_165,
  OriginalRow227TriangleData1794.coefficient159_166,
  OriginalRow227TriangleData1794.coefficient159_167,
  OriginalRow227TriangleData1794.coefficient159_168,
  OriginalRow227TriangleData1794.coefficient159_169,
  OriginalRow227TriangleData1794.coefficient159_170,
  OriginalRow227TriangleData1794.coefficient159_171,
  OriginalRow227TriangleData1794.coefficient159_172,
  OriginalRow227TriangleData1794.coefficient159_173,
  OriginalRow227TriangleData1794.coefficient159_174,
  OriginalRow227TriangleData1794.coefficient159_175,
  OriginalRow227TriangleData1794.coefficient159_176,
  OriginalRow227TriangleData1794.coefficient159_177,
  OriginalRow227TriangleData1794.coefficient159_178,
  OriginalRow227TriangleData1794.coefficient159_179,
  OriginalRow227TriangleData1794.coefficient159_180,
  OriginalRow227TriangleData1794.coefficient159_181,
  OriginalRow227TriangleData1794.coefficient159_182,
  OriginalRow227TriangleData1794.coefficient159_183,
  OriginalRow227TriangleData1794.coefficient159_184,
  OriginalRow227TriangleData1794.coefficient159_185,
  OriginalRow227TriangleData1794.coefficient159_186,
  OriginalRow227TriangleData1794.coefficient159_187,
  OriginalRow227TriangleData1794.coefficient159_188,
  OriginalRow227TriangleData1794.coefficient159_189
]

theorem values1794_size : values1794.size = 32 := rfl

def block1794 : ℕ → Option IntervalDyadic := segment 158 values1794

theorem block1794_domain : ExactDomain block1794 158 190 := by
  simpa only [values1794_size] using segment_domain 158 values1794

theorem block1794_get (i : Fin 32) :
    block1794 (158 + i.val) = some (values1794[i.val]'(by rw [values1794_size]; exact i.isLt)) := by
  exact segment_get 158 values1794 ⟨i.val, by rw [values1794_size]; exact i.isLt⟩

def values1795 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1795.coefficient159_190,
  OriginalRow227TriangleData1795.coefficient159_191,
  OriginalRow227TriangleData1795.coefficient159_192,
  OriginalRow227TriangleData1795.coefficient159_193,
  OriginalRow227TriangleData1795.coefficient159_194,
  OriginalRow227TriangleData1795.coefficient159_195,
  OriginalRow227TriangleData1795.coefficient159_196,
  OriginalRow227TriangleData1795.coefficient159_197,
  OriginalRow227TriangleData1795.coefficient159_198,
  OriginalRow227TriangleData1795.coefficient159_199,
  OriginalRow227TriangleData1795.coefficient159_200,
  OriginalRow227TriangleData1795.coefficient159_201,
  OriginalRow227TriangleData1795.coefficient159_202,
  OriginalRow227TriangleData1795.coefficient159_203,
  OriginalRow227TriangleData1795.coefficient159_204,
  OriginalRow227TriangleData1795.coefficient159_205,
  OriginalRow227TriangleData1795.coefficient159_206,
  OriginalRow227TriangleData1795.coefficient159_207,
  OriginalRow227TriangleData1795.coefficient159_208,
  OriginalRow227TriangleData1795.coefficient159_209,
  OriginalRow227TriangleData1795.coefficient159_210,
  OriginalRow227TriangleData1795.coefficient159_211,
  OriginalRow227TriangleData1795.coefficient159_212,
  OriginalRow227TriangleData1795.coefficient159_213,
  OriginalRow227TriangleData1795.coefficient159_214,
  OriginalRow227TriangleData1795.coefficient159_215,
  OriginalRow227TriangleData1795.coefficient159_216,
  OriginalRow227TriangleData1795.coefficient159_217,
  OriginalRow227TriangleData1795.coefficient159_218,
  OriginalRow227TriangleData1795.coefficient159_219,
  OriginalRow227TriangleData1795.coefficient159_220,
  OriginalRow227TriangleData1795.coefficient159_221
]

theorem values1795_size : values1795.size = 32 := rfl

def block1795 : ℕ → Option IntervalDyadic := segment 190 values1795

theorem block1795_domain : ExactDomain block1795 190 222 := by
  simpa only [values1795_size] using segment_domain 190 values1795

theorem block1795_get (i : Fin 32) :
    block1795 (190 + i.val) = some (values1795[i.val]'(by rw [values1795_size]; exact i.isLt)) := by
  exact segment_get 190 values1795 ⟨i.val, by rw [values1795_size]; exact i.isLt⟩

def values1796 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1796.coefficient159_222,
  OriginalRow227TriangleData1796.coefficient159_223,
  OriginalRow227TriangleData1796.coefficient159_224,
  OriginalRow227TriangleData1796.coefficient159_225,
  OriginalRow227TriangleData1796.coefficient159_226,
  OriginalRow227TriangleData1796.coefficient159_227,
  OriginalRow227TriangleData1796.coefficient159_228,
  OriginalRow227TriangleData1796.coefficient159_229,
  OriginalRow227TriangleData1796.coefficient159_230,
  OriginalRow227TriangleData1796.coefficient159_231,
  OriginalRow227TriangleData1796.coefficient159_232,
  OriginalRow227TriangleData1796.coefficient159_233,
  OriginalRow227TriangleData1796.coefficient159_234,
  OriginalRow227TriangleData1796.coefficient159_235,
  OriginalRow227TriangleData1796.coefficient159_236,
  OriginalRow227TriangleData1796.coefficient159_237,
  OriginalRow227TriangleData1796.coefficient159_238,
  OriginalRow227TriangleData1796.coefficient159_239,
  OriginalRow227TriangleData1796.coefficient159_240,
  OriginalRow227TriangleData1796.coefficient159_241,
  OriginalRow227TriangleData1796.coefficient159_242,
  OriginalRow227TriangleData1796.coefficient159_243,
  OriginalRow227TriangleData1796.coefficient159_244,
  OriginalRow227TriangleData1796.coefficient159_245,
  OriginalRow227TriangleData1796.coefficient159_246,
  OriginalRow227TriangleData1796.coefficient159_247,
  OriginalRow227TriangleData1796.coefficient159_248,
  OriginalRow227TriangleData1796.coefficient159_249,
  OriginalRow227TriangleData1796.coefficient159_250,
  OriginalRow227TriangleData1796.coefficient159_251,
  OriginalRow227TriangleData1796.coefficient159_252,
  OriginalRow227TriangleData1796.coefficient159_253
]

theorem values1796_size : values1796.size = 32 := rfl

def block1796 : ℕ → Option IntervalDyadic := segment 222 values1796

theorem block1796_domain : ExactDomain block1796 222 254 := by
  simpa only [values1796_size] using segment_domain 222 values1796

theorem block1796_get (i : Fin 32) :
    block1796 (222 + i.val) = some (values1796[i.val]'(by rw [values1796_size]; exact i.isLt)) := by
  exact segment_get 222 values1796 ⟨i.val, by rw [values1796_size]; exact i.isLt⟩

def values1797 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1797.coefficient159_254,
  OriginalRow227TriangleData1797.coefficient159_255,
  OriginalRow227TriangleData1797.coefficient159_256,
  OriginalRow227TriangleData1797.coefficient159_257,
  OriginalRow227TriangleData1797.coefficient159_258,
  OriginalRow227TriangleData1797.coefficient159_259,
  OriginalRow227TriangleData1797.coefficient159_260,
  OriginalRow227TriangleData1797.coefficient159_261,
  OriginalRow227TriangleData1797.coefficient159_262,
  OriginalRow227TriangleData1797.coefficient159_263,
  OriginalRow227TriangleData1797.coefficient159_264,
  OriginalRow227TriangleData1797.coefficient159_265,
  OriginalRow227TriangleData1797.coefficient159_266,
  OriginalRow227TriangleData1797.coefficient159_267,
  OriginalRow227TriangleData1797.coefficient159_268,
  OriginalRow227TriangleData1797.coefficient159_269,
  OriginalRow227TriangleData1797.coefficient159_270,
  OriginalRow227TriangleData1797.coefficient159_271,
  OriginalRow227TriangleData1797.coefficient159_272,
  OriginalRow227TriangleData1797.coefficient159_273,
  OriginalRow227TriangleData1797.coefficient159_274,
  OriginalRow227TriangleData1797.coefficient159_275,
  OriginalRow227TriangleData1797.coefficient159_276,
  OriginalRow227TriangleData1797.coefficient159_277,
  OriginalRow227TriangleData1797.coefficient159_278,
  OriginalRow227TriangleData1797.coefficient159_279,
  OriginalRow227TriangleData1797.coefficient159_280,
  OriginalRow227TriangleData1797.coefficient159_281,
  OriginalRow227TriangleData1797.coefficient159_282,
  OriginalRow227TriangleData1797.coefficient159_283,
  OriginalRow227TriangleData1797.coefficient159_284,
  OriginalRow227TriangleData1797.coefficient159_285
]

theorem values1797_size : values1797.size = 32 := rfl

def block1797 : ℕ → Option IntervalDyadic := segment 254 values1797

theorem block1797_domain : ExactDomain block1797 254 286 := by
  simpa only [values1797_size] using segment_domain 254 values1797

theorem block1797_get (i : Fin 32) :
    block1797 (254 + i.val) = some (values1797[i.val]'(by rw [values1797_size]; exact i.isLt)) := by
  exact segment_get 254 values1797 ⟨i.val, by rw [values1797_size]; exact i.isLt⟩

def values1798 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1798.coefficient159_286,
  OriginalRow227TriangleData1798.coefficient159_287,
  OriginalRow227TriangleData1798.coefficient159_288,
  OriginalRow227TriangleData1798.coefficient159_289,
  OriginalRow227TriangleData1798.coefficient159_290,
  OriginalRow227TriangleData1798.coefficient159_291,
  OriginalRow227TriangleData1798.coefficient159_292,
  OriginalRow227TriangleData1798.coefficient159_293,
  OriginalRow227TriangleData1798.coefficient159_294,
  OriginalRow227TriangleData1798.coefficient159_295,
  OriginalRow227TriangleData1798.coefficient159_296,
  OriginalRow227TriangleData1798.coefficient159_297,
  OriginalRow227TriangleData1798.coefficient159_298,
  OriginalRow227TriangleData1798.coefficient159_299,
  OriginalRow227TriangleData1798.coefficient159_300,
  OriginalRow227TriangleData1798.coefficient159_301,
  OriginalRow227TriangleData1798.coefficient159_302,
  OriginalRow227TriangleData1798.coefficient159_303,
  OriginalRow227TriangleData1798.coefficient159_304,
  OriginalRow227TriangleData1798.coefficient159_305,
  OriginalRow227TriangleData1798.coefficient159_306,
  OriginalRow227TriangleData1798.coefficient159_307,
  OriginalRow227TriangleData1798.coefficient159_308,
  OriginalRow227TriangleData1798.coefficient159_309,
  OriginalRow227TriangleData1798.coefficient159_310,
  OriginalRow227TriangleData1798.coefficient159_311,
  OriginalRow227TriangleData1798.coefficient159_312,
  OriginalRow227TriangleData1798.coefficient159_313,
  OriginalRow227TriangleData1798.coefficient159_314,
  OriginalRow227TriangleData1798.coefficient159_315,
  OriginalRow227TriangleData1798.coefficient159_316,
  OriginalRow227TriangleData1798.coefficient159_317
]

theorem values1798_size : values1798.size = 32 := rfl

def block1798 : ℕ → Option IntervalDyadic := segment 286 values1798

theorem block1798_domain : ExactDomain block1798 286 318 := by
  simpa only [values1798_size] using segment_domain 286 values1798

theorem block1798_get (i : Fin 32) :
    block1798 (286 + i.val) = some (values1798[i.val]'(by rw [values1798_size]; exact i.isLt)) := by
  exact segment_get 286 values1798 ⟨i.val, by rw [values1798_size]; exact i.isLt⟩

def values1799 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1799.coefficient159_318,
  OriginalRow227TriangleData1799.coefficient159_319,
  OriginalRow227TriangleData1799.coefficient159_320,
  OriginalRow227TriangleData1799.coefficient159_321,
  OriginalRow227TriangleData1799.coefficient159_322,
  OriginalRow227TriangleData1799.coefficient159_323,
  OriginalRow227TriangleData1799.coefficient159_324,
  OriginalRow227TriangleData1799.coefficient159_325,
  OriginalRow227TriangleData1799.coefficient159_326,
  OriginalRow227TriangleData1799.coefficient159_327,
  OriginalRow227TriangleData1799.coefficient159_328,
  OriginalRow227TriangleData1799.coefficient159_329,
  OriginalRow227TriangleData1799.coefficient159_330,
  OriginalRow227TriangleData1799.coefficient159_331,
  OriginalRow227TriangleData1799.coefficient159_332,
  OriginalRow227TriangleData1799.coefficient159_333,
  OriginalRow227TriangleData1799.coefficient159_334,
  OriginalRow227TriangleData1799.coefficient159_335,
  OriginalRow227TriangleData1799.coefficient159_336,
  OriginalRow227TriangleData1799.coefficient159_337,
  OriginalRow227TriangleData1799.coefficient159_338,
  OriginalRow227TriangleData1799.coefficient159_339,
  OriginalRow227TriangleData1799.coefficient159_340,
  OriginalRow227TriangleData1799.coefficient159_341,
  OriginalRow227TriangleData1799.coefficient159_342
]

theorem values1799_size : values1799.size = 25 := rfl

def block1799 : ℕ → Option IntervalDyadic := segment 318 values1799

theorem block1799_domain : ExactDomain block1799 318 343 := by
  simpa only [values1799_size] using segment_domain 318 values1799

theorem block1799_get (i : Fin 25) :
    block1799 (318 + i.val) = some (values1799[i.val]'(by rw [values1799_size]; exact i.isLt)) := by
  exact segment_get 318 values1799 ⟨i.val, by rw [values1799_size]; exact i.isLt⟩

def node0190_0254 : ℕ → Option IntervalDyadic := split 222 block1795 block1796

theorem node0190_0254_domain : ExactDomain node0190_0254 190 254 := by
  exact split_domain (by decide) (by decide) block1795_domain block1796_domain

def node0158_0254 : ℕ → Option IntervalDyadic := split 190 block1794 node0190_0254

theorem node0158_0254_domain : ExactDomain node0158_0254 158 254 := by
  exact split_domain (by decide) (by decide) block1794_domain node0190_0254_domain

def node0286_0343 : ℕ → Option IntervalDyadic := split 318 block1798 block1799

theorem node0286_0343_domain : ExactDomain node0286_0343 286 343 := by
  exact split_domain (by decide) (by decide) block1798_domain block1799_domain

def node0254_0343 : ℕ → Option IntervalDyadic := split 286 block1797 node0286_0343

theorem node0254_0343_domain : ExactDomain node0254_0343 254 343 := by
  exact split_domain (by decide) (by decide) block1797_domain node0286_0343_domain

def node0158_0343 : ℕ → Option IntervalDyadic := split 254 node0158_0254 node0254_0343

theorem node0158_0343_domain : ExactDomain node0158_0343 158 343 := by
  exact split_domain (by decide) (by decide) node0158_0254_domain node0254_0343_domain

def lookup : ℕ → Option IntervalDyadic := node0158_0343

theorem lookup_domain : ExactDomain lookup 158 343 :=
  node0158_0343_domain

theorem block1794_lookup (i : Fin 32) :
    lookup (158 + i.val) = some (values1794[i.val]'(by rw [values1794_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0158_0343 (158 + i.val) = _
  rw [node0158_0343, split_left 254 node0158_0254 node0254_0343 (by omega)]
  rw [node0158_0254, split_left 190 block1794 node0190_0254 (by omega)]
  exact block1794_get i

theorem block1795_lookup (i : Fin 32) :
    lookup (190 + i.val) = some (values1795[i.val]'(by rw [values1795_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0158_0343 (190 + i.val) = _
  rw [node0158_0343, split_left 254 node0158_0254 node0254_0343 (by omega)]
  rw [node0158_0254, split_right 190 block1794 node0190_0254 (by omega)]
  rw [node0190_0254, split_left 222 block1795 block1796 (by omega)]
  exact block1795_get i

theorem block1796_lookup (i : Fin 32) :
    lookup (222 + i.val) = some (values1796[i.val]'(by rw [values1796_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0158_0343 (222 + i.val) = _
  rw [node0158_0343, split_left 254 node0158_0254 node0254_0343 (by omega)]
  rw [node0158_0254, split_right 190 block1794 node0190_0254 (by omega)]
  rw [node0190_0254, split_right 222 block1795 block1796 (by omega)]
  exact block1796_get i

theorem block1797_lookup (i : Fin 32) :
    lookup (254 + i.val) = some (values1797[i.val]'(by rw [values1797_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0158_0343 (254 + i.val) = _
  rw [node0158_0343, split_right 254 node0158_0254 node0254_0343 (by omega)]
  rw [node0254_0343, split_left 286 block1797 node0286_0343 (by omega)]
  exact block1797_get i

theorem block1798_lookup (i : Fin 32) :
    lookup (286 + i.val) = some (values1798[i.val]'(by rw [values1798_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0158_0343 (286 + i.val) = _
  rw [node0158_0343, split_right 254 node0158_0254 node0254_0343 (by omega)]
  rw [node0254_0343, split_right 286 block1797 node0286_0343 (by omega)]
  rw [node0286_0343, split_left 318 block1798 block1799 (by omega)]
  exact block1798_get i

theorem block1799_lookup (i : Fin 25) :
    lookup (318 + i.val) = some (values1799[i.val]'(by rw [values1799_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0158_0343 (318 + i.val) = _
  rw [node0158_0343, split_right 254 node0158_0254 node0254_0343 (by omega)]
  rw [node0254_0343, split_right 286 block1797 node0286_0343 (by omega)]
  rw [node0286_0343, split_right 318 block1798 block1799 (by omega)]
  exact block1799_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1794_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1794_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1795_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1795_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1796_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1796_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1797_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1797_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1798_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1798_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1799_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1799_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1794_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1795_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1796_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1797_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1798_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow159.block1799_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow159
