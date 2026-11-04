import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1706
import Grothe.UpperChaos.OriginalRow227TriangleData1707
import Grothe.UpperChaos.OriginalRow227TriangleData1708
import Grothe.UpperChaos.OriginalRow227TriangleData1709
import Grothe.UpperChaos.OriginalRow227TriangleData1710
import Grothe.UpperChaos.OriginalRow227TriangleData1711
import Grothe.UpperChaos.OriginalRow227TriangleData1712

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow146

open ConditionalTableLookup

def values1706 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1706.coefficient146_145,
  OriginalRow227TriangleData1706.coefficient146_146,
  OriginalRow227TriangleData1706.coefficient146_147,
  OriginalRow227TriangleData1706.coefficient146_148,
  OriginalRow227TriangleData1706.coefficient146_149,
  OriginalRow227TriangleData1706.coefficient146_150,
  OriginalRow227TriangleData1706.coefficient146_151,
  OriginalRow227TriangleData1706.coefficient146_152,
  OriginalRow227TriangleData1706.coefficient146_153,
  OriginalRow227TriangleData1706.coefficient146_154,
  OriginalRow227TriangleData1706.coefficient146_155,
  OriginalRow227TriangleData1706.coefficient146_156,
  OriginalRow227TriangleData1706.coefficient146_157,
  OriginalRow227TriangleData1706.coefficient146_158,
  OriginalRow227TriangleData1706.coefficient146_159,
  OriginalRow227TriangleData1706.coefficient146_160,
  OriginalRow227TriangleData1706.coefficient146_161,
  OriginalRow227TriangleData1706.coefficient146_162,
  OriginalRow227TriangleData1706.coefficient146_163,
  OriginalRow227TriangleData1706.coefficient146_164,
  OriginalRow227TriangleData1706.coefficient146_165,
  OriginalRow227TriangleData1706.coefficient146_166,
  OriginalRow227TriangleData1706.coefficient146_167,
  OriginalRow227TriangleData1706.coefficient146_168,
  OriginalRow227TriangleData1706.coefficient146_169,
  OriginalRow227TriangleData1706.coefficient146_170,
  OriginalRow227TriangleData1706.coefficient146_171,
  OriginalRow227TriangleData1706.coefficient146_172,
  OriginalRow227TriangleData1706.coefficient146_173,
  OriginalRow227TriangleData1706.coefficient146_174,
  OriginalRow227TriangleData1706.coefficient146_175,
  OriginalRow227TriangleData1706.coefficient146_176
]

theorem values1706_size : values1706.size = 32 := rfl

def block1706 : ℕ → Option IntervalDyadic := segment 145 values1706

theorem block1706_domain : ExactDomain block1706 145 177 := by
  simpa only [values1706_size] using segment_domain 145 values1706

theorem block1706_get (i : Fin 32) :
    block1706 (145 + i.val) = some (values1706[i.val]'(by rw [values1706_size]; exact i.isLt)) := by
  exact segment_get 145 values1706 ⟨i.val, by rw [values1706_size]; exact i.isLt⟩

def values1707 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1707.coefficient146_177,
  OriginalRow227TriangleData1707.coefficient146_178,
  OriginalRow227TriangleData1707.coefficient146_179,
  OriginalRow227TriangleData1707.coefficient146_180,
  OriginalRow227TriangleData1707.coefficient146_181,
  OriginalRow227TriangleData1707.coefficient146_182,
  OriginalRow227TriangleData1707.coefficient146_183,
  OriginalRow227TriangleData1707.coefficient146_184,
  OriginalRow227TriangleData1707.coefficient146_185,
  OriginalRow227TriangleData1707.coefficient146_186,
  OriginalRow227TriangleData1707.coefficient146_187,
  OriginalRow227TriangleData1707.coefficient146_188,
  OriginalRow227TriangleData1707.coefficient146_189,
  OriginalRow227TriangleData1707.coefficient146_190,
  OriginalRow227TriangleData1707.coefficient146_191,
  OriginalRow227TriangleData1707.coefficient146_192,
  OriginalRow227TriangleData1707.coefficient146_193,
  OriginalRow227TriangleData1707.coefficient146_194,
  OriginalRow227TriangleData1707.coefficient146_195,
  OriginalRow227TriangleData1707.coefficient146_196,
  OriginalRow227TriangleData1707.coefficient146_197,
  OriginalRow227TriangleData1707.coefficient146_198,
  OriginalRow227TriangleData1707.coefficient146_199,
  OriginalRow227TriangleData1707.coefficient146_200,
  OriginalRow227TriangleData1707.coefficient146_201,
  OriginalRow227TriangleData1707.coefficient146_202,
  OriginalRow227TriangleData1707.coefficient146_203,
  OriginalRow227TriangleData1707.coefficient146_204,
  OriginalRow227TriangleData1707.coefficient146_205,
  OriginalRow227TriangleData1707.coefficient146_206,
  OriginalRow227TriangleData1707.coefficient146_207,
  OriginalRow227TriangleData1707.coefficient146_208
]

theorem values1707_size : values1707.size = 32 := rfl

def block1707 : ℕ → Option IntervalDyadic := segment 177 values1707

theorem block1707_domain : ExactDomain block1707 177 209 := by
  simpa only [values1707_size] using segment_domain 177 values1707

theorem block1707_get (i : Fin 32) :
    block1707 (177 + i.val) = some (values1707[i.val]'(by rw [values1707_size]; exact i.isLt)) := by
  exact segment_get 177 values1707 ⟨i.val, by rw [values1707_size]; exact i.isLt⟩

def values1708 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1708.coefficient146_209,
  OriginalRow227TriangleData1708.coefficient146_210,
  OriginalRow227TriangleData1708.coefficient146_211,
  OriginalRow227TriangleData1708.coefficient146_212,
  OriginalRow227TriangleData1708.coefficient146_213,
  OriginalRow227TriangleData1708.coefficient146_214,
  OriginalRow227TriangleData1708.coefficient146_215,
  OriginalRow227TriangleData1708.coefficient146_216,
  OriginalRow227TriangleData1708.coefficient146_217,
  OriginalRow227TriangleData1708.coefficient146_218,
  OriginalRow227TriangleData1708.coefficient146_219,
  OriginalRow227TriangleData1708.coefficient146_220,
  OriginalRow227TriangleData1708.coefficient146_221,
  OriginalRow227TriangleData1708.coefficient146_222,
  OriginalRow227TriangleData1708.coefficient146_223,
  OriginalRow227TriangleData1708.coefficient146_224,
  OriginalRow227TriangleData1708.coefficient146_225,
  OriginalRow227TriangleData1708.coefficient146_226,
  OriginalRow227TriangleData1708.coefficient146_227,
  OriginalRow227TriangleData1708.coefficient146_228,
  OriginalRow227TriangleData1708.coefficient146_229,
  OriginalRow227TriangleData1708.coefficient146_230,
  OriginalRow227TriangleData1708.coefficient146_231,
  OriginalRow227TriangleData1708.coefficient146_232,
  OriginalRow227TriangleData1708.coefficient146_233,
  OriginalRow227TriangleData1708.coefficient146_234,
  OriginalRow227TriangleData1708.coefficient146_235,
  OriginalRow227TriangleData1708.coefficient146_236,
  OriginalRow227TriangleData1708.coefficient146_237,
  OriginalRow227TriangleData1708.coefficient146_238,
  OriginalRow227TriangleData1708.coefficient146_239,
  OriginalRow227TriangleData1708.coefficient146_240
]

theorem values1708_size : values1708.size = 32 := rfl

def block1708 : ℕ → Option IntervalDyadic := segment 209 values1708

theorem block1708_domain : ExactDomain block1708 209 241 := by
  simpa only [values1708_size] using segment_domain 209 values1708

theorem block1708_get (i : Fin 32) :
    block1708 (209 + i.val) = some (values1708[i.val]'(by rw [values1708_size]; exact i.isLt)) := by
  exact segment_get 209 values1708 ⟨i.val, by rw [values1708_size]; exact i.isLt⟩

def values1709 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1709.coefficient146_241,
  OriginalRow227TriangleData1709.coefficient146_242,
  OriginalRow227TriangleData1709.coefficient146_243,
  OriginalRow227TriangleData1709.coefficient146_244,
  OriginalRow227TriangleData1709.coefficient146_245,
  OriginalRow227TriangleData1709.coefficient146_246,
  OriginalRow227TriangleData1709.coefficient146_247,
  OriginalRow227TriangleData1709.coefficient146_248,
  OriginalRow227TriangleData1709.coefficient146_249,
  OriginalRow227TriangleData1709.coefficient146_250,
  OriginalRow227TriangleData1709.coefficient146_251,
  OriginalRow227TriangleData1709.coefficient146_252,
  OriginalRow227TriangleData1709.coefficient146_253,
  OriginalRow227TriangleData1709.coefficient146_254,
  OriginalRow227TriangleData1709.coefficient146_255,
  OriginalRow227TriangleData1709.coefficient146_256,
  OriginalRow227TriangleData1709.coefficient146_257,
  OriginalRow227TriangleData1709.coefficient146_258,
  OriginalRow227TriangleData1709.coefficient146_259,
  OriginalRow227TriangleData1709.coefficient146_260,
  OriginalRow227TriangleData1709.coefficient146_261,
  OriginalRow227TriangleData1709.coefficient146_262,
  OriginalRow227TriangleData1709.coefficient146_263,
  OriginalRow227TriangleData1709.coefficient146_264,
  OriginalRow227TriangleData1709.coefficient146_265,
  OriginalRow227TriangleData1709.coefficient146_266,
  OriginalRow227TriangleData1709.coefficient146_267,
  OriginalRow227TriangleData1709.coefficient146_268,
  OriginalRow227TriangleData1709.coefficient146_269,
  OriginalRow227TriangleData1709.coefficient146_270,
  OriginalRow227TriangleData1709.coefficient146_271,
  OriginalRow227TriangleData1709.coefficient146_272
]

theorem values1709_size : values1709.size = 32 := rfl

def block1709 : ℕ → Option IntervalDyadic := segment 241 values1709

theorem block1709_domain : ExactDomain block1709 241 273 := by
  simpa only [values1709_size] using segment_domain 241 values1709

theorem block1709_get (i : Fin 32) :
    block1709 (241 + i.val) = some (values1709[i.val]'(by rw [values1709_size]; exact i.isLt)) := by
  exact segment_get 241 values1709 ⟨i.val, by rw [values1709_size]; exact i.isLt⟩

def values1710 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1710.coefficient146_273,
  OriginalRow227TriangleData1710.coefficient146_274,
  OriginalRow227TriangleData1710.coefficient146_275,
  OriginalRow227TriangleData1710.coefficient146_276,
  OriginalRow227TriangleData1710.coefficient146_277,
  OriginalRow227TriangleData1710.coefficient146_278,
  OriginalRow227TriangleData1710.coefficient146_279,
  OriginalRow227TriangleData1710.coefficient146_280,
  OriginalRow227TriangleData1710.coefficient146_281,
  OriginalRow227TriangleData1710.coefficient146_282,
  OriginalRow227TriangleData1710.coefficient146_283,
  OriginalRow227TriangleData1710.coefficient146_284,
  OriginalRow227TriangleData1710.coefficient146_285,
  OriginalRow227TriangleData1710.coefficient146_286,
  OriginalRow227TriangleData1710.coefficient146_287,
  OriginalRow227TriangleData1710.coefficient146_288,
  OriginalRow227TriangleData1710.coefficient146_289,
  OriginalRow227TriangleData1710.coefficient146_290,
  OriginalRow227TriangleData1710.coefficient146_291,
  OriginalRow227TriangleData1710.coefficient146_292,
  OriginalRow227TriangleData1710.coefficient146_293,
  OriginalRow227TriangleData1710.coefficient146_294,
  OriginalRow227TriangleData1710.coefficient146_295,
  OriginalRow227TriangleData1710.coefficient146_296,
  OriginalRow227TriangleData1710.coefficient146_297,
  OriginalRow227TriangleData1710.coefficient146_298,
  OriginalRow227TriangleData1710.coefficient146_299,
  OriginalRow227TriangleData1710.coefficient146_300,
  OriginalRow227TriangleData1710.coefficient146_301,
  OriginalRow227TriangleData1710.coefficient146_302,
  OriginalRow227TriangleData1710.coefficient146_303,
  OriginalRow227TriangleData1710.coefficient146_304
]

theorem values1710_size : values1710.size = 32 := rfl

def block1710 : ℕ → Option IntervalDyadic := segment 273 values1710

theorem block1710_domain : ExactDomain block1710 273 305 := by
  simpa only [values1710_size] using segment_domain 273 values1710

theorem block1710_get (i : Fin 32) :
    block1710 (273 + i.val) = some (values1710[i.val]'(by rw [values1710_size]; exact i.isLt)) := by
  exact segment_get 273 values1710 ⟨i.val, by rw [values1710_size]; exact i.isLt⟩

def values1711 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1711.coefficient146_305,
  OriginalRow227TriangleData1711.coefficient146_306,
  OriginalRow227TriangleData1711.coefficient146_307,
  OriginalRow227TriangleData1711.coefficient146_308,
  OriginalRow227TriangleData1711.coefficient146_309,
  OriginalRow227TriangleData1711.coefficient146_310,
  OriginalRow227TriangleData1711.coefficient146_311,
  OriginalRow227TriangleData1711.coefficient146_312,
  OriginalRow227TriangleData1711.coefficient146_313,
  OriginalRow227TriangleData1711.coefficient146_314,
  OriginalRow227TriangleData1711.coefficient146_315,
  OriginalRow227TriangleData1711.coefficient146_316,
  OriginalRow227TriangleData1711.coefficient146_317,
  OriginalRow227TriangleData1711.coefficient146_318,
  OriginalRow227TriangleData1711.coefficient146_319,
  OriginalRow227TriangleData1711.coefficient146_320,
  OriginalRow227TriangleData1711.coefficient146_321,
  OriginalRow227TriangleData1711.coefficient146_322,
  OriginalRow227TriangleData1711.coefficient146_323,
  OriginalRow227TriangleData1711.coefficient146_324,
  OriginalRow227TriangleData1711.coefficient146_325,
  OriginalRow227TriangleData1711.coefficient146_326,
  OriginalRow227TriangleData1711.coefficient146_327,
  OriginalRow227TriangleData1711.coefficient146_328,
  OriginalRow227TriangleData1711.coefficient146_329,
  OriginalRow227TriangleData1711.coefficient146_330,
  OriginalRow227TriangleData1711.coefficient146_331,
  OriginalRow227TriangleData1711.coefficient146_332,
  OriginalRow227TriangleData1711.coefficient146_333,
  OriginalRow227TriangleData1711.coefficient146_334,
  OriginalRow227TriangleData1711.coefficient146_335,
  OriginalRow227TriangleData1711.coefficient146_336
]

theorem values1711_size : values1711.size = 32 := rfl

def block1711 : ℕ → Option IntervalDyadic := segment 305 values1711

theorem block1711_domain : ExactDomain block1711 305 337 := by
  simpa only [values1711_size] using segment_domain 305 values1711

theorem block1711_get (i : Fin 32) :
    block1711 (305 + i.val) = some (values1711[i.val]'(by rw [values1711_size]; exact i.isLt)) := by
  exact segment_get 305 values1711 ⟨i.val, by rw [values1711_size]; exact i.isLt⟩

def values1712 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1712.coefficient146_337,
  OriginalRow227TriangleData1712.coefficient146_338,
  OriginalRow227TriangleData1712.coefficient146_339,
  OriginalRow227TriangleData1712.coefficient146_340,
  OriginalRow227TriangleData1712.coefficient146_341,
  OriginalRow227TriangleData1712.coefficient146_342,
  OriginalRow227TriangleData1712.coefficient146_343,
  OriginalRow227TriangleData1712.coefficient146_344,
  OriginalRow227TriangleData1712.coefficient146_345,
  OriginalRow227TriangleData1712.coefficient146_346,
  OriginalRow227TriangleData1712.coefficient146_347,
  OriginalRow227TriangleData1712.coefficient146_348,
  OriginalRow227TriangleData1712.coefficient146_349,
  OriginalRow227TriangleData1712.coefficient146_350,
  OriginalRow227TriangleData1712.coefficient146_351,
  OriginalRow227TriangleData1712.coefficient146_352,
  OriginalRow227TriangleData1712.coefficient146_353,
  OriginalRow227TriangleData1712.coefficient146_354,
  OriginalRow227TriangleData1712.coefficient146_355
]

theorem values1712_size : values1712.size = 19 := rfl

def block1712 : ℕ → Option IntervalDyadic := segment 337 values1712

theorem block1712_domain : ExactDomain block1712 337 356 := by
  simpa only [values1712_size] using segment_domain 337 values1712

theorem block1712_get (i : Fin 19) :
    block1712 (337 + i.val) = some (values1712[i.val]'(by rw [values1712_size]; exact i.isLt)) := by
  exact segment_get 337 values1712 ⟨i.val, by rw [values1712_size]; exact i.isLt⟩

def node0177_0241 : ℕ → Option IntervalDyadic := split 209 block1707 block1708

theorem node0177_0241_domain : ExactDomain node0177_0241 177 241 := by
  exact split_domain (by decide) (by decide) block1707_domain block1708_domain

def node0145_0241 : ℕ → Option IntervalDyadic := split 177 block1706 node0177_0241

theorem node0145_0241_domain : ExactDomain node0145_0241 145 241 := by
  exact split_domain (by decide) (by decide) block1706_domain node0177_0241_domain

def node0241_0305 : ℕ → Option IntervalDyadic := split 273 block1709 block1710

theorem node0241_0305_domain : ExactDomain node0241_0305 241 305 := by
  exact split_domain (by decide) (by decide) block1709_domain block1710_domain

def node0305_0356 : ℕ → Option IntervalDyadic := split 337 block1711 block1712

theorem node0305_0356_domain : ExactDomain node0305_0356 305 356 := by
  exact split_domain (by decide) (by decide) block1711_domain block1712_domain

def node0241_0356 : ℕ → Option IntervalDyadic := split 305 node0241_0305 node0305_0356

theorem node0241_0356_domain : ExactDomain node0241_0356 241 356 := by
  exact split_domain (by decide) (by decide) node0241_0305_domain node0305_0356_domain

def node0145_0356 : ℕ → Option IntervalDyadic := split 241 node0145_0241 node0241_0356

theorem node0145_0356_domain : ExactDomain node0145_0356 145 356 := by
  exact split_domain (by decide) (by decide) node0145_0241_domain node0241_0356_domain

def lookup : ℕ → Option IntervalDyadic := node0145_0356

theorem lookup_domain : ExactDomain lookup 145 356 :=
  node0145_0356_domain

theorem block1706_lookup (i : Fin 32) :
    lookup (145 + i.val) = some (values1706[i.val]'(by rw [values1706_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0145_0356 (145 + i.val) = _
  rw [node0145_0356, split_left 241 node0145_0241 node0241_0356 (by omega)]
  rw [node0145_0241, split_left 177 block1706 node0177_0241 (by omega)]
  exact block1706_get i

theorem block1707_lookup (i : Fin 32) :
    lookup (177 + i.val) = some (values1707[i.val]'(by rw [values1707_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0145_0356 (177 + i.val) = _
  rw [node0145_0356, split_left 241 node0145_0241 node0241_0356 (by omega)]
  rw [node0145_0241, split_right 177 block1706 node0177_0241 (by omega)]
  rw [node0177_0241, split_left 209 block1707 block1708 (by omega)]
  exact block1707_get i

theorem block1708_lookup (i : Fin 32) :
    lookup (209 + i.val) = some (values1708[i.val]'(by rw [values1708_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0145_0356 (209 + i.val) = _
  rw [node0145_0356, split_left 241 node0145_0241 node0241_0356 (by omega)]
  rw [node0145_0241, split_right 177 block1706 node0177_0241 (by omega)]
  rw [node0177_0241, split_right 209 block1707 block1708 (by omega)]
  exact block1708_get i

theorem block1709_lookup (i : Fin 32) :
    lookup (241 + i.val) = some (values1709[i.val]'(by rw [values1709_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0145_0356 (241 + i.val) = _
  rw [node0145_0356, split_right 241 node0145_0241 node0241_0356 (by omega)]
  rw [node0241_0356, split_left 305 node0241_0305 node0305_0356 (by omega)]
  rw [node0241_0305, split_left 273 block1709 block1710 (by omega)]
  exact block1709_get i

theorem block1710_lookup (i : Fin 32) :
    lookup (273 + i.val) = some (values1710[i.val]'(by rw [values1710_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0145_0356 (273 + i.val) = _
  rw [node0145_0356, split_right 241 node0145_0241 node0241_0356 (by omega)]
  rw [node0241_0356, split_left 305 node0241_0305 node0305_0356 (by omega)]
  rw [node0241_0305, split_right 273 block1709 block1710 (by omega)]
  exact block1710_get i

theorem block1711_lookup (i : Fin 32) :
    lookup (305 + i.val) = some (values1711[i.val]'(by rw [values1711_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0145_0356 (305 + i.val) = _
  rw [node0145_0356, split_right 241 node0145_0241 node0241_0356 (by omega)]
  rw [node0241_0356, split_right 305 node0241_0305 node0305_0356 (by omega)]
  rw [node0305_0356, split_left 337 block1711 block1712 (by omega)]
  exact block1711_get i

theorem block1712_lookup (i : Fin 19) :
    lookup (337 + i.val) = some (values1712[i.val]'(by rw [values1712_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0145_0356 (337 + i.val) = _
  rw [node0145_0356, split_right 241 node0145_0241 node0241_0356 (by omega)]
  rw [node0241_0356, split_right 305 node0241_0305 node0305_0356 (by omega)]
  rw [node0305_0356, split_right 337 block1711 block1712 (by omega)]
  exact block1712_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1706_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1706_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1707_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1707_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1708_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1708_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1709_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1709_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1710_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1710_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1711_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1711_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1712_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1712_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1706_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1707_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1708_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1709_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1710_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1711_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow146.block1712_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow146
