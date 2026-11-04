import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1727
import Grothe.UpperChaos.OriginalRow227TriangleData1728
import Grothe.UpperChaos.OriginalRow227TriangleData1729
import Grothe.UpperChaos.OriginalRow227TriangleData1730
import Grothe.UpperChaos.OriginalRow227TriangleData1731
import Grothe.UpperChaos.OriginalRow227TriangleData1732
import Grothe.UpperChaos.OriginalRow227TriangleData1733

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow149

open ConditionalTableLookup

def values1727 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1727.coefficient149_148,
  OriginalRow227TriangleData1727.coefficient149_149,
  OriginalRow227TriangleData1727.coefficient149_150,
  OriginalRow227TriangleData1727.coefficient149_151,
  OriginalRow227TriangleData1727.coefficient149_152,
  OriginalRow227TriangleData1727.coefficient149_153,
  OriginalRow227TriangleData1727.coefficient149_154,
  OriginalRow227TriangleData1727.coefficient149_155,
  OriginalRow227TriangleData1727.coefficient149_156,
  OriginalRow227TriangleData1727.coefficient149_157,
  OriginalRow227TriangleData1727.coefficient149_158,
  OriginalRow227TriangleData1727.coefficient149_159,
  OriginalRow227TriangleData1727.coefficient149_160,
  OriginalRow227TriangleData1727.coefficient149_161,
  OriginalRow227TriangleData1727.coefficient149_162,
  OriginalRow227TriangleData1727.coefficient149_163,
  OriginalRow227TriangleData1727.coefficient149_164,
  OriginalRow227TriangleData1727.coefficient149_165,
  OriginalRow227TriangleData1727.coefficient149_166,
  OriginalRow227TriangleData1727.coefficient149_167,
  OriginalRow227TriangleData1727.coefficient149_168,
  OriginalRow227TriangleData1727.coefficient149_169,
  OriginalRow227TriangleData1727.coefficient149_170,
  OriginalRow227TriangleData1727.coefficient149_171,
  OriginalRow227TriangleData1727.coefficient149_172,
  OriginalRow227TriangleData1727.coefficient149_173,
  OriginalRow227TriangleData1727.coefficient149_174,
  OriginalRow227TriangleData1727.coefficient149_175,
  OriginalRow227TriangleData1727.coefficient149_176,
  OriginalRow227TriangleData1727.coefficient149_177,
  OriginalRow227TriangleData1727.coefficient149_178,
  OriginalRow227TriangleData1727.coefficient149_179
]

theorem values1727_size : values1727.size = 32 := rfl

def block1727 : ℕ → Option IntervalDyadic := segment 148 values1727

theorem block1727_domain : ExactDomain block1727 148 180 := by
  simpa only [values1727_size] using segment_domain 148 values1727

theorem block1727_get (i : Fin 32) :
    block1727 (148 + i.val) = some (values1727[i.val]'(by rw [values1727_size]; exact i.isLt)) := by
  exact segment_get 148 values1727 ⟨i.val, by rw [values1727_size]; exact i.isLt⟩

def values1728 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1728.coefficient149_180,
  OriginalRow227TriangleData1728.coefficient149_181,
  OriginalRow227TriangleData1728.coefficient149_182,
  OriginalRow227TriangleData1728.coefficient149_183,
  OriginalRow227TriangleData1728.coefficient149_184,
  OriginalRow227TriangleData1728.coefficient149_185,
  OriginalRow227TriangleData1728.coefficient149_186,
  OriginalRow227TriangleData1728.coefficient149_187,
  OriginalRow227TriangleData1728.coefficient149_188,
  OriginalRow227TriangleData1728.coefficient149_189,
  OriginalRow227TriangleData1728.coefficient149_190,
  OriginalRow227TriangleData1728.coefficient149_191,
  OriginalRow227TriangleData1728.coefficient149_192,
  OriginalRow227TriangleData1728.coefficient149_193,
  OriginalRow227TriangleData1728.coefficient149_194,
  OriginalRow227TriangleData1728.coefficient149_195,
  OriginalRow227TriangleData1728.coefficient149_196,
  OriginalRow227TriangleData1728.coefficient149_197,
  OriginalRow227TriangleData1728.coefficient149_198,
  OriginalRow227TriangleData1728.coefficient149_199,
  OriginalRow227TriangleData1728.coefficient149_200,
  OriginalRow227TriangleData1728.coefficient149_201,
  OriginalRow227TriangleData1728.coefficient149_202,
  OriginalRow227TriangleData1728.coefficient149_203,
  OriginalRow227TriangleData1728.coefficient149_204,
  OriginalRow227TriangleData1728.coefficient149_205,
  OriginalRow227TriangleData1728.coefficient149_206,
  OriginalRow227TriangleData1728.coefficient149_207,
  OriginalRow227TriangleData1728.coefficient149_208,
  OriginalRow227TriangleData1728.coefficient149_209,
  OriginalRow227TriangleData1728.coefficient149_210,
  OriginalRow227TriangleData1728.coefficient149_211
]

theorem values1728_size : values1728.size = 32 := rfl

def block1728 : ℕ → Option IntervalDyadic := segment 180 values1728

theorem block1728_domain : ExactDomain block1728 180 212 := by
  simpa only [values1728_size] using segment_domain 180 values1728

theorem block1728_get (i : Fin 32) :
    block1728 (180 + i.val) = some (values1728[i.val]'(by rw [values1728_size]; exact i.isLt)) := by
  exact segment_get 180 values1728 ⟨i.val, by rw [values1728_size]; exact i.isLt⟩

def values1729 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1729.coefficient149_212,
  OriginalRow227TriangleData1729.coefficient149_213,
  OriginalRow227TriangleData1729.coefficient149_214,
  OriginalRow227TriangleData1729.coefficient149_215,
  OriginalRow227TriangleData1729.coefficient149_216,
  OriginalRow227TriangleData1729.coefficient149_217,
  OriginalRow227TriangleData1729.coefficient149_218,
  OriginalRow227TriangleData1729.coefficient149_219,
  OriginalRow227TriangleData1729.coefficient149_220,
  OriginalRow227TriangleData1729.coefficient149_221,
  OriginalRow227TriangleData1729.coefficient149_222,
  OriginalRow227TriangleData1729.coefficient149_223,
  OriginalRow227TriangleData1729.coefficient149_224,
  OriginalRow227TriangleData1729.coefficient149_225,
  OriginalRow227TriangleData1729.coefficient149_226,
  OriginalRow227TriangleData1729.coefficient149_227,
  OriginalRow227TriangleData1729.coefficient149_228,
  OriginalRow227TriangleData1729.coefficient149_229,
  OriginalRow227TriangleData1729.coefficient149_230,
  OriginalRow227TriangleData1729.coefficient149_231,
  OriginalRow227TriangleData1729.coefficient149_232,
  OriginalRow227TriangleData1729.coefficient149_233,
  OriginalRow227TriangleData1729.coefficient149_234,
  OriginalRow227TriangleData1729.coefficient149_235,
  OriginalRow227TriangleData1729.coefficient149_236,
  OriginalRow227TriangleData1729.coefficient149_237,
  OriginalRow227TriangleData1729.coefficient149_238,
  OriginalRow227TriangleData1729.coefficient149_239,
  OriginalRow227TriangleData1729.coefficient149_240,
  OriginalRow227TriangleData1729.coefficient149_241,
  OriginalRow227TriangleData1729.coefficient149_242,
  OriginalRow227TriangleData1729.coefficient149_243
]

theorem values1729_size : values1729.size = 32 := rfl

def block1729 : ℕ → Option IntervalDyadic := segment 212 values1729

theorem block1729_domain : ExactDomain block1729 212 244 := by
  simpa only [values1729_size] using segment_domain 212 values1729

theorem block1729_get (i : Fin 32) :
    block1729 (212 + i.val) = some (values1729[i.val]'(by rw [values1729_size]; exact i.isLt)) := by
  exact segment_get 212 values1729 ⟨i.val, by rw [values1729_size]; exact i.isLt⟩

def values1730 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1730.coefficient149_244,
  OriginalRow227TriangleData1730.coefficient149_245,
  OriginalRow227TriangleData1730.coefficient149_246,
  OriginalRow227TriangleData1730.coefficient149_247,
  OriginalRow227TriangleData1730.coefficient149_248,
  OriginalRow227TriangleData1730.coefficient149_249,
  OriginalRow227TriangleData1730.coefficient149_250,
  OriginalRow227TriangleData1730.coefficient149_251,
  OriginalRow227TriangleData1730.coefficient149_252,
  OriginalRow227TriangleData1730.coefficient149_253,
  OriginalRow227TriangleData1730.coefficient149_254,
  OriginalRow227TriangleData1730.coefficient149_255,
  OriginalRow227TriangleData1730.coefficient149_256,
  OriginalRow227TriangleData1730.coefficient149_257,
  OriginalRow227TriangleData1730.coefficient149_258,
  OriginalRow227TriangleData1730.coefficient149_259,
  OriginalRow227TriangleData1730.coefficient149_260,
  OriginalRow227TriangleData1730.coefficient149_261,
  OriginalRow227TriangleData1730.coefficient149_262,
  OriginalRow227TriangleData1730.coefficient149_263,
  OriginalRow227TriangleData1730.coefficient149_264,
  OriginalRow227TriangleData1730.coefficient149_265,
  OriginalRow227TriangleData1730.coefficient149_266,
  OriginalRow227TriangleData1730.coefficient149_267,
  OriginalRow227TriangleData1730.coefficient149_268,
  OriginalRow227TriangleData1730.coefficient149_269,
  OriginalRow227TriangleData1730.coefficient149_270,
  OriginalRow227TriangleData1730.coefficient149_271,
  OriginalRow227TriangleData1730.coefficient149_272,
  OriginalRow227TriangleData1730.coefficient149_273,
  OriginalRow227TriangleData1730.coefficient149_274,
  OriginalRow227TriangleData1730.coefficient149_275
]

theorem values1730_size : values1730.size = 32 := rfl

def block1730 : ℕ → Option IntervalDyadic := segment 244 values1730

theorem block1730_domain : ExactDomain block1730 244 276 := by
  simpa only [values1730_size] using segment_domain 244 values1730

theorem block1730_get (i : Fin 32) :
    block1730 (244 + i.val) = some (values1730[i.val]'(by rw [values1730_size]; exact i.isLt)) := by
  exact segment_get 244 values1730 ⟨i.val, by rw [values1730_size]; exact i.isLt⟩

def values1731 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1731.coefficient149_276,
  OriginalRow227TriangleData1731.coefficient149_277,
  OriginalRow227TriangleData1731.coefficient149_278,
  OriginalRow227TriangleData1731.coefficient149_279,
  OriginalRow227TriangleData1731.coefficient149_280,
  OriginalRow227TriangleData1731.coefficient149_281,
  OriginalRow227TriangleData1731.coefficient149_282,
  OriginalRow227TriangleData1731.coefficient149_283,
  OriginalRow227TriangleData1731.coefficient149_284,
  OriginalRow227TriangleData1731.coefficient149_285,
  OriginalRow227TriangleData1731.coefficient149_286,
  OriginalRow227TriangleData1731.coefficient149_287,
  OriginalRow227TriangleData1731.coefficient149_288,
  OriginalRow227TriangleData1731.coefficient149_289,
  OriginalRow227TriangleData1731.coefficient149_290,
  OriginalRow227TriangleData1731.coefficient149_291,
  OriginalRow227TriangleData1731.coefficient149_292,
  OriginalRow227TriangleData1731.coefficient149_293,
  OriginalRow227TriangleData1731.coefficient149_294,
  OriginalRow227TriangleData1731.coefficient149_295,
  OriginalRow227TriangleData1731.coefficient149_296,
  OriginalRow227TriangleData1731.coefficient149_297,
  OriginalRow227TriangleData1731.coefficient149_298,
  OriginalRow227TriangleData1731.coefficient149_299,
  OriginalRow227TriangleData1731.coefficient149_300,
  OriginalRow227TriangleData1731.coefficient149_301,
  OriginalRow227TriangleData1731.coefficient149_302,
  OriginalRow227TriangleData1731.coefficient149_303,
  OriginalRow227TriangleData1731.coefficient149_304,
  OriginalRow227TriangleData1731.coefficient149_305,
  OriginalRow227TriangleData1731.coefficient149_306,
  OriginalRow227TriangleData1731.coefficient149_307
]

theorem values1731_size : values1731.size = 32 := rfl

def block1731 : ℕ → Option IntervalDyadic := segment 276 values1731

theorem block1731_domain : ExactDomain block1731 276 308 := by
  simpa only [values1731_size] using segment_domain 276 values1731

theorem block1731_get (i : Fin 32) :
    block1731 (276 + i.val) = some (values1731[i.val]'(by rw [values1731_size]; exact i.isLt)) := by
  exact segment_get 276 values1731 ⟨i.val, by rw [values1731_size]; exact i.isLt⟩

def values1732 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1732.coefficient149_308,
  OriginalRow227TriangleData1732.coefficient149_309,
  OriginalRow227TriangleData1732.coefficient149_310,
  OriginalRow227TriangleData1732.coefficient149_311,
  OriginalRow227TriangleData1732.coefficient149_312,
  OriginalRow227TriangleData1732.coefficient149_313,
  OriginalRow227TriangleData1732.coefficient149_314,
  OriginalRow227TriangleData1732.coefficient149_315,
  OriginalRow227TriangleData1732.coefficient149_316,
  OriginalRow227TriangleData1732.coefficient149_317,
  OriginalRow227TriangleData1732.coefficient149_318,
  OriginalRow227TriangleData1732.coefficient149_319,
  OriginalRow227TriangleData1732.coefficient149_320,
  OriginalRow227TriangleData1732.coefficient149_321,
  OriginalRow227TriangleData1732.coefficient149_322,
  OriginalRow227TriangleData1732.coefficient149_323,
  OriginalRow227TriangleData1732.coefficient149_324,
  OriginalRow227TriangleData1732.coefficient149_325,
  OriginalRow227TriangleData1732.coefficient149_326,
  OriginalRow227TriangleData1732.coefficient149_327,
  OriginalRow227TriangleData1732.coefficient149_328,
  OriginalRow227TriangleData1732.coefficient149_329,
  OriginalRow227TriangleData1732.coefficient149_330,
  OriginalRow227TriangleData1732.coefficient149_331,
  OriginalRow227TriangleData1732.coefficient149_332,
  OriginalRow227TriangleData1732.coefficient149_333,
  OriginalRow227TriangleData1732.coefficient149_334,
  OriginalRow227TriangleData1732.coefficient149_335,
  OriginalRow227TriangleData1732.coefficient149_336,
  OriginalRow227TriangleData1732.coefficient149_337,
  OriginalRow227TriangleData1732.coefficient149_338,
  OriginalRow227TriangleData1732.coefficient149_339
]

theorem values1732_size : values1732.size = 32 := rfl

def block1732 : ℕ → Option IntervalDyadic := segment 308 values1732

theorem block1732_domain : ExactDomain block1732 308 340 := by
  simpa only [values1732_size] using segment_domain 308 values1732

theorem block1732_get (i : Fin 32) :
    block1732 (308 + i.val) = some (values1732[i.val]'(by rw [values1732_size]; exact i.isLt)) := by
  exact segment_get 308 values1732 ⟨i.val, by rw [values1732_size]; exact i.isLt⟩

def values1733 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1733.coefficient149_340,
  OriginalRow227TriangleData1733.coefficient149_341,
  OriginalRow227TriangleData1733.coefficient149_342,
  OriginalRow227TriangleData1733.coefficient149_343,
  OriginalRow227TriangleData1733.coefficient149_344,
  OriginalRow227TriangleData1733.coefficient149_345,
  OriginalRow227TriangleData1733.coefficient149_346,
  OriginalRow227TriangleData1733.coefficient149_347,
  OriginalRow227TriangleData1733.coefficient149_348,
  OriginalRow227TriangleData1733.coefficient149_349,
  OriginalRow227TriangleData1733.coefficient149_350,
  OriginalRow227TriangleData1733.coefficient149_351,
  OriginalRow227TriangleData1733.coefficient149_352
]

theorem values1733_size : values1733.size = 13 := rfl

def block1733 : ℕ → Option IntervalDyadic := segment 340 values1733

theorem block1733_domain : ExactDomain block1733 340 353 := by
  simpa only [values1733_size] using segment_domain 340 values1733

theorem block1733_get (i : Fin 13) :
    block1733 (340 + i.val) = some (values1733[i.val]'(by rw [values1733_size]; exact i.isLt)) := by
  exact segment_get 340 values1733 ⟨i.val, by rw [values1733_size]; exact i.isLt⟩

def node0180_0244 : ℕ → Option IntervalDyadic := split 212 block1728 block1729

theorem node0180_0244_domain : ExactDomain node0180_0244 180 244 := by
  exact split_domain (by decide) (by decide) block1728_domain block1729_domain

def node0148_0244 : ℕ → Option IntervalDyadic := split 180 block1727 node0180_0244

theorem node0148_0244_domain : ExactDomain node0148_0244 148 244 := by
  exact split_domain (by decide) (by decide) block1727_domain node0180_0244_domain

def node0244_0308 : ℕ → Option IntervalDyadic := split 276 block1730 block1731

theorem node0244_0308_domain : ExactDomain node0244_0308 244 308 := by
  exact split_domain (by decide) (by decide) block1730_domain block1731_domain

def node0308_0353 : ℕ → Option IntervalDyadic := split 340 block1732 block1733

theorem node0308_0353_domain : ExactDomain node0308_0353 308 353 := by
  exact split_domain (by decide) (by decide) block1732_domain block1733_domain

def node0244_0353 : ℕ → Option IntervalDyadic := split 308 node0244_0308 node0308_0353

theorem node0244_0353_domain : ExactDomain node0244_0353 244 353 := by
  exact split_domain (by decide) (by decide) node0244_0308_domain node0308_0353_domain

def node0148_0353 : ℕ → Option IntervalDyadic := split 244 node0148_0244 node0244_0353

theorem node0148_0353_domain : ExactDomain node0148_0353 148 353 := by
  exact split_domain (by decide) (by decide) node0148_0244_domain node0244_0353_domain

def lookup : ℕ → Option IntervalDyadic := node0148_0353

theorem lookup_domain : ExactDomain lookup 148 353 :=
  node0148_0353_domain

theorem block1727_lookup (i : Fin 32) :
    lookup (148 + i.val) = some (values1727[i.val]'(by rw [values1727_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0148_0353 (148 + i.val) = _
  rw [node0148_0353, split_left 244 node0148_0244 node0244_0353 (by omega)]
  rw [node0148_0244, split_left 180 block1727 node0180_0244 (by omega)]
  exact block1727_get i

theorem block1728_lookup (i : Fin 32) :
    lookup (180 + i.val) = some (values1728[i.val]'(by rw [values1728_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0148_0353 (180 + i.val) = _
  rw [node0148_0353, split_left 244 node0148_0244 node0244_0353 (by omega)]
  rw [node0148_0244, split_right 180 block1727 node0180_0244 (by omega)]
  rw [node0180_0244, split_left 212 block1728 block1729 (by omega)]
  exact block1728_get i

theorem block1729_lookup (i : Fin 32) :
    lookup (212 + i.val) = some (values1729[i.val]'(by rw [values1729_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0148_0353 (212 + i.val) = _
  rw [node0148_0353, split_left 244 node0148_0244 node0244_0353 (by omega)]
  rw [node0148_0244, split_right 180 block1727 node0180_0244 (by omega)]
  rw [node0180_0244, split_right 212 block1728 block1729 (by omega)]
  exact block1729_get i

theorem block1730_lookup (i : Fin 32) :
    lookup (244 + i.val) = some (values1730[i.val]'(by rw [values1730_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0148_0353 (244 + i.val) = _
  rw [node0148_0353, split_right 244 node0148_0244 node0244_0353 (by omega)]
  rw [node0244_0353, split_left 308 node0244_0308 node0308_0353 (by omega)]
  rw [node0244_0308, split_left 276 block1730 block1731 (by omega)]
  exact block1730_get i

theorem block1731_lookup (i : Fin 32) :
    lookup (276 + i.val) = some (values1731[i.val]'(by rw [values1731_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0148_0353 (276 + i.val) = _
  rw [node0148_0353, split_right 244 node0148_0244 node0244_0353 (by omega)]
  rw [node0244_0353, split_left 308 node0244_0308 node0308_0353 (by omega)]
  rw [node0244_0308, split_right 276 block1730 block1731 (by omega)]
  exact block1731_get i

theorem block1732_lookup (i : Fin 32) :
    lookup (308 + i.val) = some (values1732[i.val]'(by rw [values1732_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0148_0353 (308 + i.val) = _
  rw [node0148_0353, split_right 244 node0148_0244 node0244_0353 (by omega)]
  rw [node0244_0353, split_right 308 node0244_0308 node0308_0353 (by omega)]
  rw [node0308_0353, split_left 340 block1732 block1733 (by omega)]
  exact block1732_get i

theorem block1733_lookup (i : Fin 13) :
    lookup (340 + i.val) = some (values1733[i.val]'(by rw [values1733_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0148_0353 (340 + i.val) = _
  rw [node0148_0353, split_right 244 node0148_0244 node0244_0353 (by omega)]
  rw [node0244_0353, split_right 308 node0244_0308 node0308_0353 (by omega)]
  rw [node0308_0353, split_right 340 block1732 block1733 (by omega)]
  exact block1733_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1727_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1727_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1728_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1728_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1729_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1729_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1730_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1730_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1731_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1731_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1732_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1732_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1733_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1733_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1727_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1728_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1729_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1730_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1731_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1732_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow149.block1733_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow149
