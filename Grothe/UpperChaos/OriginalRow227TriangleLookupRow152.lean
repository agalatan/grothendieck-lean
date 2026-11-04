import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1748
import Grothe.UpperChaos.OriginalRow227TriangleData1749
import Grothe.UpperChaos.OriginalRow227TriangleData1750
import Grothe.UpperChaos.OriginalRow227TriangleData1751
import Grothe.UpperChaos.OriginalRow227TriangleData1752
import Grothe.UpperChaos.OriginalRow227TriangleData1753
import Grothe.UpperChaos.OriginalRow227TriangleData1754

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow152

open ConditionalTableLookup

def values1748 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1748.coefficient152_151,
  OriginalRow227TriangleData1748.coefficient152_152,
  OriginalRow227TriangleData1748.coefficient152_153,
  OriginalRow227TriangleData1748.coefficient152_154,
  OriginalRow227TriangleData1748.coefficient152_155,
  OriginalRow227TriangleData1748.coefficient152_156,
  OriginalRow227TriangleData1748.coefficient152_157,
  OriginalRow227TriangleData1748.coefficient152_158,
  OriginalRow227TriangleData1748.coefficient152_159,
  OriginalRow227TriangleData1748.coefficient152_160,
  OriginalRow227TriangleData1748.coefficient152_161,
  OriginalRow227TriangleData1748.coefficient152_162,
  OriginalRow227TriangleData1748.coefficient152_163,
  OriginalRow227TriangleData1748.coefficient152_164,
  OriginalRow227TriangleData1748.coefficient152_165,
  OriginalRow227TriangleData1748.coefficient152_166,
  OriginalRow227TriangleData1748.coefficient152_167,
  OriginalRow227TriangleData1748.coefficient152_168,
  OriginalRow227TriangleData1748.coefficient152_169,
  OriginalRow227TriangleData1748.coefficient152_170,
  OriginalRow227TriangleData1748.coefficient152_171,
  OriginalRow227TriangleData1748.coefficient152_172,
  OriginalRow227TriangleData1748.coefficient152_173,
  OriginalRow227TriangleData1748.coefficient152_174,
  OriginalRow227TriangleData1748.coefficient152_175,
  OriginalRow227TriangleData1748.coefficient152_176,
  OriginalRow227TriangleData1748.coefficient152_177,
  OriginalRow227TriangleData1748.coefficient152_178,
  OriginalRow227TriangleData1748.coefficient152_179,
  OriginalRow227TriangleData1748.coefficient152_180,
  OriginalRow227TriangleData1748.coefficient152_181,
  OriginalRow227TriangleData1748.coefficient152_182
]

theorem values1748_size : values1748.size = 32 := rfl

def block1748 : ℕ → Option IntervalDyadic := segment 151 values1748

theorem block1748_domain : ExactDomain block1748 151 183 := by
  simpa only [values1748_size] using segment_domain 151 values1748

theorem block1748_get (i : Fin 32) :
    block1748 (151 + i.val) = some (values1748[i.val]'(by rw [values1748_size]; exact i.isLt)) := by
  exact segment_get 151 values1748 ⟨i.val, by rw [values1748_size]; exact i.isLt⟩

def values1749 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1749.coefficient152_183,
  OriginalRow227TriangleData1749.coefficient152_184,
  OriginalRow227TriangleData1749.coefficient152_185,
  OriginalRow227TriangleData1749.coefficient152_186,
  OriginalRow227TriangleData1749.coefficient152_187,
  OriginalRow227TriangleData1749.coefficient152_188,
  OriginalRow227TriangleData1749.coefficient152_189,
  OriginalRow227TriangleData1749.coefficient152_190,
  OriginalRow227TriangleData1749.coefficient152_191,
  OriginalRow227TriangleData1749.coefficient152_192,
  OriginalRow227TriangleData1749.coefficient152_193,
  OriginalRow227TriangleData1749.coefficient152_194,
  OriginalRow227TriangleData1749.coefficient152_195,
  OriginalRow227TriangleData1749.coefficient152_196,
  OriginalRow227TriangleData1749.coefficient152_197,
  OriginalRow227TriangleData1749.coefficient152_198,
  OriginalRow227TriangleData1749.coefficient152_199,
  OriginalRow227TriangleData1749.coefficient152_200,
  OriginalRow227TriangleData1749.coefficient152_201,
  OriginalRow227TriangleData1749.coefficient152_202,
  OriginalRow227TriangleData1749.coefficient152_203,
  OriginalRow227TriangleData1749.coefficient152_204,
  OriginalRow227TriangleData1749.coefficient152_205,
  OriginalRow227TriangleData1749.coefficient152_206,
  OriginalRow227TriangleData1749.coefficient152_207,
  OriginalRow227TriangleData1749.coefficient152_208,
  OriginalRow227TriangleData1749.coefficient152_209,
  OriginalRow227TriangleData1749.coefficient152_210,
  OriginalRow227TriangleData1749.coefficient152_211,
  OriginalRow227TriangleData1749.coefficient152_212,
  OriginalRow227TriangleData1749.coefficient152_213,
  OriginalRow227TriangleData1749.coefficient152_214
]

theorem values1749_size : values1749.size = 32 := rfl

def block1749 : ℕ → Option IntervalDyadic := segment 183 values1749

theorem block1749_domain : ExactDomain block1749 183 215 := by
  simpa only [values1749_size] using segment_domain 183 values1749

theorem block1749_get (i : Fin 32) :
    block1749 (183 + i.val) = some (values1749[i.val]'(by rw [values1749_size]; exact i.isLt)) := by
  exact segment_get 183 values1749 ⟨i.val, by rw [values1749_size]; exact i.isLt⟩

def values1750 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1750.coefficient152_215,
  OriginalRow227TriangleData1750.coefficient152_216,
  OriginalRow227TriangleData1750.coefficient152_217,
  OriginalRow227TriangleData1750.coefficient152_218,
  OriginalRow227TriangleData1750.coefficient152_219,
  OriginalRow227TriangleData1750.coefficient152_220,
  OriginalRow227TriangleData1750.coefficient152_221,
  OriginalRow227TriangleData1750.coefficient152_222,
  OriginalRow227TriangleData1750.coefficient152_223,
  OriginalRow227TriangleData1750.coefficient152_224,
  OriginalRow227TriangleData1750.coefficient152_225,
  OriginalRow227TriangleData1750.coefficient152_226,
  OriginalRow227TriangleData1750.coefficient152_227,
  OriginalRow227TriangleData1750.coefficient152_228,
  OriginalRow227TriangleData1750.coefficient152_229,
  OriginalRow227TriangleData1750.coefficient152_230,
  OriginalRow227TriangleData1750.coefficient152_231,
  OriginalRow227TriangleData1750.coefficient152_232,
  OriginalRow227TriangleData1750.coefficient152_233,
  OriginalRow227TriangleData1750.coefficient152_234,
  OriginalRow227TriangleData1750.coefficient152_235,
  OriginalRow227TriangleData1750.coefficient152_236,
  OriginalRow227TriangleData1750.coefficient152_237,
  OriginalRow227TriangleData1750.coefficient152_238,
  OriginalRow227TriangleData1750.coefficient152_239,
  OriginalRow227TriangleData1750.coefficient152_240,
  OriginalRow227TriangleData1750.coefficient152_241,
  OriginalRow227TriangleData1750.coefficient152_242,
  OriginalRow227TriangleData1750.coefficient152_243,
  OriginalRow227TriangleData1750.coefficient152_244,
  OriginalRow227TriangleData1750.coefficient152_245,
  OriginalRow227TriangleData1750.coefficient152_246
]

theorem values1750_size : values1750.size = 32 := rfl

def block1750 : ℕ → Option IntervalDyadic := segment 215 values1750

theorem block1750_domain : ExactDomain block1750 215 247 := by
  simpa only [values1750_size] using segment_domain 215 values1750

theorem block1750_get (i : Fin 32) :
    block1750 (215 + i.val) = some (values1750[i.val]'(by rw [values1750_size]; exact i.isLt)) := by
  exact segment_get 215 values1750 ⟨i.val, by rw [values1750_size]; exact i.isLt⟩

def values1751 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1751.coefficient152_247,
  OriginalRow227TriangleData1751.coefficient152_248,
  OriginalRow227TriangleData1751.coefficient152_249,
  OriginalRow227TriangleData1751.coefficient152_250,
  OriginalRow227TriangleData1751.coefficient152_251,
  OriginalRow227TriangleData1751.coefficient152_252,
  OriginalRow227TriangleData1751.coefficient152_253,
  OriginalRow227TriangleData1751.coefficient152_254,
  OriginalRow227TriangleData1751.coefficient152_255,
  OriginalRow227TriangleData1751.coefficient152_256,
  OriginalRow227TriangleData1751.coefficient152_257,
  OriginalRow227TriangleData1751.coefficient152_258,
  OriginalRow227TriangleData1751.coefficient152_259,
  OriginalRow227TriangleData1751.coefficient152_260,
  OriginalRow227TriangleData1751.coefficient152_261,
  OriginalRow227TriangleData1751.coefficient152_262,
  OriginalRow227TriangleData1751.coefficient152_263,
  OriginalRow227TriangleData1751.coefficient152_264,
  OriginalRow227TriangleData1751.coefficient152_265,
  OriginalRow227TriangleData1751.coefficient152_266,
  OriginalRow227TriangleData1751.coefficient152_267,
  OriginalRow227TriangleData1751.coefficient152_268,
  OriginalRow227TriangleData1751.coefficient152_269,
  OriginalRow227TriangleData1751.coefficient152_270,
  OriginalRow227TriangleData1751.coefficient152_271,
  OriginalRow227TriangleData1751.coefficient152_272,
  OriginalRow227TriangleData1751.coefficient152_273,
  OriginalRow227TriangleData1751.coefficient152_274,
  OriginalRow227TriangleData1751.coefficient152_275,
  OriginalRow227TriangleData1751.coefficient152_276,
  OriginalRow227TriangleData1751.coefficient152_277,
  OriginalRow227TriangleData1751.coefficient152_278
]

theorem values1751_size : values1751.size = 32 := rfl

def block1751 : ℕ → Option IntervalDyadic := segment 247 values1751

theorem block1751_domain : ExactDomain block1751 247 279 := by
  simpa only [values1751_size] using segment_domain 247 values1751

theorem block1751_get (i : Fin 32) :
    block1751 (247 + i.val) = some (values1751[i.val]'(by rw [values1751_size]; exact i.isLt)) := by
  exact segment_get 247 values1751 ⟨i.val, by rw [values1751_size]; exact i.isLt⟩

def values1752 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1752.coefficient152_279,
  OriginalRow227TriangleData1752.coefficient152_280,
  OriginalRow227TriangleData1752.coefficient152_281,
  OriginalRow227TriangleData1752.coefficient152_282,
  OriginalRow227TriangleData1752.coefficient152_283,
  OriginalRow227TriangleData1752.coefficient152_284,
  OriginalRow227TriangleData1752.coefficient152_285,
  OriginalRow227TriangleData1752.coefficient152_286,
  OriginalRow227TriangleData1752.coefficient152_287,
  OriginalRow227TriangleData1752.coefficient152_288,
  OriginalRow227TriangleData1752.coefficient152_289,
  OriginalRow227TriangleData1752.coefficient152_290,
  OriginalRow227TriangleData1752.coefficient152_291,
  OriginalRow227TriangleData1752.coefficient152_292,
  OriginalRow227TriangleData1752.coefficient152_293,
  OriginalRow227TriangleData1752.coefficient152_294,
  OriginalRow227TriangleData1752.coefficient152_295,
  OriginalRow227TriangleData1752.coefficient152_296,
  OriginalRow227TriangleData1752.coefficient152_297,
  OriginalRow227TriangleData1752.coefficient152_298,
  OriginalRow227TriangleData1752.coefficient152_299,
  OriginalRow227TriangleData1752.coefficient152_300,
  OriginalRow227TriangleData1752.coefficient152_301,
  OriginalRow227TriangleData1752.coefficient152_302,
  OriginalRow227TriangleData1752.coefficient152_303,
  OriginalRow227TriangleData1752.coefficient152_304,
  OriginalRow227TriangleData1752.coefficient152_305,
  OriginalRow227TriangleData1752.coefficient152_306,
  OriginalRow227TriangleData1752.coefficient152_307,
  OriginalRow227TriangleData1752.coefficient152_308,
  OriginalRow227TriangleData1752.coefficient152_309,
  OriginalRow227TriangleData1752.coefficient152_310
]

theorem values1752_size : values1752.size = 32 := rfl

def block1752 : ℕ → Option IntervalDyadic := segment 279 values1752

theorem block1752_domain : ExactDomain block1752 279 311 := by
  simpa only [values1752_size] using segment_domain 279 values1752

theorem block1752_get (i : Fin 32) :
    block1752 (279 + i.val) = some (values1752[i.val]'(by rw [values1752_size]; exact i.isLt)) := by
  exact segment_get 279 values1752 ⟨i.val, by rw [values1752_size]; exact i.isLt⟩

def values1753 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1753.coefficient152_311,
  OriginalRow227TriangleData1753.coefficient152_312,
  OriginalRow227TriangleData1753.coefficient152_313,
  OriginalRow227TriangleData1753.coefficient152_314,
  OriginalRow227TriangleData1753.coefficient152_315,
  OriginalRow227TriangleData1753.coefficient152_316,
  OriginalRow227TriangleData1753.coefficient152_317,
  OriginalRow227TriangleData1753.coefficient152_318,
  OriginalRow227TriangleData1753.coefficient152_319,
  OriginalRow227TriangleData1753.coefficient152_320,
  OriginalRow227TriangleData1753.coefficient152_321,
  OriginalRow227TriangleData1753.coefficient152_322,
  OriginalRow227TriangleData1753.coefficient152_323,
  OriginalRow227TriangleData1753.coefficient152_324,
  OriginalRow227TriangleData1753.coefficient152_325,
  OriginalRow227TriangleData1753.coefficient152_326,
  OriginalRow227TriangleData1753.coefficient152_327,
  OriginalRow227TriangleData1753.coefficient152_328,
  OriginalRow227TriangleData1753.coefficient152_329,
  OriginalRow227TriangleData1753.coefficient152_330,
  OriginalRow227TriangleData1753.coefficient152_331,
  OriginalRow227TriangleData1753.coefficient152_332,
  OriginalRow227TriangleData1753.coefficient152_333,
  OriginalRow227TriangleData1753.coefficient152_334,
  OriginalRow227TriangleData1753.coefficient152_335,
  OriginalRow227TriangleData1753.coefficient152_336,
  OriginalRow227TriangleData1753.coefficient152_337,
  OriginalRow227TriangleData1753.coefficient152_338,
  OriginalRow227TriangleData1753.coefficient152_339,
  OriginalRow227TriangleData1753.coefficient152_340,
  OriginalRow227TriangleData1753.coefficient152_341,
  OriginalRow227TriangleData1753.coefficient152_342
]

theorem values1753_size : values1753.size = 32 := rfl

def block1753 : ℕ → Option IntervalDyadic := segment 311 values1753

theorem block1753_domain : ExactDomain block1753 311 343 := by
  simpa only [values1753_size] using segment_domain 311 values1753

theorem block1753_get (i : Fin 32) :
    block1753 (311 + i.val) = some (values1753[i.val]'(by rw [values1753_size]; exact i.isLt)) := by
  exact segment_get 311 values1753 ⟨i.val, by rw [values1753_size]; exact i.isLt⟩

def values1754 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1754.coefficient152_343,
  OriginalRow227TriangleData1754.coefficient152_344,
  OriginalRow227TriangleData1754.coefficient152_345,
  OriginalRow227TriangleData1754.coefficient152_346,
  OriginalRow227TriangleData1754.coefficient152_347,
  OriginalRow227TriangleData1754.coefficient152_348,
  OriginalRow227TriangleData1754.coefficient152_349
]

theorem values1754_size : values1754.size = 7 := rfl

def block1754 : ℕ → Option IntervalDyadic := segment 343 values1754

theorem block1754_domain : ExactDomain block1754 343 350 := by
  simpa only [values1754_size] using segment_domain 343 values1754

theorem block1754_get (i : Fin 7) :
    block1754 (343 + i.val) = some (values1754[i.val]'(by rw [values1754_size]; exact i.isLt)) := by
  exact segment_get 343 values1754 ⟨i.val, by rw [values1754_size]; exact i.isLt⟩

def node0183_0247 : ℕ → Option IntervalDyadic := split 215 block1749 block1750

theorem node0183_0247_domain : ExactDomain node0183_0247 183 247 := by
  exact split_domain (by decide) (by decide) block1749_domain block1750_domain

def node0151_0247 : ℕ → Option IntervalDyadic := split 183 block1748 node0183_0247

theorem node0151_0247_domain : ExactDomain node0151_0247 151 247 := by
  exact split_domain (by decide) (by decide) block1748_domain node0183_0247_domain

def node0247_0311 : ℕ → Option IntervalDyadic := split 279 block1751 block1752

theorem node0247_0311_domain : ExactDomain node0247_0311 247 311 := by
  exact split_domain (by decide) (by decide) block1751_domain block1752_domain

def node0311_0350 : ℕ → Option IntervalDyadic := split 343 block1753 block1754

theorem node0311_0350_domain : ExactDomain node0311_0350 311 350 := by
  exact split_domain (by decide) (by decide) block1753_domain block1754_domain

def node0247_0350 : ℕ → Option IntervalDyadic := split 311 node0247_0311 node0311_0350

theorem node0247_0350_domain : ExactDomain node0247_0350 247 350 := by
  exact split_domain (by decide) (by decide) node0247_0311_domain node0311_0350_domain

def node0151_0350 : ℕ → Option IntervalDyadic := split 247 node0151_0247 node0247_0350

theorem node0151_0350_domain : ExactDomain node0151_0350 151 350 := by
  exact split_domain (by decide) (by decide) node0151_0247_domain node0247_0350_domain

def lookup : ℕ → Option IntervalDyadic := node0151_0350

theorem lookup_domain : ExactDomain lookup 151 350 :=
  node0151_0350_domain

theorem block1748_lookup (i : Fin 32) :
    lookup (151 + i.val) = some (values1748[i.val]'(by rw [values1748_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0151_0350 (151 + i.val) = _
  rw [node0151_0350, split_left 247 node0151_0247 node0247_0350 (by omega)]
  rw [node0151_0247, split_left 183 block1748 node0183_0247 (by omega)]
  exact block1748_get i

theorem block1749_lookup (i : Fin 32) :
    lookup (183 + i.val) = some (values1749[i.val]'(by rw [values1749_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0151_0350 (183 + i.val) = _
  rw [node0151_0350, split_left 247 node0151_0247 node0247_0350 (by omega)]
  rw [node0151_0247, split_right 183 block1748 node0183_0247 (by omega)]
  rw [node0183_0247, split_left 215 block1749 block1750 (by omega)]
  exact block1749_get i

theorem block1750_lookup (i : Fin 32) :
    lookup (215 + i.val) = some (values1750[i.val]'(by rw [values1750_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0151_0350 (215 + i.val) = _
  rw [node0151_0350, split_left 247 node0151_0247 node0247_0350 (by omega)]
  rw [node0151_0247, split_right 183 block1748 node0183_0247 (by omega)]
  rw [node0183_0247, split_right 215 block1749 block1750 (by omega)]
  exact block1750_get i

theorem block1751_lookup (i : Fin 32) :
    lookup (247 + i.val) = some (values1751[i.val]'(by rw [values1751_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0151_0350 (247 + i.val) = _
  rw [node0151_0350, split_right 247 node0151_0247 node0247_0350 (by omega)]
  rw [node0247_0350, split_left 311 node0247_0311 node0311_0350 (by omega)]
  rw [node0247_0311, split_left 279 block1751 block1752 (by omega)]
  exact block1751_get i

theorem block1752_lookup (i : Fin 32) :
    lookup (279 + i.val) = some (values1752[i.val]'(by rw [values1752_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0151_0350 (279 + i.val) = _
  rw [node0151_0350, split_right 247 node0151_0247 node0247_0350 (by omega)]
  rw [node0247_0350, split_left 311 node0247_0311 node0311_0350 (by omega)]
  rw [node0247_0311, split_right 279 block1751 block1752 (by omega)]
  exact block1752_get i

theorem block1753_lookup (i : Fin 32) :
    lookup (311 + i.val) = some (values1753[i.val]'(by rw [values1753_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0151_0350 (311 + i.val) = _
  rw [node0151_0350, split_right 247 node0151_0247 node0247_0350 (by omega)]
  rw [node0247_0350, split_right 311 node0247_0311 node0311_0350 (by omega)]
  rw [node0311_0350, split_left 343 block1753 block1754 (by omega)]
  exact block1753_get i

theorem block1754_lookup (i : Fin 7) :
    lookup (343 + i.val) = some (values1754[i.val]'(by rw [values1754_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0151_0350 (343 + i.val) = _
  rw [node0151_0350, split_right 247 node0151_0247 node0247_0350 (by omega)]
  rw [node0247_0350, split_right 311 node0247_0311 node0311_0350 (by omega)]
  rw [node0311_0350, split_right 343 block1753 block1754 (by omega)]
  exact block1754_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1748_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1748_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1749_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1749_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1750_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1750_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1751_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1751_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1752_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1752_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1753_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1753_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1754_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1754_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1748_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1749_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1750_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1751_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1752_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1753_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow152.block1754_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow152
