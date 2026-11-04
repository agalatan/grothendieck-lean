import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1713
import Grothe.UpperChaos.OriginalRow227TriangleData1714
import Grothe.UpperChaos.OriginalRow227TriangleData1715
import Grothe.UpperChaos.OriginalRow227TriangleData1716
import Grothe.UpperChaos.OriginalRow227TriangleData1717
import Grothe.UpperChaos.OriginalRow227TriangleData1718
import Grothe.UpperChaos.OriginalRow227TriangleData1719

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow147

open ConditionalTableLookup

def values1713 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1713.coefficient147_146,
  OriginalRow227TriangleData1713.coefficient147_147,
  OriginalRow227TriangleData1713.coefficient147_148,
  OriginalRow227TriangleData1713.coefficient147_149,
  OriginalRow227TriangleData1713.coefficient147_150,
  OriginalRow227TriangleData1713.coefficient147_151,
  OriginalRow227TriangleData1713.coefficient147_152,
  OriginalRow227TriangleData1713.coefficient147_153,
  OriginalRow227TriangleData1713.coefficient147_154,
  OriginalRow227TriangleData1713.coefficient147_155,
  OriginalRow227TriangleData1713.coefficient147_156,
  OriginalRow227TriangleData1713.coefficient147_157,
  OriginalRow227TriangleData1713.coefficient147_158,
  OriginalRow227TriangleData1713.coefficient147_159,
  OriginalRow227TriangleData1713.coefficient147_160,
  OriginalRow227TriangleData1713.coefficient147_161,
  OriginalRow227TriangleData1713.coefficient147_162,
  OriginalRow227TriangleData1713.coefficient147_163,
  OriginalRow227TriangleData1713.coefficient147_164,
  OriginalRow227TriangleData1713.coefficient147_165,
  OriginalRow227TriangleData1713.coefficient147_166,
  OriginalRow227TriangleData1713.coefficient147_167,
  OriginalRow227TriangleData1713.coefficient147_168,
  OriginalRow227TriangleData1713.coefficient147_169,
  OriginalRow227TriangleData1713.coefficient147_170,
  OriginalRow227TriangleData1713.coefficient147_171,
  OriginalRow227TriangleData1713.coefficient147_172,
  OriginalRow227TriangleData1713.coefficient147_173,
  OriginalRow227TriangleData1713.coefficient147_174,
  OriginalRow227TriangleData1713.coefficient147_175,
  OriginalRow227TriangleData1713.coefficient147_176,
  OriginalRow227TriangleData1713.coefficient147_177
]

theorem values1713_size : values1713.size = 32 := rfl

def block1713 : ℕ → Option IntervalDyadic := segment 146 values1713

theorem block1713_domain : ExactDomain block1713 146 178 := by
  simpa only [values1713_size] using segment_domain 146 values1713

theorem block1713_get (i : Fin 32) :
    block1713 (146 + i.val) = some (values1713[i.val]'(by rw [values1713_size]; exact i.isLt)) := by
  exact segment_get 146 values1713 ⟨i.val, by rw [values1713_size]; exact i.isLt⟩

def values1714 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1714.coefficient147_178,
  OriginalRow227TriangleData1714.coefficient147_179,
  OriginalRow227TriangleData1714.coefficient147_180,
  OriginalRow227TriangleData1714.coefficient147_181,
  OriginalRow227TriangleData1714.coefficient147_182,
  OriginalRow227TriangleData1714.coefficient147_183,
  OriginalRow227TriangleData1714.coefficient147_184,
  OriginalRow227TriangleData1714.coefficient147_185,
  OriginalRow227TriangleData1714.coefficient147_186,
  OriginalRow227TriangleData1714.coefficient147_187,
  OriginalRow227TriangleData1714.coefficient147_188,
  OriginalRow227TriangleData1714.coefficient147_189,
  OriginalRow227TriangleData1714.coefficient147_190,
  OriginalRow227TriangleData1714.coefficient147_191,
  OriginalRow227TriangleData1714.coefficient147_192,
  OriginalRow227TriangleData1714.coefficient147_193,
  OriginalRow227TriangleData1714.coefficient147_194,
  OriginalRow227TriangleData1714.coefficient147_195,
  OriginalRow227TriangleData1714.coefficient147_196,
  OriginalRow227TriangleData1714.coefficient147_197,
  OriginalRow227TriangleData1714.coefficient147_198,
  OriginalRow227TriangleData1714.coefficient147_199,
  OriginalRow227TriangleData1714.coefficient147_200,
  OriginalRow227TriangleData1714.coefficient147_201,
  OriginalRow227TriangleData1714.coefficient147_202,
  OriginalRow227TriangleData1714.coefficient147_203,
  OriginalRow227TriangleData1714.coefficient147_204,
  OriginalRow227TriangleData1714.coefficient147_205,
  OriginalRow227TriangleData1714.coefficient147_206,
  OriginalRow227TriangleData1714.coefficient147_207,
  OriginalRow227TriangleData1714.coefficient147_208,
  OriginalRow227TriangleData1714.coefficient147_209
]

theorem values1714_size : values1714.size = 32 := rfl

def block1714 : ℕ → Option IntervalDyadic := segment 178 values1714

theorem block1714_domain : ExactDomain block1714 178 210 := by
  simpa only [values1714_size] using segment_domain 178 values1714

theorem block1714_get (i : Fin 32) :
    block1714 (178 + i.val) = some (values1714[i.val]'(by rw [values1714_size]; exact i.isLt)) := by
  exact segment_get 178 values1714 ⟨i.val, by rw [values1714_size]; exact i.isLt⟩

def values1715 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1715.coefficient147_210,
  OriginalRow227TriangleData1715.coefficient147_211,
  OriginalRow227TriangleData1715.coefficient147_212,
  OriginalRow227TriangleData1715.coefficient147_213,
  OriginalRow227TriangleData1715.coefficient147_214,
  OriginalRow227TriangleData1715.coefficient147_215,
  OriginalRow227TriangleData1715.coefficient147_216,
  OriginalRow227TriangleData1715.coefficient147_217,
  OriginalRow227TriangleData1715.coefficient147_218,
  OriginalRow227TriangleData1715.coefficient147_219,
  OriginalRow227TriangleData1715.coefficient147_220,
  OriginalRow227TriangleData1715.coefficient147_221,
  OriginalRow227TriangleData1715.coefficient147_222,
  OriginalRow227TriangleData1715.coefficient147_223,
  OriginalRow227TriangleData1715.coefficient147_224,
  OriginalRow227TriangleData1715.coefficient147_225,
  OriginalRow227TriangleData1715.coefficient147_226,
  OriginalRow227TriangleData1715.coefficient147_227,
  OriginalRow227TriangleData1715.coefficient147_228,
  OriginalRow227TriangleData1715.coefficient147_229,
  OriginalRow227TriangleData1715.coefficient147_230,
  OriginalRow227TriangleData1715.coefficient147_231,
  OriginalRow227TriangleData1715.coefficient147_232,
  OriginalRow227TriangleData1715.coefficient147_233,
  OriginalRow227TriangleData1715.coefficient147_234,
  OriginalRow227TriangleData1715.coefficient147_235,
  OriginalRow227TriangleData1715.coefficient147_236,
  OriginalRow227TriangleData1715.coefficient147_237,
  OriginalRow227TriangleData1715.coefficient147_238,
  OriginalRow227TriangleData1715.coefficient147_239,
  OriginalRow227TriangleData1715.coefficient147_240,
  OriginalRow227TriangleData1715.coefficient147_241
]

theorem values1715_size : values1715.size = 32 := rfl

def block1715 : ℕ → Option IntervalDyadic := segment 210 values1715

theorem block1715_domain : ExactDomain block1715 210 242 := by
  simpa only [values1715_size] using segment_domain 210 values1715

theorem block1715_get (i : Fin 32) :
    block1715 (210 + i.val) = some (values1715[i.val]'(by rw [values1715_size]; exact i.isLt)) := by
  exact segment_get 210 values1715 ⟨i.val, by rw [values1715_size]; exact i.isLt⟩

def values1716 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1716.coefficient147_242,
  OriginalRow227TriangleData1716.coefficient147_243,
  OriginalRow227TriangleData1716.coefficient147_244,
  OriginalRow227TriangleData1716.coefficient147_245,
  OriginalRow227TriangleData1716.coefficient147_246,
  OriginalRow227TriangleData1716.coefficient147_247,
  OriginalRow227TriangleData1716.coefficient147_248,
  OriginalRow227TriangleData1716.coefficient147_249,
  OriginalRow227TriangleData1716.coefficient147_250,
  OriginalRow227TriangleData1716.coefficient147_251,
  OriginalRow227TriangleData1716.coefficient147_252,
  OriginalRow227TriangleData1716.coefficient147_253,
  OriginalRow227TriangleData1716.coefficient147_254,
  OriginalRow227TriangleData1716.coefficient147_255,
  OriginalRow227TriangleData1716.coefficient147_256,
  OriginalRow227TriangleData1716.coefficient147_257,
  OriginalRow227TriangleData1716.coefficient147_258,
  OriginalRow227TriangleData1716.coefficient147_259,
  OriginalRow227TriangleData1716.coefficient147_260,
  OriginalRow227TriangleData1716.coefficient147_261,
  OriginalRow227TriangleData1716.coefficient147_262,
  OriginalRow227TriangleData1716.coefficient147_263,
  OriginalRow227TriangleData1716.coefficient147_264,
  OriginalRow227TriangleData1716.coefficient147_265,
  OriginalRow227TriangleData1716.coefficient147_266,
  OriginalRow227TriangleData1716.coefficient147_267,
  OriginalRow227TriangleData1716.coefficient147_268,
  OriginalRow227TriangleData1716.coefficient147_269,
  OriginalRow227TriangleData1716.coefficient147_270,
  OriginalRow227TriangleData1716.coefficient147_271,
  OriginalRow227TriangleData1716.coefficient147_272,
  OriginalRow227TriangleData1716.coefficient147_273
]

theorem values1716_size : values1716.size = 32 := rfl

def block1716 : ℕ → Option IntervalDyadic := segment 242 values1716

theorem block1716_domain : ExactDomain block1716 242 274 := by
  simpa only [values1716_size] using segment_domain 242 values1716

theorem block1716_get (i : Fin 32) :
    block1716 (242 + i.val) = some (values1716[i.val]'(by rw [values1716_size]; exact i.isLt)) := by
  exact segment_get 242 values1716 ⟨i.val, by rw [values1716_size]; exact i.isLt⟩

def values1717 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1717.coefficient147_274,
  OriginalRow227TriangleData1717.coefficient147_275,
  OriginalRow227TriangleData1717.coefficient147_276,
  OriginalRow227TriangleData1717.coefficient147_277,
  OriginalRow227TriangleData1717.coefficient147_278,
  OriginalRow227TriangleData1717.coefficient147_279,
  OriginalRow227TriangleData1717.coefficient147_280,
  OriginalRow227TriangleData1717.coefficient147_281,
  OriginalRow227TriangleData1717.coefficient147_282,
  OriginalRow227TriangleData1717.coefficient147_283,
  OriginalRow227TriangleData1717.coefficient147_284,
  OriginalRow227TriangleData1717.coefficient147_285,
  OriginalRow227TriangleData1717.coefficient147_286,
  OriginalRow227TriangleData1717.coefficient147_287,
  OriginalRow227TriangleData1717.coefficient147_288,
  OriginalRow227TriangleData1717.coefficient147_289,
  OriginalRow227TriangleData1717.coefficient147_290,
  OriginalRow227TriangleData1717.coefficient147_291,
  OriginalRow227TriangleData1717.coefficient147_292,
  OriginalRow227TriangleData1717.coefficient147_293,
  OriginalRow227TriangleData1717.coefficient147_294,
  OriginalRow227TriangleData1717.coefficient147_295,
  OriginalRow227TriangleData1717.coefficient147_296,
  OriginalRow227TriangleData1717.coefficient147_297,
  OriginalRow227TriangleData1717.coefficient147_298,
  OriginalRow227TriangleData1717.coefficient147_299,
  OriginalRow227TriangleData1717.coefficient147_300,
  OriginalRow227TriangleData1717.coefficient147_301,
  OriginalRow227TriangleData1717.coefficient147_302,
  OriginalRow227TriangleData1717.coefficient147_303,
  OriginalRow227TriangleData1717.coefficient147_304,
  OriginalRow227TriangleData1717.coefficient147_305
]

theorem values1717_size : values1717.size = 32 := rfl

def block1717 : ℕ → Option IntervalDyadic := segment 274 values1717

theorem block1717_domain : ExactDomain block1717 274 306 := by
  simpa only [values1717_size] using segment_domain 274 values1717

theorem block1717_get (i : Fin 32) :
    block1717 (274 + i.val) = some (values1717[i.val]'(by rw [values1717_size]; exact i.isLt)) := by
  exact segment_get 274 values1717 ⟨i.val, by rw [values1717_size]; exact i.isLt⟩

def values1718 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1718.coefficient147_306,
  OriginalRow227TriangleData1718.coefficient147_307,
  OriginalRow227TriangleData1718.coefficient147_308,
  OriginalRow227TriangleData1718.coefficient147_309,
  OriginalRow227TriangleData1718.coefficient147_310,
  OriginalRow227TriangleData1718.coefficient147_311,
  OriginalRow227TriangleData1718.coefficient147_312,
  OriginalRow227TriangleData1718.coefficient147_313,
  OriginalRow227TriangleData1718.coefficient147_314,
  OriginalRow227TriangleData1718.coefficient147_315,
  OriginalRow227TriangleData1718.coefficient147_316,
  OriginalRow227TriangleData1718.coefficient147_317,
  OriginalRow227TriangleData1718.coefficient147_318,
  OriginalRow227TriangleData1718.coefficient147_319,
  OriginalRow227TriangleData1718.coefficient147_320,
  OriginalRow227TriangleData1718.coefficient147_321,
  OriginalRow227TriangleData1718.coefficient147_322,
  OriginalRow227TriangleData1718.coefficient147_323,
  OriginalRow227TriangleData1718.coefficient147_324,
  OriginalRow227TriangleData1718.coefficient147_325,
  OriginalRow227TriangleData1718.coefficient147_326,
  OriginalRow227TriangleData1718.coefficient147_327,
  OriginalRow227TriangleData1718.coefficient147_328,
  OriginalRow227TriangleData1718.coefficient147_329,
  OriginalRow227TriangleData1718.coefficient147_330,
  OriginalRow227TriangleData1718.coefficient147_331,
  OriginalRow227TriangleData1718.coefficient147_332,
  OriginalRow227TriangleData1718.coefficient147_333,
  OriginalRow227TriangleData1718.coefficient147_334,
  OriginalRow227TriangleData1718.coefficient147_335,
  OriginalRow227TriangleData1718.coefficient147_336,
  OriginalRow227TriangleData1718.coefficient147_337
]

theorem values1718_size : values1718.size = 32 := rfl

def block1718 : ℕ → Option IntervalDyadic := segment 306 values1718

theorem block1718_domain : ExactDomain block1718 306 338 := by
  simpa only [values1718_size] using segment_domain 306 values1718

theorem block1718_get (i : Fin 32) :
    block1718 (306 + i.val) = some (values1718[i.val]'(by rw [values1718_size]; exact i.isLt)) := by
  exact segment_get 306 values1718 ⟨i.val, by rw [values1718_size]; exact i.isLt⟩

def values1719 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1719.coefficient147_338,
  OriginalRow227TriangleData1719.coefficient147_339,
  OriginalRow227TriangleData1719.coefficient147_340,
  OriginalRow227TriangleData1719.coefficient147_341,
  OriginalRow227TriangleData1719.coefficient147_342,
  OriginalRow227TriangleData1719.coefficient147_343,
  OriginalRow227TriangleData1719.coefficient147_344,
  OriginalRow227TriangleData1719.coefficient147_345,
  OriginalRow227TriangleData1719.coefficient147_346,
  OriginalRow227TriangleData1719.coefficient147_347,
  OriginalRow227TriangleData1719.coefficient147_348,
  OriginalRow227TriangleData1719.coefficient147_349,
  OriginalRow227TriangleData1719.coefficient147_350,
  OriginalRow227TriangleData1719.coefficient147_351,
  OriginalRow227TriangleData1719.coefficient147_352,
  OriginalRow227TriangleData1719.coefficient147_353,
  OriginalRow227TriangleData1719.coefficient147_354
]

theorem values1719_size : values1719.size = 17 := rfl

def block1719 : ℕ → Option IntervalDyadic := segment 338 values1719

theorem block1719_domain : ExactDomain block1719 338 355 := by
  simpa only [values1719_size] using segment_domain 338 values1719

theorem block1719_get (i : Fin 17) :
    block1719 (338 + i.val) = some (values1719[i.val]'(by rw [values1719_size]; exact i.isLt)) := by
  exact segment_get 338 values1719 ⟨i.val, by rw [values1719_size]; exact i.isLt⟩

def node0178_0242 : ℕ → Option IntervalDyadic := split 210 block1714 block1715

theorem node0178_0242_domain : ExactDomain node0178_0242 178 242 := by
  exact split_domain (by decide) (by decide) block1714_domain block1715_domain

def node0146_0242 : ℕ → Option IntervalDyadic := split 178 block1713 node0178_0242

theorem node0146_0242_domain : ExactDomain node0146_0242 146 242 := by
  exact split_domain (by decide) (by decide) block1713_domain node0178_0242_domain

def node0242_0306 : ℕ → Option IntervalDyadic := split 274 block1716 block1717

theorem node0242_0306_domain : ExactDomain node0242_0306 242 306 := by
  exact split_domain (by decide) (by decide) block1716_domain block1717_domain

def node0306_0355 : ℕ → Option IntervalDyadic := split 338 block1718 block1719

theorem node0306_0355_domain : ExactDomain node0306_0355 306 355 := by
  exact split_domain (by decide) (by decide) block1718_domain block1719_domain

def node0242_0355 : ℕ → Option IntervalDyadic := split 306 node0242_0306 node0306_0355

theorem node0242_0355_domain : ExactDomain node0242_0355 242 355 := by
  exact split_domain (by decide) (by decide) node0242_0306_domain node0306_0355_domain

def node0146_0355 : ℕ → Option IntervalDyadic := split 242 node0146_0242 node0242_0355

theorem node0146_0355_domain : ExactDomain node0146_0355 146 355 := by
  exact split_domain (by decide) (by decide) node0146_0242_domain node0242_0355_domain

def lookup : ℕ → Option IntervalDyadic := node0146_0355

theorem lookup_domain : ExactDomain lookup 146 355 :=
  node0146_0355_domain

theorem block1713_lookup (i : Fin 32) :
    lookup (146 + i.val) = some (values1713[i.val]'(by rw [values1713_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0146_0355 (146 + i.val) = _
  rw [node0146_0355, split_left 242 node0146_0242 node0242_0355 (by omega)]
  rw [node0146_0242, split_left 178 block1713 node0178_0242 (by omega)]
  exact block1713_get i

theorem block1714_lookup (i : Fin 32) :
    lookup (178 + i.val) = some (values1714[i.val]'(by rw [values1714_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0146_0355 (178 + i.val) = _
  rw [node0146_0355, split_left 242 node0146_0242 node0242_0355 (by omega)]
  rw [node0146_0242, split_right 178 block1713 node0178_0242 (by omega)]
  rw [node0178_0242, split_left 210 block1714 block1715 (by omega)]
  exact block1714_get i

theorem block1715_lookup (i : Fin 32) :
    lookup (210 + i.val) = some (values1715[i.val]'(by rw [values1715_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0146_0355 (210 + i.val) = _
  rw [node0146_0355, split_left 242 node0146_0242 node0242_0355 (by omega)]
  rw [node0146_0242, split_right 178 block1713 node0178_0242 (by omega)]
  rw [node0178_0242, split_right 210 block1714 block1715 (by omega)]
  exact block1715_get i

theorem block1716_lookup (i : Fin 32) :
    lookup (242 + i.val) = some (values1716[i.val]'(by rw [values1716_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0146_0355 (242 + i.val) = _
  rw [node0146_0355, split_right 242 node0146_0242 node0242_0355 (by omega)]
  rw [node0242_0355, split_left 306 node0242_0306 node0306_0355 (by omega)]
  rw [node0242_0306, split_left 274 block1716 block1717 (by omega)]
  exact block1716_get i

theorem block1717_lookup (i : Fin 32) :
    lookup (274 + i.val) = some (values1717[i.val]'(by rw [values1717_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0146_0355 (274 + i.val) = _
  rw [node0146_0355, split_right 242 node0146_0242 node0242_0355 (by omega)]
  rw [node0242_0355, split_left 306 node0242_0306 node0306_0355 (by omega)]
  rw [node0242_0306, split_right 274 block1716 block1717 (by omega)]
  exact block1717_get i

theorem block1718_lookup (i : Fin 32) :
    lookup (306 + i.val) = some (values1718[i.val]'(by rw [values1718_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0146_0355 (306 + i.val) = _
  rw [node0146_0355, split_right 242 node0146_0242 node0242_0355 (by omega)]
  rw [node0242_0355, split_right 306 node0242_0306 node0306_0355 (by omega)]
  rw [node0306_0355, split_left 338 block1718 block1719 (by omega)]
  exact block1718_get i

theorem block1719_lookup (i : Fin 17) :
    lookup (338 + i.val) = some (values1719[i.val]'(by rw [values1719_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0146_0355 (338 + i.val) = _
  rw [node0146_0355, split_right 242 node0146_0242 node0242_0355 (by omega)]
  rw [node0242_0355, split_right 306 node0242_0306 node0306_0355 (by omega)]
  rw [node0306_0355, split_right 338 block1718 block1719 (by omega)]
  exact block1719_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1713_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1713_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1714_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1714_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1715_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1715_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1716_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1716_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1717_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1717_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1718_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1718_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1719_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1719_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1713_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1714_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1715_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1716_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1717_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1718_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow147.block1719_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow147
