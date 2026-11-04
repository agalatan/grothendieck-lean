import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1776
import Grothe.UpperChaos.OriginalRow227TriangleData1777
import Grothe.UpperChaos.OriginalRow227TriangleData1778
import Grothe.UpperChaos.OriginalRow227TriangleData1779
import Grothe.UpperChaos.OriginalRow227TriangleData1780
import Grothe.UpperChaos.OriginalRow227TriangleData1781

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow156

open ConditionalTableLookup

def values1776 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1776.coefficient156_155,
  OriginalRow227TriangleData1776.coefficient156_156,
  OriginalRow227TriangleData1776.coefficient156_157,
  OriginalRow227TriangleData1776.coefficient156_158,
  OriginalRow227TriangleData1776.coefficient156_159,
  OriginalRow227TriangleData1776.coefficient156_160,
  OriginalRow227TriangleData1776.coefficient156_161,
  OriginalRow227TriangleData1776.coefficient156_162,
  OriginalRow227TriangleData1776.coefficient156_163,
  OriginalRow227TriangleData1776.coefficient156_164,
  OriginalRow227TriangleData1776.coefficient156_165,
  OriginalRow227TriangleData1776.coefficient156_166,
  OriginalRow227TriangleData1776.coefficient156_167,
  OriginalRow227TriangleData1776.coefficient156_168,
  OriginalRow227TriangleData1776.coefficient156_169,
  OriginalRow227TriangleData1776.coefficient156_170,
  OriginalRow227TriangleData1776.coefficient156_171,
  OriginalRow227TriangleData1776.coefficient156_172,
  OriginalRow227TriangleData1776.coefficient156_173,
  OriginalRow227TriangleData1776.coefficient156_174,
  OriginalRow227TriangleData1776.coefficient156_175,
  OriginalRow227TriangleData1776.coefficient156_176,
  OriginalRow227TriangleData1776.coefficient156_177,
  OriginalRow227TriangleData1776.coefficient156_178,
  OriginalRow227TriangleData1776.coefficient156_179,
  OriginalRow227TriangleData1776.coefficient156_180,
  OriginalRow227TriangleData1776.coefficient156_181,
  OriginalRow227TriangleData1776.coefficient156_182,
  OriginalRow227TriangleData1776.coefficient156_183,
  OriginalRow227TriangleData1776.coefficient156_184,
  OriginalRow227TriangleData1776.coefficient156_185,
  OriginalRow227TriangleData1776.coefficient156_186
]

theorem values1776_size : values1776.size = 32 := rfl

def block1776 : ℕ → Option IntervalDyadic := segment 155 values1776

theorem block1776_domain : ExactDomain block1776 155 187 := by
  simpa only [values1776_size] using segment_domain 155 values1776

theorem block1776_get (i : Fin 32) :
    block1776 (155 + i.val) = some (values1776[i.val]'(by rw [values1776_size]; exact i.isLt)) := by
  exact segment_get 155 values1776 ⟨i.val, by rw [values1776_size]; exact i.isLt⟩

def values1777 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1777.coefficient156_187,
  OriginalRow227TriangleData1777.coefficient156_188,
  OriginalRow227TriangleData1777.coefficient156_189,
  OriginalRow227TriangleData1777.coefficient156_190,
  OriginalRow227TriangleData1777.coefficient156_191,
  OriginalRow227TriangleData1777.coefficient156_192,
  OriginalRow227TriangleData1777.coefficient156_193,
  OriginalRow227TriangleData1777.coefficient156_194,
  OriginalRow227TriangleData1777.coefficient156_195,
  OriginalRow227TriangleData1777.coefficient156_196,
  OriginalRow227TriangleData1777.coefficient156_197,
  OriginalRow227TriangleData1777.coefficient156_198,
  OriginalRow227TriangleData1777.coefficient156_199,
  OriginalRow227TriangleData1777.coefficient156_200,
  OriginalRow227TriangleData1777.coefficient156_201,
  OriginalRow227TriangleData1777.coefficient156_202,
  OriginalRow227TriangleData1777.coefficient156_203,
  OriginalRow227TriangleData1777.coefficient156_204,
  OriginalRow227TriangleData1777.coefficient156_205,
  OriginalRow227TriangleData1777.coefficient156_206,
  OriginalRow227TriangleData1777.coefficient156_207,
  OriginalRow227TriangleData1777.coefficient156_208,
  OriginalRow227TriangleData1777.coefficient156_209,
  OriginalRow227TriangleData1777.coefficient156_210,
  OriginalRow227TriangleData1777.coefficient156_211,
  OriginalRow227TriangleData1777.coefficient156_212,
  OriginalRow227TriangleData1777.coefficient156_213,
  OriginalRow227TriangleData1777.coefficient156_214,
  OriginalRow227TriangleData1777.coefficient156_215,
  OriginalRow227TriangleData1777.coefficient156_216,
  OriginalRow227TriangleData1777.coefficient156_217,
  OriginalRow227TriangleData1777.coefficient156_218
]

theorem values1777_size : values1777.size = 32 := rfl

def block1777 : ℕ → Option IntervalDyadic := segment 187 values1777

theorem block1777_domain : ExactDomain block1777 187 219 := by
  simpa only [values1777_size] using segment_domain 187 values1777

theorem block1777_get (i : Fin 32) :
    block1777 (187 + i.val) = some (values1777[i.val]'(by rw [values1777_size]; exact i.isLt)) := by
  exact segment_get 187 values1777 ⟨i.val, by rw [values1777_size]; exact i.isLt⟩

def values1778 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1778.coefficient156_219,
  OriginalRow227TriangleData1778.coefficient156_220,
  OriginalRow227TriangleData1778.coefficient156_221,
  OriginalRow227TriangleData1778.coefficient156_222,
  OriginalRow227TriangleData1778.coefficient156_223,
  OriginalRow227TriangleData1778.coefficient156_224,
  OriginalRow227TriangleData1778.coefficient156_225,
  OriginalRow227TriangleData1778.coefficient156_226,
  OriginalRow227TriangleData1778.coefficient156_227,
  OriginalRow227TriangleData1778.coefficient156_228,
  OriginalRow227TriangleData1778.coefficient156_229,
  OriginalRow227TriangleData1778.coefficient156_230,
  OriginalRow227TriangleData1778.coefficient156_231,
  OriginalRow227TriangleData1778.coefficient156_232,
  OriginalRow227TriangleData1778.coefficient156_233,
  OriginalRow227TriangleData1778.coefficient156_234,
  OriginalRow227TriangleData1778.coefficient156_235,
  OriginalRow227TriangleData1778.coefficient156_236,
  OriginalRow227TriangleData1778.coefficient156_237,
  OriginalRow227TriangleData1778.coefficient156_238,
  OriginalRow227TriangleData1778.coefficient156_239,
  OriginalRow227TriangleData1778.coefficient156_240,
  OriginalRow227TriangleData1778.coefficient156_241,
  OriginalRow227TriangleData1778.coefficient156_242,
  OriginalRow227TriangleData1778.coefficient156_243,
  OriginalRow227TriangleData1778.coefficient156_244,
  OriginalRow227TriangleData1778.coefficient156_245,
  OriginalRow227TriangleData1778.coefficient156_246,
  OriginalRow227TriangleData1778.coefficient156_247,
  OriginalRow227TriangleData1778.coefficient156_248,
  OriginalRow227TriangleData1778.coefficient156_249,
  OriginalRow227TriangleData1778.coefficient156_250
]

theorem values1778_size : values1778.size = 32 := rfl

def block1778 : ℕ → Option IntervalDyadic := segment 219 values1778

theorem block1778_domain : ExactDomain block1778 219 251 := by
  simpa only [values1778_size] using segment_domain 219 values1778

theorem block1778_get (i : Fin 32) :
    block1778 (219 + i.val) = some (values1778[i.val]'(by rw [values1778_size]; exact i.isLt)) := by
  exact segment_get 219 values1778 ⟨i.val, by rw [values1778_size]; exact i.isLt⟩

def values1779 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1779.coefficient156_251,
  OriginalRow227TriangleData1779.coefficient156_252,
  OriginalRow227TriangleData1779.coefficient156_253,
  OriginalRow227TriangleData1779.coefficient156_254,
  OriginalRow227TriangleData1779.coefficient156_255,
  OriginalRow227TriangleData1779.coefficient156_256,
  OriginalRow227TriangleData1779.coefficient156_257,
  OriginalRow227TriangleData1779.coefficient156_258,
  OriginalRow227TriangleData1779.coefficient156_259,
  OriginalRow227TriangleData1779.coefficient156_260,
  OriginalRow227TriangleData1779.coefficient156_261,
  OriginalRow227TriangleData1779.coefficient156_262,
  OriginalRow227TriangleData1779.coefficient156_263,
  OriginalRow227TriangleData1779.coefficient156_264,
  OriginalRow227TriangleData1779.coefficient156_265,
  OriginalRow227TriangleData1779.coefficient156_266,
  OriginalRow227TriangleData1779.coefficient156_267,
  OriginalRow227TriangleData1779.coefficient156_268,
  OriginalRow227TriangleData1779.coefficient156_269,
  OriginalRow227TriangleData1779.coefficient156_270,
  OriginalRow227TriangleData1779.coefficient156_271,
  OriginalRow227TriangleData1779.coefficient156_272,
  OriginalRow227TriangleData1779.coefficient156_273,
  OriginalRow227TriangleData1779.coefficient156_274,
  OriginalRow227TriangleData1779.coefficient156_275,
  OriginalRow227TriangleData1779.coefficient156_276,
  OriginalRow227TriangleData1779.coefficient156_277,
  OriginalRow227TriangleData1779.coefficient156_278,
  OriginalRow227TriangleData1779.coefficient156_279,
  OriginalRow227TriangleData1779.coefficient156_280,
  OriginalRow227TriangleData1779.coefficient156_281,
  OriginalRow227TriangleData1779.coefficient156_282
]

theorem values1779_size : values1779.size = 32 := rfl

def block1779 : ℕ → Option IntervalDyadic := segment 251 values1779

theorem block1779_domain : ExactDomain block1779 251 283 := by
  simpa only [values1779_size] using segment_domain 251 values1779

theorem block1779_get (i : Fin 32) :
    block1779 (251 + i.val) = some (values1779[i.val]'(by rw [values1779_size]; exact i.isLt)) := by
  exact segment_get 251 values1779 ⟨i.val, by rw [values1779_size]; exact i.isLt⟩

def values1780 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1780.coefficient156_283,
  OriginalRow227TriangleData1780.coefficient156_284,
  OriginalRow227TriangleData1780.coefficient156_285,
  OriginalRow227TriangleData1780.coefficient156_286,
  OriginalRow227TriangleData1780.coefficient156_287,
  OriginalRow227TriangleData1780.coefficient156_288,
  OriginalRow227TriangleData1780.coefficient156_289,
  OriginalRow227TriangleData1780.coefficient156_290,
  OriginalRow227TriangleData1780.coefficient156_291,
  OriginalRow227TriangleData1780.coefficient156_292,
  OriginalRow227TriangleData1780.coefficient156_293,
  OriginalRow227TriangleData1780.coefficient156_294,
  OriginalRow227TriangleData1780.coefficient156_295,
  OriginalRow227TriangleData1780.coefficient156_296,
  OriginalRow227TriangleData1780.coefficient156_297,
  OriginalRow227TriangleData1780.coefficient156_298,
  OriginalRow227TriangleData1780.coefficient156_299,
  OriginalRow227TriangleData1780.coefficient156_300,
  OriginalRow227TriangleData1780.coefficient156_301,
  OriginalRow227TriangleData1780.coefficient156_302,
  OriginalRow227TriangleData1780.coefficient156_303,
  OriginalRow227TriangleData1780.coefficient156_304,
  OriginalRow227TriangleData1780.coefficient156_305,
  OriginalRow227TriangleData1780.coefficient156_306,
  OriginalRow227TriangleData1780.coefficient156_307,
  OriginalRow227TriangleData1780.coefficient156_308,
  OriginalRow227TriangleData1780.coefficient156_309,
  OriginalRow227TriangleData1780.coefficient156_310,
  OriginalRow227TriangleData1780.coefficient156_311,
  OriginalRow227TriangleData1780.coefficient156_312,
  OriginalRow227TriangleData1780.coefficient156_313,
  OriginalRow227TriangleData1780.coefficient156_314
]

theorem values1780_size : values1780.size = 32 := rfl

def block1780 : ℕ → Option IntervalDyadic := segment 283 values1780

theorem block1780_domain : ExactDomain block1780 283 315 := by
  simpa only [values1780_size] using segment_domain 283 values1780

theorem block1780_get (i : Fin 32) :
    block1780 (283 + i.val) = some (values1780[i.val]'(by rw [values1780_size]; exact i.isLt)) := by
  exact segment_get 283 values1780 ⟨i.val, by rw [values1780_size]; exact i.isLt⟩

def values1781 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1781.coefficient156_315,
  OriginalRow227TriangleData1781.coefficient156_316,
  OriginalRow227TriangleData1781.coefficient156_317,
  OriginalRow227TriangleData1781.coefficient156_318,
  OriginalRow227TriangleData1781.coefficient156_319,
  OriginalRow227TriangleData1781.coefficient156_320,
  OriginalRow227TriangleData1781.coefficient156_321,
  OriginalRow227TriangleData1781.coefficient156_322,
  OriginalRow227TriangleData1781.coefficient156_323,
  OriginalRow227TriangleData1781.coefficient156_324,
  OriginalRow227TriangleData1781.coefficient156_325,
  OriginalRow227TriangleData1781.coefficient156_326,
  OriginalRow227TriangleData1781.coefficient156_327,
  OriginalRow227TriangleData1781.coefficient156_328,
  OriginalRow227TriangleData1781.coefficient156_329,
  OriginalRow227TriangleData1781.coefficient156_330,
  OriginalRow227TriangleData1781.coefficient156_331,
  OriginalRow227TriangleData1781.coefficient156_332,
  OriginalRow227TriangleData1781.coefficient156_333,
  OriginalRow227TriangleData1781.coefficient156_334,
  OriginalRow227TriangleData1781.coefficient156_335,
  OriginalRow227TriangleData1781.coefficient156_336,
  OriginalRow227TriangleData1781.coefficient156_337,
  OriginalRow227TriangleData1781.coefficient156_338,
  OriginalRow227TriangleData1781.coefficient156_339,
  OriginalRow227TriangleData1781.coefficient156_340,
  OriginalRow227TriangleData1781.coefficient156_341,
  OriginalRow227TriangleData1781.coefficient156_342,
  OriginalRow227TriangleData1781.coefficient156_343,
  OriginalRow227TriangleData1781.coefficient156_344,
  OriginalRow227TriangleData1781.coefficient156_345
]

theorem values1781_size : values1781.size = 31 := rfl

def block1781 : ℕ → Option IntervalDyadic := segment 315 values1781

theorem block1781_domain : ExactDomain block1781 315 346 := by
  simpa only [values1781_size] using segment_domain 315 values1781

theorem block1781_get (i : Fin 31) :
    block1781 (315 + i.val) = some (values1781[i.val]'(by rw [values1781_size]; exact i.isLt)) := by
  exact segment_get 315 values1781 ⟨i.val, by rw [values1781_size]; exact i.isLt⟩

def node0187_0251 : ℕ → Option IntervalDyadic := split 219 block1777 block1778

theorem node0187_0251_domain : ExactDomain node0187_0251 187 251 := by
  exact split_domain (by decide) (by decide) block1777_domain block1778_domain

def node0155_0251 : ℕ → Option IntervalDyadic := split 187 block1776 node0187_0251

theorem node0155_0251_domain : ExactDomain node0155_0251 155 251 := by
  exact split_domain (by decide) (by decide) block1776_domain node0187_0251_domain

def node0283_0346 : ℕ → Option IntervalDyadic := split 315 block1780 block1781

theorem node0283_0346_domain : ExactDomain node0283_0346 283 346 := by
  exact split_domain (by decide) (by decide) block1780_domain block1781_domain

def node0251_0346 : ℕ → Option IntervalDyadic := split 283 block1779 node0283_0346

theorem node0251_0346_domain : ExactDomain node0251_0346 251 346 := by
  exact split_domain (by decide) (by decide) block1779_domain node0283_0346_domain

def node0155_0346 : ℕ → Option IntervalDyadic := split 251 node0155_0251 node0251_0346

theorem node0155_0346_domain : ExactDomain node0155_0346 155 346 := by
  exact split_domain (by decide) (by decide) node0155_0251_domain node0251_0346_domain

def lookup : ℕ → Option IntervalDyadic := node0155_0346

theorem lookup_domain : ExactDomain lookup 155 346 :=
  node0155_0346_domain

theorem block1776_lookup (i : Fin 32) :
    lookup (155 + i.val) = some (values1776[i.val]'(by rw [values1776_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0155_0346 (155 + i.val) = _
  rw [node0155_0346, split_left 251 node0155_0251 node0251_0346 (by omega)]
  rw [node0155_0251, split_left 187 block1776 node0187_0251 (by omega)]
  exact block1776_get i

theorem block1777_lookup (i : Fin 32) :
    lookup (187 + i.val) = some (values1777[i.val]'(by rw [values1777_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0155_0346 (187 + i.val) = _
  rw [node0155_0346, split_left 251 node0155_0251 node0251_0346 (by omega)]
  rw [node0155_0251, split_right 187 block1776 node0187_0251 (by omega)]
  rw [node0187_0251, split_left 219 block1777 block1778 (by omega)]
  exact block1777_get i

theorem block1778_lookup (i : Fin 32) :
    lookup (219 + i.val) = some (values1778[i.val]'(by rw [values1778_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0155_0346 (219 + i.val) = _
  rw [node0155_0346, split_left 251 node0155_0251 node0251_0346 (by omega)]
  rw [node0155_0251, split_right 187 block1776 node0187_0251 (by omega)]
  rw [node0187_0251, split_right 219 block1777 block1778 (by omega)]
  exact block1778_get i

theorem block1779_lookup (i : Fin 32) :
    lookup (251 + i.val) = some (values1779[i.val]'(by rw [values1779_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0155_0346 (251 + i.val) = _
  rw [node0155_0346, split_right 251 node0155_0251 node0251_0346 (by omega)]
  rw [node0251_0346, split_left 283 block1779 node0283_0346 (by omega)]
  exact block1779_get i

theorem block1780_lookup (i : Fin 32) :
    lookup (283 + i.val) = some (values1780[i.val]'(by rw [values1780_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0155_0346 (283 + i.val) = _
  rw [node0155_0346, split_right 251 node0155_0251 node0251_0346 (by omega)]
  rw [node0251_0346, split_right 283 block1779 node0283_0346 (by omega)]
  rw [node0283_0346, split_left 315 block1780 block1781 (by omega)]
  exact block1780_get i

theorem block1781_lookup (i : Fin 31) :
    lookup (315 + i.val) = some (values1781[i.val]'(by rw [values1781_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0155_0346 (315 + i.val) = _
  rw [node0155_0346, split_right 251 node0155_0251 node0251_0346 (by omega)]
  rw [node0251_0346, split_right 283 block1779 node0283_0346 (by omega)]
  rw [node0283_0346, split_right 315 block1780 block1781 (by omega)]
  exact block1781_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1776_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1776_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1777_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1777_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1778_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1778_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1779_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1779_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1780_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1780_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1781_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1781_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1776_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1777_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1778_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1779_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1780_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow156.block1781_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow156
