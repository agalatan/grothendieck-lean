import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1769
import Grothe.UpperChaos.OriginalRow227TriangleData1770
import Grothe.UpperChaos.OriginalRow227TriangleData1771
import Grothe.UpperChaos.OriginalRow227TriangleData1772
import Grothe.UpperChaos.OriginalRow227TriangleData1773
import Grothe.UpperChaos.OriginalRow227TriangleData1774
import Grothe.UpperChaos.OriginalRow227TriangleData1775

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow155

open ConditionalTableLookup

def values1769 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1769.coefficient155_154,
  OriginalRow227TriangleData1769.coefficient155_155,
  OriginalRow227TriangleData1769.coefficient155_156,
  OriginalRow227TriangleData1769.coefficient155_157,
  OriginalRow227TriangleData1769.coefficient155_158,
  OriginalRow227TriangleData1769.coefficient155_159,
  OriginalRow227TriangleData1769.coefficient155_160,
  OriginalRow227TriangleData1769.coefficient155_161,
  OriginalRow227TriangleData1769.coefficient155_162,
  OriginalRow227TriangleData1769.coefficient155_163,
  OriginalRow227TriangleData1769.coefficient155_164,
  OriginalRow227TriangleData1769.coefficient155_165,
  OriginalRow227TriangleData1769.coefficient155_166,
  OriginalRow227TriangleData1769.coefficient155_167,
  OriginalRow227TriangleData1769.coefficient155_168,
  OriginalRow227TriangleData1769.coefficient155_169,
  OriginalRow227TriangleData1769.coefficient155_170,
  OriginalRow227TriangleData1769.coefficient155_171,
  OriginalRow227TriangleData1769.coefficient155_172,
  OriginalRow227TriangleData1769.coefficient155_173,
  OriginalRow227TriangleData1769.coefficient155_174,
  OriginalRow227TriangleData1769.coefficient155_175,
  OriginalRow227TriangleData1769.coefficient155_176,
  OriginalRow227TriangleData1769.coefficient155_177,
  OriginalRow227TriangleData1769.coefficient155_178,
  OriginalRow227TriangleData1769.coefficient155_179,
  OriginalRow227TriangleData1769.coefficient155_180,
  OriginalRow227TriangleData1769.coefficient155_181,
  OriginalRow227TriangleData1769.coefficient155_182,
  OriginalRow227TriangleData1769.coefficient155_183,
  OriginalRow227TriangleData1769.coefficient155_184,
  OriginalRow227TriangleData1769.coefficient155_185
]

theorem values1769_size : values1769.size = 32 := rfl

def block1769 : ℕ → Option IntervalDyadic := segment 154 values1769

theorem block1769_domain : ExactDomain block1769 154 186 := by
  simpa only [values1769_size] using segment_domain 154 values1769

theorem block1769_get (i : Fin 32) :
    block1769 (154 + i.val) = some (values1769[i.val]'(by rw [values1769_size]; exact i.isLt)) := by
  exact segment_get 154 values1769 ⟨i.val, by rw [values1769_size]; exact i.isLt⟩

def values1770 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1770.coefficient155_186,
  OriginalRow227TriangleData1770.coefficient155_187,
  OriginalRow227TriangleData1770.coefficient155_188,
  OriginalRow227TriangleData1770.coefficient155_189,
  OriginalRow227TriangleData1770.coefficient155_190,
  OriginalRow227TriangleData1770.coefficient155_191,
  OriginalRow227TriangleData1770.coefficient155_192,
  OriginalRow227TriangleData1770.coefficient155_193,
  OriginalRow227TriangleData1770.coefficient155_194,
  OriginalRow227TriangleData1770.coefficient155_195,
  OriginalRow227TriangleData1770.coefficient155_196,
  OriginalRow227TriangleData1770.coefficient155_197,
  OriginalRow227TriangleData1770.coefficient155_198,
  OriginalRow227TriangleData1770.coefficient155_199,
  OriginalRow227TriangleData1770.coefficient155_200,
  OriginalRow227TriangleData1770.coefficient155_201,
  OriginalRow227TriangleData1770.coefficient155_202,
  OriginalRow227TriangleData1770.coefficient155_203,
  OriginalRow227TriangleData1770.coefficient155_204,
  OriginalRow227TriangleData1770.coefficient155_205,
  OriginalRow227TriangleData1770.coefficient155_206,
  OriginalRow227TriangleData1770.coefficient155_207,
  OriginalRow227TriangleData1770.coefficient155_208,
  OriginalRow227TriangleData1770.coefficient155_209,
  OriginalRow227TriangleData1770.coefficient155_210,
  OriginalRow227TriangleData1770.coefficient155_211,
  OriginalRow227TriangleData1770.coefficient155_212,
  OriginalRow227TriangleData1770.coefficient155_213,
  OriginalRow227TriangleData1770.coefficient155_214,
  OriginalRow227TriangleData1770.coefficient155_215,
  OriginalRow227TriangleData1770.coefficient155_216,
  OriginalRow227TriangleData1770.coefficient155_217
]

theorem values1770_size : values1770.size = 32 := rfl

def block1770 : ℕ → Option IntervalDyadic := segment 186 values1770

theorem block1770_domain : ExactDomain block1770 186 218 := by
  simpa only [values1770_size] using segment_domain 186 values1770

theorem block1770_get (i : Fin 32) :
    block1770 (186 + i.val) = some (values1770[i.val]'(by rw [values1770_size]; exact i.isLt)) := by
  exact segment_get 186 values1770 ⟨i.val, by rw [values1770_size]; exact i.isLt⟩

def values1771 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1771.coefficient155_218,
  OriginalRow227TriangleData1771.coefficient155_219,
  OriginalRow227TriangleData1771.coefficient155_220,
  OriginalRow227TriangleData1771.coefficient155_221,
  OriginalRow227TriangleData1771.coefficient155_222,
  OriginalRow227TriangleData1771.coefficient155_223,
  OriginalRow227TriangleData1771.coefficient155_224,
  OriginalRow227TriangleData1771.coefficient155_225,
  OriginalRow227TriangleData1771.coefficient155_226,
  OriginalRow227TriangleData1771.coefficient155_227,
  OriginalRow227TriangleData1771.coefficient155_228,
  OriginalRow227TriangleData1771.coefficient155_229,
  OriginalRow227TriangleData1771.coefficient155_230,
  OriginalRow227TriangleData1771.coefficient155_231,
  OriginalRow227TriangleData1771.coefficient155_232,
  OriginalRow227TriangleData1771.coefficient155_233,
  OriginalRow227TriangleData1771.coefficient155_234,
  OriginalRow227TriangleData1771.coefficient155_235,
  OriginalRow227TriangleData1771.coefficient155_236,
  OriginalRow227TriangleData1771.coefficient155_237,
  OriginalRow227TriangleData1771.coefficient155_238,
  OriginalRow227TriangleData1771.coefficient155_239,
  OriginalRow227TriangleData1771.coefficient155_240,
  OriginalRow227TriangleData1771.coefficient155_241,
  OriginalRow227TriangleData1771.coefficient155_242,
  OriginalRow227TriangleData1771.coefficient155_243,
  OriginalRow227TriangleData1771.coefficient155_244,
  OriginalRow227TriangleData1771.coefficient155_245,
  OriginalRow227TriangleData1771.coefficient155_246,
  OriginalRow227TriangleData1771.coefficient155_247,
  OriginalRow227TriangleData1771.coefficient155_248,
  OriginalRow227TriangleData1771.coefficient155_249
]

theorem values1771_size : values1771.size = 32 := rfl

def block1771 : ℕ → Option IntervalDyadic := segment 218 values1771

theorem block1771_domain : ExactDomain block1771 218 250 := by
  simpa only [values1771_size] using segment_domain 218 values1771

theorem block1771_get (i : Fin 32) :
    block1771 (218 + i.val) = some (values1771[i.val]'(by rw [values1771_size]; exact i.isLt)) := by
  exact segment_get 218 values1771 ⟨i.val, by rw [values1771_size]; exact i.isLt⟩

def values1772 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1772.coefficient155_250,
  OriginalRow227TriangleData1772.coefficient155_251,
  OriginalRow227TriangleData1772.coefficient155_252,
  OriginalRow227TriangleData1772.coefficient155_253,
  OriginalRow227TriangleData1772.coefficient155_254,
  OriginalRow227TriangleData1772.coefficient155_255,
  OriginalRow227TriangleData1772.coefficient155_256,
  OriginalRow227TriangleData1772.coefficient155_257,
  OriginalRow227TriangleData1772.coefficient155_258,
  OriginalRow227TriangleData1772.coefficient155_259,
  OriginalRow227TriangleData1772.coefficient155_260,
  OriginalRow227TriangleData1772.coefficient155_261,
  OriginalRow227TriangleData1772.coefficient155_262,
  OriginalRow227TriangleData1772.coefficient155_263,
  OriginalRow227TriangleData1772.coefficient155_264,
  OriginalRow227TriangleData1772.coefficient155_265,
  OriginalRow227TriangleData1772.coefficient155_266,
  OriginalRow227TriangleData1772.coefficient155_267,
  OriginalRow227TriangleData1772.coefficient155_268,
  OriginalRow227TriangleData1772.coefficient155_269,
  OriginalRow227TriangleData1772.coefficient155_270,
  OriginalRow227TriangleData1772.coefficient155_271,
  OriginalRow227TriangleData1772.coefficient155_272,
  OriginalRow227TriangleData1772.coefficient155_273,
  OriginalRow227TriangleData1772.coefficient155_274,
  OriginalRow227TriangleData1772.coefficient155_275,
  OriginalRow227TriangleData1772.coefficient155_276,
  OriginalRow227TriangleData1772.coefficient155_277,
  OriginalRow227TriangleData1772.coefficient155_278,
  OriginalRow227TriangleData1772.coefficient155_279,
  OriginalRow227TriangleData1772.coefficient155_280,
  OriginalRow227TriangleData1772.coefficient155_281
]

theorem values1772_size : values1772.size = 32 := rfl

def block1772 : ℕ → Option IntervalDyadic := segment 250 values1772

theorem block1772_domain : ExactDomain block1772 250 282 := by
  simpa only [values1772_size] using segment_domain 250 values1772

theorem block1772_get (i : Fin 32) :
    block1772 (250 + i.val) = some (values1772[i.val]'(by rw [values1772_size]; exact i.isLt)) := by
  exact segment_get 250 values1772 ⟨i.val, by rw [values1772_size]; exact i.isLt⟩

def values1773 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1773.coefficient155_282,
  OriginalRow227TriangleData1773.coefficient155_283,
  OriginalRow227TriangleData1773.coefficient155_284,
  OriginalRow227TriangleData1773.coefficient155_285,
  OriginalRow227TriangleData1773.coefficient155_286,
  OriginalRow227TriangleData1773.coefficient155_287,
  OriginalRow227TriangleData1773.coefficient155_288,
  OriginalRow227TriangleData1773.coefficient155_289,
  OriginalRow227TriangleData1773.coefficient155_290,
  OriginalRow227TriangleData1773.coefficient155_291,
  OriginalRow227TriangleData1773.coefficient155_292,
  OriginalRow227TriangleData1773.coefficient155_293,
  OriginalRow227TriangleData1773.coefficient155_294,
  OriginalRow227TriangleData1773.coefficient155_295,
  OriginalRow227TriangleData1773.coefficient155_296,
  OriginalRow227TriangleData1773.coefficient155_297,
  OriginalRow227TriangleData1773.coefficient155_298,
  OriginalRow227TriangleData1773.coefficient155_299,
  OriginalRow227TriangleData1773.coefficient155_300,
  OriginalRow227TriangleData1773.coefficient155_301,
  OriginalRow227TriangleData1773.coefficient155_302,
  OriginalRow227TriangleData1773.coefficient155_303,
  OriginalRow227TriangleData1773.coefficient155_304,
  OriginalRow227TriangleData1773.coefficient155_305,
  OriginalRow227TriangleData1773.coefficient155_306,
  OriginalRow227TriangleData1773.coefficient155_307,
  OriginalRow227TriangleData1773.coefficient155_308,
  OriginalRow227TriangleData1773.coefficient155_309,
  OriginalRow227TriangleData1773.coefficient155_310,
  OriginalRow227TriangleData1773.coefficient155_311,
  OriginalRow227TriangleData1773.coefficient155_312,
  OriginalRow227TriangleData1773.coefficient155_313
]

theorem values1773_size : values1773.size = 32 := rfl

def block1773 : ℕ → Option IntervalDyadic := segment 282 values1773

theorem block1773_domain : ExactDomain block1773 282 314 := by
  simpa only [values1773_size] using segment_domain 282 values1773

theorem block1773_get (i : Fin 32) :
    block1773 (282 + i.val) = some (values1773[i.val]'(by rw [values1773_size]; exact i.isLt)) := by
  exact segment_get 282 values1773 ⟨i.val, by rw [values1773_size]; exact i.isLt⟩

def values1774 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1774.coefficient155_314,
  OriginalRow227TriangleData1774.coefficient155_315,
  OriginalRow227TriangleData1774.coefficient155_316,
  OriginalRow227TriangleData1774.coefficient155_317,
  OriginalRow227TriangleData1774.coefficient155_318,
  OriginalRow227TriangleData1774.coefficient155_319,
  OriginalRow227TriangleData1774.coefficient155_320,
  OriginalRow227TriangleData1774.coefficient155_321,
  OriginalRow227TriangleData1774.coefficient155_322,
  OriginalRow227TriangleData1774.coefficient155_323,
  OriginalRow227TriangleData1774.coefficient155_324,
  OriginalRow227TriangleData1774.coefficient155_325,
  OriginalRow227TriangleData1774.coefficient155_326,
  OriginalRow227TriangleData1774.coefficient155_327,
  OriginalRow227TriangleData1774.coefficient155_328,
  OriginalRow227TriangleData1774.coefficient155_329,
  OriginalRow227TriangleData1774.coefficient155_330,
  OriginalRow227TriangleData1774.coefficient155_331,
  OriginalRow227TriangleData1774.coefficient155_332,
  OriginalRow227TriangleData1774.coefficient155_333,
  OriginalRow227TriangleData1774.coefficient155_334,
  OriginalRow227TriangleData1774.coefficient155_335,
  OriginalRow227TriangleData1774.coefficient155_336,
  OriginalRow227TriangleData1774.coefficient155_337,
  OriginalRow227TriangleData1774.coefficient155_338,
  OriginalRow227TriangleData1774.coefficient155_339,
  OriginalRow227TriangleData1774.coefficient155_340,
  OriginalRow227TriangleData1774.coefficient155_341,
  OriginalRow227TriangleData1774.coefficient155_342,
  OriginalRow227TriangleData1774.coefficient155_343,
  OriginalRow227TriangleData1774.coefficient155_344,
  OriginalRow227TriangleData1774.coefficient155_345
]

theorem values1774_size : values1774.size = 32 := rfl

def block1774 : ℕ → Option IntervalDyadic := segment 314 values1774

theorem block1774_domain : ExactDomain block1774 314 346 := by
  simpa only [values1774_size] using segment_domain 314 values1774

theorem block1774_get (i : Fin 32) :
    block1774 (314 + i.val) = some (values1774[i.val]'(by rw [values1774_size]; exact i.isLt)) := by
  exact segment_get 314 values1774 ⟨i.val, by rw [values1774_size]; exact i.isLt⟩

def values1775 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1775.coefficient155_346
]

theorem values1775_size : values1775.size = 1 := rfl

def block1775 : ℕ → Option IntervalDyadic := segment 346 values1775

theorem block1775_domain : ExactDomain block1775 346 347 := by
  simpa only [values1775_size] using segment_domain 346 values1775

theorem block1775_get (i : Fin 1) :
    block1775 (346 + i.val) = some (values1775[i.val]'(by rw [values1775_size]; exact i.isLt)) := by
  exact segment_get 346 values1775 ⟨i.val, by rw [values1775_size]; exact i.isLt⟩

def node0186_0250 : ℕ → Option IntervalDyadic := split 218 block1770 block1771

theorem node0186_0250_domain : ExactDomain node0186_0250 186 250 := by
  exact split_domain (by decide) (by decide) block1770_domain block1771_domain

def node0154_0250 : ℕ → Option IntervalDyadic := split 186 block1769 node0186_0250

theorem node0154_0250_domain : ExactDomain node0154_0250 154 250 := by
  exact split_domain (by decide) (by decide) block1769_domain node0186_0250_domain

def node0250_0314 : ℕ → Option IntervalDyadic := split 282 block1772 block1773

theorem node0250_0314_domain : ExactDomain node0250_0314 250 314 := by
  exact split_domain (by decide) (by decide) block1772_domain block1773_domain

def node0314_0347 : ℕ → Option IntervalDyadic := split 346 block1774 block1775

theorem node0314_0347_domain : ExactDomain node0314_0347 314 347 := by
  exact split_domain (by decide) (by decide) block1774_domain block1775_domain

def node0250_0347 : ℕ → Option IntervalDyadic := split 314 node0250_0314 node0314_0347

theorem node0250_0347_domain : ExactDomain node0250_0347 250 347 := by
  exact split_domain (by decide) (by decide) node0250_0314_domain node0314_0347_domain

def node0154_0347 : ℕ → Option IntervalDyadic := split 250 node0154_0250 node0250_0347

theorem node0154_0347_domain : ExactDomain node0154_0347 154 347 := by
  exact split_domain (by decide) (by decide) node0154_0250_domain node0250_0347_domain

def lookup : ℕ → Option IntervalDyadic := node0154_0347

theorem lookup_domain : ExactDomain lookup 154 347 :=
  node0154_0347_domain

theorem block1769_lookup (i : Fin 32) :
    lookup (154 + i.val) = some (values1769[i.val]'(by rw [values1769_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0154_0347 (154 + i.val) = _
  rw [node0154_0347, split_left 250 node0154_0250 node0250_0347 (by omega)]
  rw [node0154_0250, split_left 186 block1769 node0186_0250 (by omega)]
  exact block1769_get i

theorem block1770_lookup (i : Fin 32) :
    lookup (186 + i.val) = some (values1770[i.val]'(by rw [values1770_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0154_0347 (186 + i.val) = _
  rw [node0154_0347, split_left 250 node0154_0250 node0250_0347 (by omega)]
  rw [node0154_0250, split_right 186 block1769 node0186_0250 (by omega)]
  rw [node0186_0250, split_left 218 block1770 block1771 (by omega)]
  exact block1770_get i

theorem block1771_lookup (i : Fin 32) :
    lookup (218 + i.val) = some (values1771[i.val]'(by rw [values1771_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0154_0347 (218 + i.val) = _
  rw [node0154_0347, split_left 250 node0154_0250 node0250_0347 (by omega)]
  rw [node0154_0250, split_right 186 block1769 node0186_0250 (by omega)]
  rw [node0186_0250, split_right 218 block1770 block1771 (by omega)]
  exact block1771_get i

theorem block1772_lookup (i : Fin 32) :
    lookup (250 + i.val) = some (values1772[i.val]'(by rw [values1772_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0154_0347 (250 + i.val) = _
  rw [node0154_0347, split_right 250 node0154_0250 node0250_0347 (by omega)]
  rw [node0250_0347, split_left 314 node0250_0314 node0314_0347 (by omega)]
  rw [node0250_0314, split_left 282 block1772 block1773 (by omega)]
  exact block1772_get i

theorem block1773_lookup (i : Fin 32) :
    lookup (282 + i.val) = some (values1773[i.val]'(by rw [values1773_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0154_0347 (282 + i.val) = _
  rw [node0154_0347, split_right 250 node0154_0250 node0250_0347 (by omega)]
  rw [node0250_0347, split_left 314 node0250_0314 node0314_0347 (by omega)]
  rw [node0250_0314, split_right 282 block1772 block1773 (by omega)]
  exact block1773_get i

theorem block1774_lookup (i : Fin 32) :
    lookup (314 + i.val) = some (values1774[i.val]'(by rw [values1774_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0154_0347 (314 + i.val) = _
  rw [node0154_0347, split_right 250 node0154_0250 node0250_0347 (by omega)]
  rw [node0250_0347, split_right 314 node0250_0314 node0314_0347 (by omega)]
  rw [node0314_0347, split_left 346 block1774 block1775 (by omega)]
  exact block1774_get i

theorem block1775_lookup (i : Fin 1) :
    lookup (346 + i.val) = some (values1775[i.val]'(by rw [values1775_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0154_0347 (346 + i.val) = _
  rw [node0154_0347, split_right 250 node0154_0250 node0250_0347 (by omega)]
  rw [node0250_0347, split_right 314 node0250_0314 node0314_0347 (by omega)]
  rw [node0314_0347, split_right 346 block1774 block1775 (by omega)]
  exact block1775_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1769_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1769_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1770_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1770_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1771_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1771_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1772_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1772_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1773_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1773_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1774_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1774_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1775_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1775_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1769_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1770_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1771_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1772_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1773_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1774_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow155.block1775_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow155
