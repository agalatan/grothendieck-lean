import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1806
import Grothe.UpperChaos.OriginalRow227TriangleData1807
import Grothe.UpperChaos.OriginalRow227TriangleData1808
import Grothe.UpperChaos.OriginalRow227TriangleData1809
import Grothe.UpperChaos.OriginalRow227TriangleData1810
import Grothe.UpperChaos.OriginalRow227TriangleData1811

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow161

open ConditionalTableLookup

def values1806 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1806.coefficient161_160,
  OriginalRow227TriangleData1806.coefficient161_161,
  OriginalRow227TriangleData1806.coefficient161_162,
  OriginalRow227TriangleData1806.coefficient161_163,
  OriginalRow227TriangleData1806.coefficient161_164,
  OriginalRow227TriangleData1806.coefficient161_165,
  OriginalRow227TriangleData1806.coefficient161_166,
  OriginalRow227TriangleData1806.coefficient161_167,
  OriginalRow227TriangleData1806.coefficient161_168,
  OriginalRow227TriangleData1806.coefficient161_169,
  OriginalRow227TriangleData1806.coefficient161_170,
  OriginalRow227TriangleData1806.coefficient161_171,
  OriginalRow227TriangleData1806.coefficient161_172,
  OriginalRow227TriangleData1806.coefficient161_173,
  OriginalRow227TriangleData1806.coefficient161_174,
  OriginalRow227TriangleData1806.coefficient161_175,
  OriginalRow227TriangleData1806.coefficient161_176,
  OriginalRow227TriangleData1806.coefficient161_177,
  OriginalRow227TriangleData1806.coefficient161_178,
  OriginalRow227TriangleData1806.coefficient161_179,
  OriginalRow227TriangleData1806.coefficient161_180,
  OriginalRow227TriangleData1806.coefficient161_181,
  OriginalRow227TriangleData1806.coefficient161_182,
  OriginalRow227TriangleData1806.coefficient161_183,
  OriginalRow227TriangleData1806.coefficient161_184,
  OriginalRow227TriangleData1806.coefficient161_185,
  OriginalRow227TriangleData1806.coefficient161_186,
  OriginalRow227TriangleData1806.coefficient161_187,
  OriginalRow227TriangleData1806.coefficient161_188,
  OriginalRow227TriangleData1806.coefficient161_189,
  OriginalRow227TriangleData1806.coefficient161_190,
  OriginalRow227TriangleData1806.coefficient161_191
]

theorem values1806_size : values1806.size = 32 := rfl

def block1806 : ℕ → Option IntervalDyadic := segment 160 values1806

theorem block1806_domain : ExactDomain block1806 160 192 := by
  simpa only [values1806_size] using segment_domain 160 values1806

theorem block1806_get (i : Fin 32) :
    block1806 (160 + i.val) = some (values1806[i.val]'(by rw [values1806_size]; exact i.isLt)) := by
  exact segment_get 160 values1806 ⟨i.val, by rw [values1806_size]; exact i.isLt⟩

def values1807 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1807.coefficient161_192,
  OriginalRow227TriangleData1807.coefficient161_193,
  OriginalRow227TriangleData1807.coefficient161_194,
  OriginalRow227TriangleData1807.coefficient161_195,
  OriginalRow227TriangleData1807.coefficient161_196,
  OriginalRow227TriangleData1807.coefficient161_197,
  OriginalRow227TriangleData1807.coefficient161_198,
  OriginalRow227TriangleData1807.coefficient161_199,
  OriginalRow227TriangleData1807.coefficient161_200,
  OriginalRow227TriangleData1807.coefficient161_201,
  OriginalRow227TriangleData1807.coefficient161_202,
  OriginalRow227TriangleData1807.coefficient161_203,
  OriginalRow227TriangleData1807.coefficient161_204,
  OriginalRow227TriangleData1807.coefficient161_205,
  OriginalRow227TriangleData1807.coefficient161_206,
  OriginalRow227TriangleData1807.coefficient161_207,
  OriginalRow227TriangleData1807.coefficient161_208,
  OriginalRow227TriangleData1807.coefficient161_209,
  OriginalRow227TriangleData1807.coefficient161_210,
  OriginalRow227TriangleData1807.coefficient161_211,
  OriginalRow227TriangleData1807.coefficient161_212,
  OriginalRow227TriangleData1807.coefficient161_213,
  OriginalRow227TriangleData1807.coefficient161_214,
  OriginalRow227TriangleData1807.coefficient161_215,
  OriginalRow227TriangleData1807.coefficient161_216,
  OriginalRow227TriangleData1807.coefficient161_217,
  OriginalRow227TriangleData1807.coefficient161_218,
  OriginalRow227TriangleData1807.coefficient161_219,
  OriginalRow227TriangleData1807.coefficient161_220,
  OriginalRow227TriangleData1807.coefficient161_221,
  OriginalRow227TriangleData1807.coefficient161_222,
  OriginalRow227TriangleData1807.coefficient161_223
]

theorem values1807_size : values1807.size = 32 := rfl

def block1807 : ℕ → Option IntervalDyadic := segment 192 values1807

theorem block1807_domain : ExactDomain block1807 192 224 := by
  simpa only [values1807_size] using segment_domain 192 values1807

theorem block1807_get (i : Fin 32) :
    block1807 (192 + i.val) = some (values1807[i.val]'(by rw [values1807_size]; exact i.isLt)) := by
  exact segment_get 192 values1807 ⟨i.val, by rw [values1807_size]; exact i.isLt⟩

def values1808 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1808.coefficient161_224,
  OriginalRow227TriangleData1808.coefficient161_225,
  OriginalRow227TriangleData1808.coefficient161_226,
  OriginalRow227TriangleData1808.coefficient161_227,
  OriginalRow227TriangleData1808.coefficient161_228,
  OriginalRow227TriangleData1808.coefficient161_229,
  OriginalRow227TriangleData1808.coefficient161_230,
  OriginalRow227TriangleData1808.coefficient161_231,
  OriginalRow227TriangleData1808.coefficient161_232,
  OriginalRow227TriangleData1808.coefficient161_233,
  OriginalRow227TriangleData1808.coefficient161_234,
  OriginalRow227TriangleData1808.coefficient161_235,
  OriginalRow227TriangleData1808.coefficient161_236,
  OriginalRow227TriangleData1808.coefficient161_237,
  OriginalRow227TriangleData1808.coefficient161_238,
  OriginalRow227TriangleData1808.coefficient161_239,
  OriginalRow227TriangleData1808.coefficient161_240,
  OriginalRow227TriangleData1808.coefficient161_241,
  OriginalRow227TriangleData1808.coefficient161_242,
  OriginalRow227TriangleData1808.coefficient161_243,
  OriginalRow227TriangleData1808.coefficient161_244,
  OriginalRow227TriangleData1808.coefficient161_245,
  OriginalRow227TriangleData1808.coefficient161_246,
  OriginalRow227TriangleData1808.coefficient161_247,
  OriginalRow227TriangleData1808.coefficient161_248,
  OriginalRow227TriangleData1808.coefficient161_249,
  OriginalRow227TriangleData1808.coefficient161_250,
  OriginalRow227TriangleData1808.coefficient161_251,
  OriginalRow227TriangleData1808.coefficient161_252,
  OriginalRow227TriangleData1808.coefficient161_253,
  OriginalRow227TriangleData1808.coefficient161_254,
  OriginalRow227TriangleData1808.coefficient161_255
]

theorem values1808_size : values1808.size = 32 := rfl

def block1808 : ℕ → Option IntervalDyadic := segment 224 values1808

theorem block1808_domain : ExactDomain block1808 224 256 := by
  simpa only [values1808_size] using segment_domain 224 values1808

theorem block1808_get (i : Fin 32) :
    block1808 (224 + i.val) = some (values1808[i.val]'(by rw [values1808_size]; exact i.isLt)) := by
  exact segment_get 224 values1808 ⟨i.val, by rw [values1808_size]; exact i.isLt⟩

def values1809 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1809.coefficient161_256,
  OriginalRow227TriangleData1809.coefficient161_257,
  OriginalRow227TriangleData1809.coefficient161_258,
  OriginalRow227TriangleData1809.coefficient161_259,
  OriginalRow227TriangleData1809.coefficient161_260,
  OriginalRow227TriangleData1809.coefficient161_261,
  OriginalRow227TriangleData1809.coefficient161_262,
  OriginalRow227TriangleData1809.coefficient161_263,
  OriginalRow227TriangleData1809.coefficient161_264,
  OriginalRow227TriangleData1809.coefficient161_265,
  OriginalRow227TriangleData1809.coefficient161_266,
  OriginalRow227TriangleData1809.coefficient161_267,
  OriginalRow227TriangleData1809.coefficient161_268,
  OriginalRow227TriangleData1809.coefficient161_269,
  OriginalRow227TriangleData1809.coefficient161_270,
  OriginalRow227TriangleData1809.coefficient161_271,
  OriginalRow227TriangleData1809.coefficient161_272,
  OriginalRow227TriangleData1809.coefficient161_273,
  OriginalRow227TriangleData1809.coefficient161_274,
  OriginalRow227TriangleData1809.coefficient161_275,
  OriginalRow227TriangleData1809.coefficient161_276,
  OriginalRow227TriangleData1809.coefficient161_277,
  OriginalRow227TriangleData1809.coefficient161_278,
  OriginalRow227TriangleData1809.coefficient161_279,
  OriginalRow227TriangleData1809.coefficient161_280,
  OriginalRow227TriangleData1809.coefficient161_281,
  OriginalRow227TriangleData1809.coefficient161_282,
  OriginalRow227TriangleData1809.coefficient161_283,
  OriginalRow227TriangleData1809.coefficient161_284,
  OriginalRow227TriangleData1809.coefficient161_285,
  OriginalRow227TriangleData1809.coefficient161_286,
  OriginalRow227TriangleData1809.coefficient161_287
]

theorem values1809_size : values1809.size = 32 := rfl

def block1809 : ℕ → Option IntervalDyadic := segment 256 values1809

theorem block1809_domain : ExactDomain block1809 256 288 := by
  simpa only [values1809_size] using segment_domain 256 values1809

theorem block1809_get (i : Fin 32) :
    block1809 (256 + i.val) = some (values1809[i.val]'(by rw [values1809_size]; exact i.isLt)) := by
  exact segment_get 256 values1809 ⟨i.val, by rw [values1809_size]; exact i.isLt⟩

def values1810 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1810.coefficient161_288,
  OriginalRow227TriangleData1810.coefficient161_289,
  OriginalRow227TriangleData1810.coefficient161_290,
  OriginalRow227TriangleData1810.coefficient161_291,
  OriginalRow227TriangleData1810.coefficient161_292,
  OriginalRow227TriangleData1810.coefficient161_293,
  OriginalRow227TriangleData1810.coefficient161_294,
  OriginalRow227TriangleData1810.coefficient161_295,
  OriginalRow227TriangleData1810.coefficient161_296,
  OriginalRow227TriangleData1810.coefficient161_297,
  OriginalRow227TriangleData1810.coefficient161_298,
  OriginalRow227TriangleData1810.coefficient161_299,
  OriginalRow227TriangleData1810.coefficient161_300,
  OriginalRow227TriangleData1810.coefficient161_301,
  OriginalRow227TriangleData1810.coefficient161_302,
  OriginalRow227TriangleData1810.coefficient161_303,
  OriginalRow227TriangleData1810.coefficient161_304,
  OriginalRow227TriangleData1810.coefficient161_305,
  OriginalRow227TriangleData1810.coefficient161_306,
  OriginalRow227TriangleData1810.coefficient161_307,
  OriginalRow227TriangleData1810.coefficient161_308,
  OriginalRow227TriangleData1810.coefficient161_309,
  OriginalRow227TriangleData1810.coefficient161_310,
  OriginalRow227TriangleData1810.coefficient161_311,
  OriginalRow227TriangleData1810.coefficient161_312,
  OriginalRow227TriangleData1810.coefficient161_313,
  OriginalRow227TriangleData1810.coefficient161_314,
  OriginalRow227TriangleData1810.coefficient161_315,
  OriginalRow227TriangleData1810.coefficient161_316,
  OriginalRow227TriangleData1810.coefficient161_317,
  OriginalRow227TriangleData1810.coefficient161_318,
  OriginalRow227TriangleData1810.coefficient161_319
]

theorem values1810_size : values1810.size = 32 := rfl

def block1810 : ℕ → Option IntervalDyadic := segment 288 values1810

theorem block1810_domain : ExactDomain block1810 288 320 := by
  simpa only [values1810_size] using segment_domain 288 values1810

theorem block1810_get (i : Fin 32) :
    block1810 (288 + i.val) = some (values1810[i.val]'(by rw [values1810_size]; exact i.isLt)) := by
  exact segment_get 288 values1810 ⟨i.val, by rw [values1810_size]; exact i.isLt⟩

def values1811 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1811.coefficient161_320,
  OriginalRow227TriangleData1811.coefficient161_321,
  OriginalRow227TriangleData1811.coefficient161_322,
  OriginalRow227TriangleData1811.coefficient161_323,
  OriginalRow227TriangleData1811.coefficient161_324,
  OriginalRow227TriangleData1811.coefficient161_325,
  OriginalRow227TriangleData1811.coefficient161_326,
  OriginalRow227TriangleData1811.coefficient161_327,
  OriginalRow227TriangleData1811.coefficient161_328,
  OriginalRow227TriangleData1811.coefficient161_329,
  OriginalRow227TriangleData1811.coefficient161_330,
  OriginalRow227TriangleData1811.coefficient161_331,
  OriginalRow227TriangleData1811.coefficient161_332,
  OriginalRow227TriangleData1811.coefficient161_333,
  OriginalRow227TriangleData1811.coefficient161_334,
  OriginalRow227TriangleData1811.coefficient161_335,
  OriginalRow227TriangleData1811.coefficient161_336,
  OriginalRow227TriangleData1811.coefficient161_337,
  OriginalRow227TriangleData1811.coefficient161_338,
  OriginalRow227TriangleData1811.coefficient161_339,
  OriginalRow227TriangleData1811.coefficient161_340
]

theorem values1811_size : values1811.size = 21 := rfl

def block1811 : ℕ → Option IntervalDyadic := segment 320 values1811

theorem block1811_domain : ExactDomain block1811 320 341 := by
  simpa only [values1811_size] using segment_domain 320 values1811

theorem block1811_get (i : Fin 21) :
    block1811 (320 + i.val) = some (values1811[i.val]'(by rw [values1811_size]; exact i.isLt)) := by
  exact segment_get 320 values1811 ⟨i.val, by rw [values1811_size]; exact i.isLt⟩

def node0192_0256 : ℕ → Option IntervalDyadic := split 224 block1807 block1808

theorem node0192_0256_domain : ExactDomain node0192_0256 192 256 := by
  exact split_domain (by decide) (by decide) block1807_domain block1808_domain

def node0160_0256 : ℕ → Option IntervalDyadic := split 192 block1806 node0192_0256

theorem node0160_0256_domain : ExactDomain node0160_0256 160 256 := by
  exact split_domain (by decide) (by decide) block1806_domain node0192_0256_domain

def node0288_0341 : ℕ → Option IntervalDyadic := split 320 block1810 block1811

theorem node0288_0341_domain : ExactDomain node0288_0341 288 341 := by
  exact split_domain (by decide) (by decide) block1810_domain block1811_domain

def node0256_0341 : ℕ → Option IntervalDyadic := split 288 block1809 node0288_0341

theorem node0256_0341_domain : ExactDomain node0256_0341 256 341 := by
  exact split_domain (by decide) (by decide) block1809_domain node0288_0341_domain

def node0160_0341 : ℕ → Option IntervalDyadic := split 256 node0160_0256 node0256_0341

theorem node0160_0341_domain : ExactDomain node0160_0341 160 341 := by
  exact split_domain (by decide) (by decide) node0160_0256_domain node0256_0341_domain

def lookup : ℕ → Option IntervalDyadic := node0160_0341

theorem lookup_domain : ExactDomain lookup 160 341 :=
  node0160_0341_domain

theorem block1806_lookup (i : Fin 32) :
    lookup (160 + i.val) = some (values1806[i.val]'(by rw [values1806_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0160_0341 (160 + i.val) = _
  rw [node0160_0341, split_left 256 node0160_0256 node0256_0341 (by omega)]
  rw [node0160_0256, split_left 192 block1806 node0192_0256 (by omega)]
  exact block1806_get i

theorem block1807_lookup (i : Fin 32) :
    lookup (192 + i.val) = some (values1807[i.val]'(by rw [values1807_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0160_0341 (192 + i.val) = _
  rw [node0160_0341, split_left 256 node0160_0256 node0256_0341 (by omega)]
  rw [node0160_0256, split_right 192 block1806 node0192_0256 (by omega)]
  rw [node0192_0256, split_left 224 block1807 block1808 (by omega)]
  exact block1807_get i

theorem block1808_lookup (i : Fin 32) :
    lookup (224 + i.val) = some (values1808[i.val]'(by rw [values1808_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0160_0341 (224 + i.val) = _
  rw [node0160_0341, split_left 256 node0160_0256 node0256_0341 (by omega)]
  rw [node0160_0256, split_right 192 block1806 node0192_0256 (by omega)]
  rw [node0192_0256, split_right 224 block1807 block1808 (by omega)]
  exact block1808_get i

theorem block1809_lookup (i : Fin 32) :
    lookup (256 + i.val) = some (values1809[i.val]'(by rw [values1809_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0160_0341 (256 + i.val) = _
  rw [node0160_0341, split_right 256 node0160_0256 node0256_0341 (by omega)]
  rw [node0256_0341, split_left 288 block1809 node0288_0341 (by omega)]
  exact block1809_get i

theorem block1810_lookup (i : Fin 32) :
    lookup (288 + i.val) = some (values1810[i.val]'(by rw [values1810_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0160_0341 (288 + i.val) = _
  rw [node0160_0341, split_right 256 node0160_0256 node0256_0341 (by omega)]
  rw [node0256_0341, split_right 288 block1809 node0288_0341 (by omega)]
  rw [node0288_0341, split_left 320 block1810 block1811 (by omega)]
  exact block1810_get i

theorem block1811_lookup (i : Fin 21) :
    lookup (320 + i.val) = some (values1811[i.val]'(by rw [values1811_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0160_0341 (320 + i.val) = _
  rw [node0160_0341, split_right 256 node0160_0256 node0256_0341 (by omega)]
  rw [node0256_0341, split_right 288 block1809 node0288_0341 (by omega)]
  rw [node0288_0341, split_right 320 block1810 block1811 (by omega)]
  exact block1811_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1806_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1806_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1807_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1807_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1808_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1808_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1809_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1809_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1810_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1810_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1811_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1811_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1806_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1807_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1808_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1809_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1810_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow161.block1811_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow161
