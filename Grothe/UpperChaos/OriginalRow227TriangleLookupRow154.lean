import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1762
import Grothe.UpperChaos.OriginalRow227TriangleData1763
import Grothe.UpperChaos.OriginalRow227TriangleData1764
import Grothe.UpperChaos.OriginalRow227TriangleData1765
import Grothe.UpperChaos.OriginalRow227TriangleData1766
import Grothe.UpperChaos.OriginalRow227TriangleData1767
import Grothe.UpperChaos.OriginalRow227TriangleData1768

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow154

open ConditionalTableLookup

def values1762 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1762.coefficient154_153,
  OriginalRow227TriangleData1762.coefficient154_154,
  OriginalRow227TriangleData1762.coefficient154_155,
  OriginalRow227TriangleData1762.coefficient154_156,
  OriginalRow227TriangleData1762.coefficient154_157,
  OriginalRow227TriangleData1762.coefficient154_158,
  OriginalRow227TriangleData1762.coefficient154_159,
  OriginalRow227TriangleData1762.coefficient154_160,
  OriginalRow227TriangleData1762.coefficient154_161,
  OriginalRow227TriangleData1762.coefficient154_162,
  OriginalRow227TriangleData1762.coefficient154_163,
  OriginalRow227TriangleData1762.coefficient154_164,
  OriginalRow227TriangleData1762.coefficient154_165,
  OriginalRow227TriangleData1762.coefficient154_166,
  OriginalRow227TriangleData1762.coefficient154_167,
  OriginalRow227TriangleData1762.coefficient154_168,
  OriginalRow227TriangleData1762.coefficient154_169,
  OriginalRow227TriangleData1762.coefficient154_170,
  OriginalRow227TriangleData1762.coefficient154_171,
  OriginalRow227TriangleData1762.coefficient154_172,
  OriginalRow227TriangleData1762.coefficient154_173,
  OriginalRow227TriangleData1762.coefficient154_174,
  OriginalRow227TriangleData1762.coefficient154_175,
  OriginalRow227TriangleData1762.coefficient154_176,
  OriginalRow227TriangleData1762.coefficient154_177,
  OriginalRow227TriangleData1762.coefficient154_178,
  OriginalRow227TriangleData1762.coefficient154_179,
  OriginalRow227TriangleData1762.coefficient154_180,
  OriginalRow227TriangleData1762.coefficient154_181,
  OriginalRow227TriangleData1762.coefficient154_182,
  OriginalRow227TriangleData1762.coefficient154_183,
  OriginalRow227TriangleData1762.coefficient154_184
]

theorem values1762_size : values1762.size = 32 := rfl

def block1762 : ℕ → Option IntervalDyadic := segment 153 values1762

theorem block1762_domain : ExactDomain block1762 153 185 := by
  simpa only [values1762_size] using segment_domain 153 values1762

theorem block1762_get (i : Fin 32) :
    block1762 (153 + i.val) = some (values1762[i.val]'(by rw [values1762_size]; exact i.isLt)) := by
  exact segment_get 153 values1762 ⟨i.val, by rw [values1762_size]; exact i.isLt⟩

def values1763 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1763.coefficient154_185,
  OriginalRow227TriangleData1763.coefficient154_186,
  OriginalRow227TriangleData1763.coefficient154_187,
  OriginalRow227TriangleData1763.coefficient154_188,
  OriginalRow227TriangleData1763.coefficient154_189,
  OriginalRow227TriangleData1763.coefficient154_190,
  OriginalRow227TriangleData1763.coefficient154_191,
  OriginalRow227TriangleData1763.coefficient154_192,
  OriginalRow227TriangleData1763.coefficient154_193,
  OriginalRow227TriangleData1763.coefficient154_194,
  OriginalRow227TriangleData1763.coefficient154_195,
  OriginalRow227TriangleData1763.coefficient154_196,
  OriginalRow227TriangleData1763.coefficient154_197,
  OriginalRow227TriangleData1763.coefficient154_198,
  OriginalRow227TriangleData1763.coefficient154_199,
  OriginalRow227TriangleData1763.coefficient154_200,
  OriginalRow227TriangleData1763.coefficient154_201,
  OriginalRow227TriangleData1763.coefficient154_202,
  OriginalRow227TriangleData1763.coefficient154_203,
  OriginalRow227TriangleData1763.coefficient154_204,
  OriginalRow227TriangleData1763.coefficient154_205,
  OriginalRow227TriangleData1763.coefficient154_206,
  OriginalRow227TriangleData1763.coefficient154_207,
  OriginalRow227TriangleData1763.coefficient154_208,
  OriginalRow227TriangleData1763.coefficient154_209,
  OriginalRow227TriangleData1763.coefficient154_210,
  OriginalRow227TriangleData1763.coefficient154_211,
  OriginalRow227TriangleData1763.coefficient154_212,
  OriginalRow227TriangleData1763.coefficient154_213,
  OriginalRow227TriangleData1763.coefficient154_214,
  OriginalRow227TriangleData1763.coefficient154_215,
  OriginalRow227TriangleData1763.coefficient154_216
]

theorem values1763_size : values1763.size = 32 := rfl

def block1763 : ℕ → Option IntervalDyadic := segment 185 values1763

theorem block1763_domain : ExactDomain block1763 185 217 := by
  simpa only [values1763_size] using segment_domain 185 values1763

theorem block1763_get (i : Fin 32) :
    block1763 (185 + i.val) = some (values1763[i.val]'(by rw [values1763_size]; exact i.isLt)) := by
  exact segment_get 185 values1763 ⟨i.val, by rw [values1763_size]; exact i.isLt⟩

def values1764 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1764.coefficient154_217,
  OriginalRow227TriangleData1764.coefficient154_218,
  OriginalRow227TriangleData1764.coefficient154_219,
  OriginalRow227TriangleData1764.coefficient154_220,
  OriginalRow227TriangleData1764.coefficient154_221,
  OriginalRow227TriangleData1764.coefficient154_222,
  OriginalRow227TriangleData1764.coefficient154_223,
  OriginalRow227TriangleData1764.coefficient154_224,
  OriginalRow227TriangleData1764.coefficient154_225,
  OriginalRow227TriangleData1764.coefficient154_226,
  OriginalRow227TriangleData1764.coefficient154_227,
  OriginalRow227TriangleData1764.coefficient154_228,
  OriginalRow227TriangleData1764.coefficient154_229,
  OriginalRow227TriangleData1764.coefficient154_230,
  OriginalRow227TriangleData1764.coefficient154_231,
  OriginalRow227TriangleData1764.coefficient154_232,
  OriginalRow227TriangleData1764.coefficient154_233,
  OriginalRow227TriangleData1764.coefficient154_234,
  OriginalRow227TriangleData1764.coefficient154_235,
  OriginalRow227TriangleData1764.coefficient154_236,
  OriginalRow227TriangleData1764.coefficient154_237,
  OriginalRow227TriangleData1764.coefficient154_238,
  OriginalRow227TriangleData1764.coefficient154_239,
  OriginalRow227TriangleData1764.coefficient154_240,
  OriginalRow227TriangleData1764.coefficient154_241,
  OriginalRow227TriangleData1764.coefficient154_242,
  OriginalRow227TriangleData1764.coefficient154_243,
  OriginalRow227TriangleData1764.coefficient154_244,
  OriginalRow227TriangleData1764.coefficient154_245,
  OriginalRow227TriangleData1764.coefficient154_246,
  OriginalRow227TriangleData1764.coefficient154_247,
  OriginalRow227TriangleData1764.coefficient154_248
]

theorem values1764_size : values1764.size = 32 := rfl

def block1764 : ℕ → Option IntervalDyadic := segment 217 values1764

theorem block1764_domain : ExactDomain block1764 217 249 := by
  simpa only [values1764_size] using segment_domain 217 values1764

theorem block1764_get (i : Fin 32) :
    block1764 (217 + i.val) = some (values1764[i.val]'(by rw [values1764_size]; exact i.isLt)) := by
  exact segment_get 217 values1764 ⟨i.val, by rw [values1764_size]; exact i.isLt⟩

def values1765 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1765.coefficient154_249,
  OriginalRow227TriangleData1765.coefficient154_250,
  OriginalRow227TriangleData1765.coefficient154_251,
  OriginalRow227TriangleData1765.coefficient154_252,
  OriginalRow227TriangleData1765.coefficient154_253,
  OriginalRow227TriangleData1765.coefficient154_254,
  OriginalRow227TriangleData1765.coefficient154_255,
  OriginalRow227TriangleData1765.coefficient154_256,
  OriginalRow227TriangleData1765.coefficient154_257,
  OriginalRow227TriangleData1765.coefficient154_258,
  OriginalRow227TriangleData1765.coefficient154_259,
  OriginalRow227TriangleData1765.coefficient154_260,
  OriginalRow227TriangleData1765.coefficient154_261,
  OriginalRow227TriangleData1765.coefficient154_262,
  OriginalRow227TriangleData1765.coefficient154_263,
  OriginalRow227TriangleData1765.coefficient154_264,
  OriginalRow227TriangleData1765.coefficient154_265,
  OriginalRow227TriangleData1765.coefficient154_266,
  OriginalRow227TriangleData1765.coefficient154_267,
  OriginalRow227TriangleData1765.coefficient154_268,
  OriginalRow227TriangleData1765.coefficient154_269,
  OriginalRow227TriangleData1765.coefficient154_270,
  OriginalRow227TriangleData1765.coefficient154_271,
  OriginalRow227TriangleData1765.coefficient154_272,
  OriginalRow227TriangleData1765.coefficient154_273,
  OriginalRow227TriangleData1765.coefficient154_274,
  OriginalRow227TriangleData1765.coefficient154_275,
  OriginalRow227TriangleData1765.coefficient154_276,
  OriginalRow227TriangleData1765.coefficient154_277,
  OriginalRow227TriangleData1765.coefficient154_278,
  OriginalRow227TriangleData1765.coefficient154_279,
  OriginalRow227TriangleData1765.coefficient154_280
]

theorem values1765_size : values1765.size = 32 := rfl

def block1765 : ℕ → Option IntervalDyadic := segment 249 values1765

theorem block1765_domain : ExactDomain block1765 249 281 := by
  simpa only [values1765_size] using segment_domain 249 values1765

theorem block1765_get (i : Fin 32) :
    block1765 (249 + i.val) = some (values1765[i.val]'(by rw [values1765_size]; exact i.isLt)) := by
  exact segment_get 249 values1765 ⟨i.val, by rw [values1765_size]; exact i.isLt⟩

def values1766 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1766.coefficient154_281,
  OriginalRow227TriangleData1766.coefficient154_282,
  OriginalRow227TriangleData1766.coefficient154_283,
  OriginalRow227TriangleData1766.coefficient154_284,
  OriginalRow227TriangleData1766.coefficient154_285,
  OriginalRow227TriangleData1766.coefficient154_286,
  OriginalRow227TriangleData1766.coefficient154_287,
  OriginalRow227TriangleData1766.coefficient154_288,
  OriginalRow227TriangleData1766.coefficient154_289,
  OriginalRow227TriangleData1766.coefficient154_290,
  OriginalRow227TriangleData1766.coefficient154_291,
  OriginalRow227TriangleData1766.coefficient154_292,
  OriginalRow227TriangleData1766.coefficient154_293,
  OriginalRow227TriangleData1766.coefficient154_294,
  OriginalRow227TriangleData1766.coefficient154_295,
  OriginalRow227TriangleData1766.coefficient154_296,
  OriginalRow227TriangleData1766.coefficient154_297,
  OriginalRow227TriangleData1766.coefficient154_298,
  OriginalRow227TriangleData1766.coefficient154_299,
  OriginalRow227TriangleData1766.coefficient154_300,
  OriginalRow227TriangleData1766.coefficient154_301,
  OriginalRow227TriangleData1766.coefficient154_302,
  OriginalRow227TriangleData1766.coefficient154_303,
  OriginalRow227TriangleData1766.coefficient154_304,
  OriginalRow227TriangleData1766.coefficient154_305,
  OriginalRow227TriangleData1766.coefficient154_306,
  OriginalRow227TriangleData1766.coefficient154_307,
  OriginalRow227TriangleData1766.coefficient154_308,
  OriginalRow227TriangleData1766.coefficient154_309,
  OriginalRow227TriangleData1766.coefficient154_310,
  OriginalRow227TriangleData1766.coefficient154_311,
  OriginalRow227TriangleData1766.coefficient154_312
]

theorem values1766_size : values1766.size = 32 := rfl

def block1766 : ℕ → Option IntervalDyadic := segment 281 values1766

theorem block1766_domain : ExactDomain block1766 281 313 := by
  simpa only [values1766_size] using segment_domain 281 values1766

theorem block1766_get (i : Fin 32) :
    block1766 (281 + i.val) = some (values1766[i.val]'(by rw [values1766_size]; exact i.isLt)) := by
  exact segment_get 281 values1766 ⟨i.val, by rw [values1766_size]; exact i.isLt⟩

def values1767 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1767.coefficient154_313,
  OriginalRow227TriangleData1767.coefficient154_314,
  OriginalRow227TriangleData1767.coefficient154_315,
  OriginalRow227TriangleData1767.coefficient154_316,
  OriginalRow227TriangleData1767.coefficient154_317,
  OriginalRow227TriangleData1767.coefficient154_318,
  OriginalRow227TriangleData1767.coefficient154_319,
  OriginalRow227TriangleData1767.coefficient154_320,
  OriginalRow227TriangleData1767.coefficient154_321,
  OriginalRow227TriangleData1767.coefficient154_322,
  OriginalRow227TriangleData1767.coefficient154_323,
  OriginalRow227TriangleData1767.coefficient154_324,
  OriginalRow227TriangleData1767.coefficient154_325,
  OriginalRow227TriangleData1767.coefficient154_326,
  OriginalRow227TriangleData1767.coefficient154_327,
  OriginalRow227TriangleData1767.coefficient154_328,
  OriginalRow227TriangleData1767.coefficient154_329,
  OriginalRow227TriangleData1767.coefficient154_330,
  OriginalRow227TriangleData1767.coefficient154_331,
  OriginalRow227TriangleData1767.coefficient154_332,
  OriginalRow227TriangleData1767.coefficient154_333,
  OriginalRow227TriangleData1767.coefficient154_334,
  OriginalRow227TriangleData1767.coefficient154_335,
  OriginalRow227TriangleData1767.coefficient154_336,
  OriginalRow227TriangleData1767.coefficient154_337,
  OriginalRow227TriangleData1767.coefficient154_338,
  OriginalRow227TriangleData1767.coefficient154_339,
  OriginalRow227TriangleData1767.coefficient154_340,
  OriginalRow227TriangleData1767.coefficient154_341,
  OriginalRow227TriangleData1767.coefficient154_342,
  OriginalRow227TriangleData1767.coefficient154_343,
  OriginalRow227TriangleData1767.coefficient154_344
]

theorem values1767_size : values1767.size = 32 := rfl

def block1767 : ℕ → Option IntervalDyadic := segment 313 values1767

theorem block1767_domain : ExactDomain block1767 313 345 := by
  simpa only [values1767_size] using segment_domain 313 values1767

theorem block1767_get (i : Fin 32) :
    block1767 (313 + i.val) = some (values1767[i.val]'(by rw [values1767_size]; exact i.isLt)) := by
  exact segment_get 313 values1767 ⟨i.val, by rw [values1767_size]; exact i.isLt⟩

def values1768 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1768.coefficient154_345,
  OriginalRow227TriangleData1768.coefficient154_346,
  OriginalRow227TriangleData1768.coefficient154_347
]

theorem values1768_size : values1768.size = 3 := rfl

def block1768 : ℕ → Option IntervalDyadic := segment 345 values1768

theorem block1768_domain : ExactDomain block1768 345 348 := by
  simpa only [values1768_size] using segment_domain 345 values1768

theorem block1768_get (i : Fin 3) :
    block1768 (345 + i.val) = some (values1768[i.val]'(by rw [values1768_size]; exact i.isLt)) := by
  exact segment_get 345 values1768 ⟨i.val, by rw [values1768_size]; exact i.isLt⟩

def node0185_0249 : ℕ → Option IntervalDyadic := split 217 block1763 block1764

theorem node0185_0249_domain : ExactDomain node0185_0249 185 249 := by
  exact split_domain (by decide) (by decide) block1763_domain block1764_domain

def node0153_0249 : ℕ → Option IntervalDyadic := split 185 block1762 node0185_0249

theorem node0153_0249_domain : ExactDomain node0153_0249 153 249 := by
  exact split_domain (by decide) (by decide) block1762_domain node0185_0249_domain

def node0249_0313 : ℕ → Option IntervalDyadic := split 281 block1765 block1766

theorem node0249_0313_domain : ExactDomain node0249_0313 249 313 := by
  exact split_domain (by decide) (by decide) block1765_domain block1766_domain

def node0313_0348 : ℕ → Option IntervalDyadic := split 345 block1767 block1768

theorem node0313_0348_domain : ExactDomain node0313_0348 313 348 := by
  exact split_domain (by decide) (by decide) block1767_domain block1768_domain

def node0249_0348 : ℕ → Option IntervalDyadic := split 313 node0249_0313 node0313_0348

theorem node0249_0348_domain : ExactDomain node0249_0348 249 348 := by
  exact split_domain (by decide) (by decide) node0249_0313_domain node0313_0348_domain

def node0153_0348 : ℕ → Option IntervalDyadic := split 249 node0153_0249 node0249_0348

theorem node0153_0348_domain : ExactDomain node0153_0348 153 348 := by
  exact split_domain (by decide) (by decide) node0153_0249_domain node0249_0348_domain

def lookup : ℕ → Option IntervalDyadic := node0153_0348

theorem lookup_domain : ExactDomain lookup 153 348 :=
  node0153_0348_domain

theorem block1762_lookup (i : Fin 32) :
    lookup (153 + i.val) = some (values1762[i.val]'(by rw [values1762_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0153_0348 (153 + i.val) = _
  rw [node0153_0348, split_left 249 node0153_0249 node0249_0348 (by omega)]
  rw [node0153_0249, split_left 185 block1762 node0185_0249 (by omega)]
  exact block1762_get i

theorem block1763_lookup (i : Fin 32) :
    lookup (185 + i.val) = some (values1763[i.val]'(by rw [values1763_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0153_0348 (185 + i.val) = _
  rw [node0153_0348, split_left 249 node0153_0249 node0249_0348 (by omega)]
  rw [node0153_0249, split_right 185 block1762 node0185_0249 (by omega)]
  rw [node0185_0249, split_left 217 block1763 block1764 (by omega)]
  exact block1763_get i

theorem block1764_lookup (i : Fin 32) :
    lookup (217 + i.val) = some (values1764[i.val]'(by rw [values1764_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0153_0348 (217 + i.val) = _
  rw [node0153_0348, split_left 249 node0153_0249 node0249_0348 (by omega)]
  rw [node0153_0249, split_right 185 block1762 node0185_0249 (by omega)]
  rw [node0185_0249, split_right 217 block1763 block1764 (by omega)]
  exact block1764_get i

theorem block1765_lookup (i : Fin 32) :
    lookup (249 + i.val) = some (values1765[i.val]'(by rw [values1765_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0153_0348 (249 + i.val) = _
  rw [node0153_0348, split_right 249 node0153_0249 node0249_0348 (by omega)]
  rw [node0249_0348, split_left 313 node0249_0313 node0313_0348 (by omega)]
  rw [node0249_0313, split_left 281 block1765 block1766 (by omega)]
  exact block1765_get i

theorem block1766_lookup (i : Fin 32) :
    lookup (281 + i.val) = some (values1766[i.val]'(by rw [values1766_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0153_0348 (281 + i.val) = _
  rw [node0153_0348, split_right 249 node0153_0249 node0249_0348 (by omega)]
  rw [node0249_0348, split_left 313 node0249_0313 node0313_0348 (by omega)]
  rw [node0249_0313, split_right 281 block1765 block1766 (by omega)]
  exact block1766_get i

theorem block1767_lookup (i : Fin 32) :
    lookup (313 + i.val) = some (values1767[i.val]'(by rw [values1767_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0153_0348 (313 + i.val) = _
  rw [node0153_0348, split_right 249 node0153_0249 node0249_0348 (by omega)]
  rw [node0249_0348, split_right 313 node0249_0313 node0313_0348 (by omega)]
  rw [node0313_0348, split_left 345 block1767 block1768 (by omega)]
  exact block1767_get i

theorem block1768_lookup (i : Fin 3) :
    lookup (345 + i.val) = some (values1768[i.val]'(by rw [values1768_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0153_0348 (345 + i.val) = _
  rw [node0153_0348, split_right 249 node0153_0249 node0249_0348 (by omega)]
  rw [node0249_0348, split_right 313 node0249_0313 node0313_0348 (by omega)]
  rw [node0313_0348, split_right 345 block1767 block1768 (by omega)]
  exact block1768_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1762_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1762_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1763_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1763_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1764_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1764_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1765_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1765_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1766_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1766_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1767_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1767_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1768_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1768_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1762_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1763_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1764_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1765_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1766_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1767_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow154.block1768_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow154
