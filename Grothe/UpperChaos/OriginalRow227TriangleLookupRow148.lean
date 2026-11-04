import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1720
import Grothe.UpperChaos.OriginalRow227TriangleData1721
import Grothe.UpperChaos.OriginalRow227TriangleData1722
import Grothe.UpperChaos.OriginalRow227TriangleData1723
import Grothe.UpperChaos.OriginalRow227TriangleData1724
import Grothe.UpperChaos.OriginalRow227TriangleData1725
import Grothe.UpperChaos.OriginalRow227TriangleData1726

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow148

open ConditionalTableLookup

def values1720 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1720.coefficient148_147,
  OriginalRow227TriangleData1720.coefficient148_148,
  OriginalRow227TriangleData1720.coefficient148_149,
  OriginalRow227TriangleData1720.coefficient148_150,
  OriginalRow227TriangleData1720.coefficient148_151,
  OriginalRow227TriangleData1720.coefficient148_152,
  OriginalRow227TriangleData1720.coefficient148_153,
  OriginalRow227TriangleData1720.coefficient148_154,
  OriginalRow227TriangleData1720.coefficient148_155,
  OriginalRow227TriangleData1720.coefficient148_156,
  OriginalRow227TriangleData1720.coefficient148_157,
  OriginalRow227TriangleData1720.coefficient148_158,
  OriginalRow227TriangleData1720.coefficient148_159,
  OriginalRow227TriangleData1720.coefficient148_160,
  OriginalRow227TriangleData1720.coefficient148_161,
  OriginalRow227TriangleData1720.coefficient148_162,
  OriginalRow227TriangleData1720.coefficient148_163,
  OriginalRow227TriangleData1720.coefficient148_164,
  OriginalRow227TriangleData1720.coefficient148_165,
  OriginalRow227TriangleData1720.coefficient148_166,
  OriginalRow227TriangleData1720.coefficient148_167,
  OriginalRow227TriangleData1720.coefficient148_168,
  OriginalRow227TriangleData1720.coefficient148_169,
  OriginalRow227TriangleData1720.coefficient148_170,
  OriginalRow227TriangleData1720.coefficient148_171,
  OriginalRow227TriangleData1720.coefficient148_172,
  OriginalRow227TriangleData1720.coefficient148_173,
  OriginalRow227TriangleData1720.coefficient148_174,
  OriginalRow227TriangleData1720.coefficient148_175,
  OriginalRow227TriangleData1720.coefficient148_176,
  OriginalRow227TriangleData1720.coefficient148_177,
  OriginalRow227TriangleData1720.coefficient148_178
]

theorem values1720_size : values1720.size = 32 := rfl

def block1720 : ℕ → Option IntervalDyadic := segment 147 values1720

theorem block1720_domain : ExactDomain block1720 147 179 := by
  simpa only [values1720_size] using segment_domain 147 values1720

theorem block1720_get (i : Fin 32) :
    block1720 (147 + i.val) = some (values1720[i.val]'(by rw [values1720_size]; exact i.isLt)) := by
  exact segment_get 147 values1720 ⟨i.val, by rw [values1720_size]; exact i.isLt⟩

def values1721 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1721.coefficient148_179,
  OriginalRow227TriangleData1721.coefficient148_180,
  OriginalRow227TriangleData1721.coefficient148_181,
  OriginalRow227TriangleData1721.coefficient148_182,
  OriginalRow227TriangleData1721.coefficient148_183,
  OriginalRow227TriangleData1721.coefficient148_184,
  OriginalRow227TriangleData1721.coefficient148_185,
  OriginalRow227TriangleData1721.coefficient148_186,
  OriginalRow227TriangleData1721.coefficient148_187,
  OriginalRow227TriangleData1721.coefficient148_188,
  OriginalRow227TriangleData1721.coefficient148_189,
  OriginalRow227TriangleData1721.coefficient148_190,
  OriginalRow227TriangleData1721.coefficient148_191,
  OriginalRow227TriangleData1721.coefficient148_192,
  OriginalRow227TriangleData1721.coefficient148_193,
  OriginalRow227TriangleData1721.coefficient148_194,
  OriginalRow227TriangleData1721.coefficient148_195,
  OriginalRow227TriangleData1721.coefficient148_196,
  OriginalRow227TriangleData1721.coefficient148_197,
  OriginalRow227TriangleData1721.coefficient148_198,
  OriginalRow227TriangleData1721.coefficient148_199,
  OriginalRow227TriangleData1721.coefficient148_200,
  OriginalRow227TriangleData1721.coefficient148_201,
  OriginalRow227TriangleData1721.coefficient148_202,
  OriginalRow227TriangleData1721.coefficient148_203,
  OriginalRow227TriangleData1721.coefficient148_204,
  OriginalRow227TriangleData1721.coefficient148_205,
  OriginalRow227TriangleData1721.coefficient148_206,
  OriginalRow227TriangleData1721.coefficient148_207,
  OriginalRow227TriangleData1721.coefficient148_208,
  OriginalRow227TriangleData1721.coefficient148_209,
  OriginalRow227TriangleData1721.coefficient148_210
]

theorem values1721_size : values1721.size = 32 := rfl

def block1721 : ℕ → Option IntervalDyadic := segment 179 values1721

theorem block1721_domain : ExactDomain block1721 179 211 := by
  simpa only [values1721_size] using segment_domain 179 values1721

theorem block1721_get (i : Fin 32) :
    block1721 (179 + i.val) = some (values1721[i.val]'(by rw [values1721_size]; exact i.isLt)) := by
  exact segment_get 179 values1721 ⟨i.val, by rw [values1721_size]; exact i.isLt⟩

def values1722 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1722.coefficient148_211,
  OriginalRow227TriangleData1722.coefficient148_212,
  OriginalRow227TriangleData1722.coefficient148_213,
  OriginalRow227TriangleData1722.coefficient148_214,
  OriginalRow227TriangleData1722.coefficient148_215,
  OriginalRow227TriangleData1722.coefficient148_216,
  OriginalRow227TriangleData1722.coefficient148_217,
  OriginalRow227TriangleData1722.coefficient148_218,
  OriginalRow227TriangleData1722.coefficient148_219,
  OriginalRow227TriangleData1722.coefficient148_220,
  OriginalRow227TriangleData1722.coefficient148_221,
  OriginalRow227TriangleData1722.coefficient148_222,
  OriginalRow227TriangleData1722.coefficient148_223,
  OriginalRow227TriangleData1722.coefficient148_224,
  OriginalRow227TriangleData1722.coefficient148_225,
  OriginalRow227TriangleData1722.coefficient148_226,
  OriginalRow227TriangleData1722.coefficient148_227,
  OriginalRow227TriangleData1722.coefficient148_228,
  OriginalRow227TriangleData1722.coefficient148_229,
  OriginalRow227TriangleData1722.coefficient148_230,
  OriginalRow227TriangleData1722.coefficient148_231,
  OriginalRow227TriangleData1722.coefficient148_232,
  OriginalRow227TriangleData1722.coefficient148_233,
  OriginalRow227TriangleData1722.coefficient148_234,
  OriginalRow227TriangleData1722.coefficient148_235,
  OriginalRow227TriangleData1722.coefficient148_236,
  OriginalRow227TriangleData1722.coefficient148_237,
  OriginalRow227TriangleData1722.coefficient148_238,
  OriginalRow227TriangleData1722.coefficient148_239,
  OriginalRow227TriangleData1722.coefficient148_240,
  OriginalRow227TriangleData1722.coefficient148_241,
  OriginalRow227TriangleData1722.coefficient148_242
]

theorem values1722_size : values1722.size = 32 := rfl

def block1722 : ℕ → Option IntervalDyadic := segment 211 values1722

theorem block1722_domain : ExactDomain block1722 211 243 := by
  simpa only [values1722_size] using segment_domain 211 values1722

theorem block1722_get (i : Fin 32) :
    block1722 (211 + i.val) = some (values1722[i.val]'(by rw [values1722_size]; exact i.isLt)) := by
  exact segment_get 211 values1722 ⟨i.val, by rw [values1722_size]; exact i.isLt⟩

def values1723 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1723.coefficient148_243,
  OriginalRow227TriangleData1723.coefficient148_244,
  OriginalRow227TriangleData1723.coefficient148_245,
  OriginalRow227TriangleData1723.coefficient148_246,
  OriginalRow227TriangleData1723.coefficient148_247,
  OriginalRow227TriangleData1723.coefficient148_248,
  OriginalRow227TriangleData1723.coefficient148_249,
  OriginalRow227TriangleData1723.coefficient148_250,
  OriginalRow227TriangleData1723.coefficient148_251,
  OriginalRow227TriangleData1723.coefficient148_252,
  OriginalRow227TriangleData1723.coefficient148_253,
  OriginalRow227TriangleData1723.coefficient148_254,
  OriginalRow227TriangleData1723.coefficient148_255,
  OriginalRow227TriangleData1723.coefficient148_256,
  OriginalRow227TriangleData1723.coefficient148_257,
  OriginalRow227TriangleData1723.coefficient148_258,
  OriginalRow227TriangleData1723.coefficient148_259,
  OriginalRow227TriangleData1723.coefficient148_260,
  OriginalRow227TriangleData1723.coefficient148_261,
  OriginalRow227TriangleData1723.coefficient148_262,
  OriginalRow227TriangleData1723.coefficient148_263,
  OriginalRow227TriangleData1723.coefficient148_264,
  OriginalRow227TriangleData1723.coefficient148_265,
  OriginalRow227TriangleData1723.coefficient148_266,
  OriginalRow227TriangleData1723.coefficient148_267,
  OriginalRow227TriangleData1723.coefficient148_268,
  OriginalRow227TriangleData1723.coefficient148_269,
  OriginalRow227TriangleData1723.coefficient148_270,
  OriginalRow227TriangleData1723.coefficient148_271,
  OriginalRow227TriangleData1723.coefficient148_272,
  OriginalRow227TriangleData1723.coefficient148_273,
  OriginalRow227TriangleData1723.coefficient148_274
]

theorem values1723_size : values1723.size = 32 := rfl

def block1723 : ℕ → Option IntervalDyadic := segment 243 values1723

theorem block1723_domain : ExactDomain block1723 243 275 := by
  simpa only [values1723_size] using segment_domain 243 values1723

theorem block1723_get (i : Fin 32) :
    block1723 (243 + i.val) = some (values1723[i.val]'(by rw [values1723_size]; exact i.isLt)) := by
  exact segment_get 243 values1723 ⟨i.val, by rw [values1723_size]; exact i.isLt⟩

def values1724 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1724.coefficient148_275,
  OriginalRow227TriangleData1724.coefficient148_276,
  OriginalRow227TriangleData1724.coefficient148_277,
  OriginalRow227TriangleData1724.coefficient148_278,
  OriginalRow227TriangleData1724.coefficient148_279,
  OriginalRow227TriangleData1724.coefficient148_280,
  OriginalRow227TriangleData1724.coefficient148_281,
  OriginalRow227TriangleData1724.coefficient148_282,
  OriginalRow227TriangleData1724.coefficient148_283,
  OriginalRow227TriangleData1724.coefficient148_284,
  OriginalRow227TriangleData1724.coefficient148_285,
  OriginalRow227TriangleData1724.coefficient148_286,
  OriginalRow227TriangleData1724.coefficient148_287,
  OriginalRow227TriangleData1724.coefficient148_288,
  OriginalRow227TriangleData1724.coefficient148_289,
  OriginalRow227TriangleData1724.coefficient148_290,
  OriginalRow227TriangleData1724.coefficient148_291,
  OriginalRow227TriangleData1724.coefficient148_292,
  OriginalRow227TriangleData1724.coefficient148_293,
  OriginalRow227TriangleData1724.coefficient148_294,
  OriginalRow227TriangleData1724.coefficient148_295,
  OriginalRow227TriangleData1724.coefficient148_296,
  OriginalRow227TriangleData1724.coefficient148_297,
  OriginalRow227TriangleData1724.coefficient148_298,
  OriginalRow227TriangleData1724.coefficient148_299,
  OriginalRow227TriangleData1724.coefficient148_300,
  OriginalRow227TriangleData1724.coefficient148_301,
  OriginalRow227TriangleData1724.coefficient148_302,
  OriginalRow227TriangleData1724.coefficient148_303,
  OriginalRow227TriangleData1724.coefficient148_304,
  OriginalRow227TriangleData1724.coefficient148_305,
  OriginalRow227TriangleData1724.coefficient148_306
]

theorem values1724_size : values1724.size = 32 := rfl

def block1724 : ℕ → Option IntervalDyadic := segment 275 values1724

theorem block1724_domain : ExactDomain block1724 275 307 := by
  simpa only [values1724_size] using segment_domain 275 values1724

theorem block1724_get (i : Fin 32) :
    block1724 (275 + i.val) = some (values1724[i.val]'(by rw [values1724_size]; exact i.isLt)) := by
  exact segment_get 275 values1724 ⟨i.val, by rw [values1724_size]; exact i.isLt⟩

def values1725 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1725.coefficient148_307,
  OriginalRow227TriangleData1725.coefficient148_308,
  OriginalRow227TriangleData1725.coefficient148_309,
  OriginalRow227TriangleData1725.coefficient148_310,
  OriginalRow227TriangleData1725.coefficient148_311,
  OriginalRow227TriangleData1725.coefficient148_312,
  OriginalRow227TriangleData1725.coefficient148_313,
  OriginalRow227TriangleData1725.coefficient148_314,
  OriginalRow227TriangleData1725.coefficient148_315,
  OriginalRow227TriangleData1725.coefficient148_316,
  OriginalRow227TriangleData1725.coefficient148_317,
  OriginalRow227TriangleData1725.coefficient148_318,
  OriginalRow227TriangleData1725.coefficient148_319,
  OriginalRow227TriangleData1725.coefficient148_320,
  OriginalRow227TriangleData1725.coefficient148_321,
  OriginalRow227TriangleData1725.coefficient148_322,
  OriginalRow227TriangleData1725.coefficient148_323,
  OriginalRow227TriangleData1725.coefficient148_324,
  OriginalRow227TriangleData1725.coefficient148_325,
  OriginalRow227TriangleData1725.coefficient148_326,
  OriginalRow227TriangleData1725.coefficient148_327,
  OriginalRow227TriangleData1725.coefficient148_328,
  OriginalRow227TriangleData1725.coefficient148_329,
  OriginalRow227TriangleData1725.coefficient148_330,
  OriginalRow227TriangleData1725.coefficient148_331,
  OriginalRow227TriangleData1725.coefficient148_332,
  OriginalRow227TriangleData1725.coefficient148_333,
  OriginalRow227TriangleData1725.coefficient148_334,
  OriginalRow227TriangleData1725.coefficient148_335,
  OriginalRow227TriangleData1725.coefficient148_336,
  OriginalRow227TriangleData1725.coefficient148_337,
  OriginalRow227TriangleData1725.coefficient148_338
]

theorem values1725_size : values1725.size = 32 := rfl

def block1725 : ℕ → Option IntervalDyadic := segment 307 values1725

theorem block1725_domain : ExactDomain block1725 307 339 := by
  simpa only [values1725_size] using segment_domain 307 values1725

theorem block1725_get (i : Fin 32) :
    block1725 (307 + i.val) = some (values1725[i.val]'(by rw [values1725_size]; exact i.isLt)) := by
  exact segment_get 307 values1725 ⟨i.val, by rw [values1725_size]; exact i.isLt⟩

def values1726 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1726.coefficient148_339,
  OriginalRow227TriangleData1726.coefficient148_340,
  OriginalRow227TriangleData1726.coefficient148_341,
  OriginalRow227TriangleData1726.coefficient148_342,
  OriginalRow227TriangleData1726.coefficient148_343,
  OriginalRow227TriangleData1726.coefficient148_344,
  OriginalRow227TriangleData1726.coefficient148_345,
  OriginalRow227TriangleData1726.coefficient148_346,
  OriginalRow227TriangleData1726.coefficient148_347,
  OriginalRow227TriangleData1726.coefficient148_348,
  OriginalRow227TriangleData1726.coefficient148_349,
  OriginalRow227TriangleData1726.coefficient148_350,
  OriginalRow227TriangleData1726.coefficient148_351,
  OriginalRow227TriangleData1726.coefficient148_352,
  OriginalRow227TriangleData1726.coefficient148_353
]

theorem values1726_size : values1726.size = 15 := rfl

def block1726 : ℕ → Option IntervalDyadic := segment 339 values1726

theorem block1726_domain : ExactDomain block1726 339 354 := by
  simpa only [values1726_size] using segment_domain 339 values1726

theorem block1726_get (i : Fin 15) :
    block1726 (339 + i.val) = some (values1726[i.val]'(by rw [values1726_size]; exact i.isLt)) := by
  exact segment_get 339 values1726 ⟨i.val, by rw [values1726_size]; exact i.isLt⟩

def node0179_0243 : ℕ → Option IntervalDyadic := split 211 block1721 block1722

theorem node0179_0243_domain : ExactDomain node0179_0243 179 243 := by
  exact split_domain (by decide) (by decide) block1721_domain block1722_domain

def node0147_0243 : ℕ → Option IntervalDyadic := split 179 block1720 node0179_0243

theorem node0147_0243_domain : ExactDomain node0147_0243 147 243 := by
  exact split_domain (by decide) (by decide) block1720_domain node0179_0243_domain

def node0243_0307 : ℕ → Option IntervalDyadic := split 275 block1723 block1724

theorem node0243_0307_domain : ExactDomain node0243_0307 243 307 := by
  exact split_domain (by decide) (by decide) block1723_domain block1724_domain

def node0307_0354 : ℕ → Option IntervalDyadic := split 339 block1725 block1726

theorem node0307_0354_domain : ExactDomain node0307_0354 307 354 := by
  exact split_domain (by decide) (by decide) block1725_domain block1726_domain

def node0243_0354 : ℕ → Option IntervalDyadic := split 307 node0243_0307 node0307_0354

theorem node0243_0354_domain : ExactDomain node0243_0354 243 354 := by
  exact split_domain (by decide) (by decide) node0243_0307_domain node0307_0354_domain

def node0147_0354 : ℕ → Option IntervalDyadic := split 243 node0147_0243 node0243_0354

theorem node0147_0354_domain : ExactDomain node0147_0354 147 354 := by
  exact split_domain (by decide) (by decide) node0147_0243_domain node0243_0354_domain

def lookup : ℕ → Option IntervalDyadic := node0147_0354

theorem lookup_domain : ExactDomain lookup 147 354 :=
  node0147_0354_domain

theorem block1720_lookup (i : Fin 32) :
    lookup (147 + i.val) = some (values1720[i.val]'(by rw [values1720_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0147_0354 (147 + i.val) = _
  rw [node0147_0354, split_left 243 node0147_0243 node0243_0354 (by omega)]
  rw [node0147_0243, split_left 179 block1720 node0179_0243 (by omega)]
  exact block1720_get i

theorem block1721_lookup (i : Fin 32) :
    lookup (179 + i.val) = some (values1721[i.val]'(by rw [values1721_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0147_0354 (179 + i.val) = _
  rw [node0147_0354, split_left 243 node0147_0243 node0243_0354 (by omega)]
  rw [node0147_0243, split_right 179 block1720 node0179_0243 (by omega)]
  rw [node0179_0243, split_left 211 block1721 block1722 (by omega)]
  exact block1721_get i

theorem block1722_lookup (i : Fin 32) :
    lookup (211 + i.val) = some (values1722[i.val]'(by rw [values1722_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0147_0354 (211 + i.val) = _
  rw [node0147_0354, split_left 243 node0147_0243 node0243_0354 (by omega)]
  rw [node0147_0243, split_right 179 block1720 node0179_0243 (by omega)]
  rw [node0179_0243, split_right 211 block1721 block1722 (by omega)]
  exact block1722_get i

theorem block1723_lookup (i : Fin 32) :
    lookup (243 + i.val) = some (values1723[i.val]'(by rw [values1723_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0147_0354 (243 + i.val) = _
  rw [node0147_0354, split_right 243 node0147_0243 node0243_0354 (by omega)]
  rw [node0243_0354, split_left 307 node0243_0307 node0307_0354 (by omega)]
  rw [node0243_0307, split_left 275 block1723 block1724 (by omega)]
  exact block1723_get i

theorem block1724_lookup (i : Fin 32) :
    lookup (275 + i.val) = some (values1724[i.val]'(by rw [values1724_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0147_0354 (275 + i.val) = _
  rw [node0147_0354, split_right 243 node0147_0243 node0243_0354 (by omega)]
  rw [node0243_0354, split_left 307 node0243_0307 node0307_0354 (by omega)]
  rw [node0243_0307, split_right 275 block1723 block1724 (by omega)]
  exact block1724_get i

theorem block1725_lookup (i : Fin 32) :
    lookup (307 + i.val) = some (values1725[i.val]'(by rw [values1725_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0147_0354 (307 + i.val) = _
  rw [node0147_0354, split_right 243 node0147_0243 node0243_0354 (by omega)]
  rw [node0243_0354, split_right 307 node0243_0307 node0307_0354 (by omega)]
  rw [node0307_0354, split_left 339 block1725 block1726 (by omega)]
  exact block1725_get i

theorem block1726_lookup (i : Fin 15) :
    lookup (339 + i.val) = some (values1726[i.val]'(by rw [values1726_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0147_0354 (339 + i.val) = _
  rw [node0147_0354, split_right 243 node0147_0243 node0243_0354 (by omega)]
  rw [node0243_0354, split_right 307 node0243_0307 node0307_0354 (by omega)]
  rw [node0307_0354, split_right 339 block1725 block1726 (by omega)]
  exact block1726_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1720_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1720_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1721_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1721_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1722_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1722_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1723_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1723_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1724_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1724_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1725_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1725_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1726_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1726_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1720_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1721_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1722_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1723_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1724_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1725_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow148.block1726_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow148
