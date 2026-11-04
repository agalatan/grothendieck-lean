import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1692
import Grothe.UpperChaos.OriginalRow227TriangleData1693
import Grothe.UpperChaos.OriginalRow227TriangleData1694
import Grothe.UpperChaos.OriginalRow227TriangleData1695
import Grothe.UpperChaos.OriginalRow227TriangleData1696
import Grothe.UpperChaos.OriginalRow227TriangleData1697
import Grothe.UpperChaos.OriginalRow227TriangleData1698

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow144

open ConditionalTableLookup

def values1692 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1692.coefficient144_143,
  OriginalRow227TriangleData1692.coefficient144_144,
  OriginalRow227TriangleData1692.coefficient144_145,
  OriginalRow227TriangleData1692.coefficient144_146,
  OriginalRow227TriangleData1692.coefficient144_147,
  OriginalRow227TriangleData1692.coefficient144_148,
  OriginalRow227TriangleData1692.coefficient144_149,
  OriginalRow227TriangleData1692.coefficient144_150,
  OriginalRow227TriangleData1692.coefficient144_151,
  OriginalRow227TriangleData1692.coefficient144_152,
  OriginalRow227TriangleData1692.coefficient144_153,
  OriginalRow227TriangleData1692.coefficient144_154,
  OriginalRow227TriangleData1692.coefficient144_155,
  OriginalRow227TriangleData1692.coefficient144_156,
  OriginalRow227TriangleData1692.coefficient144_157,
  OriginalRow227TriangleData1692.coefficient144_158,
  OriginalRow227TriangleData1692.coefficient144_159,
  OriginalRow227TriangleData1692.coefficient144_160,
  OriginalRow227TriangleData1692.coefficient144_161,
  OriginalRow227TriangleData1692.coefficient144_162,
  OriginalRow227TriangleData1692.coefficient144_163,
  OriginalRow227TriangleData1692.coefficient144_164,
  OriginalRow227TriangleData1692.coefficient144_165,
  OriginalRow227TriangleData1692.coefficient144_166,
  OriginalRow227TriangleData1692.coefficient144_167,
  OriginalRow227TriangleData1692.coefficient144_168,
  OriginalRow227TriangleData1692.coefficient144_169,
  OriginalRow227TriangleData1692.coefficient144_170,
  OriginalRow227TriangleData1692.coefficient144_171,
  OriginalRow227TriangleData1692.coefficient144_172,
  OriginalRow227TriangleData1692.coefficient144_173,
  OriginalRow227TriangleData1692.coefficient144_174
]

theorem values1692_size : values1692.size = 32 := rfl

def block1692 : ℕ → Option IntervalDyadic := segment 143 values1692

theorem block1692_domain : ExactDomain block1692 143 175 := by
  simpa only [values1692_size] using segment_domain 143 values1692

theorem block1692_get (i : Fin 32) :
    block1692 (143 + i.val) = some (values1692[i.val]'(by rw [values1692_size]; exact i.isLt)) := by
  exact segment_get 143 values1692 ⟨i.val, by rw [values1692_size]; exact i.isLt⟩

def values1693 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1693.coefficient144_175,
  OriginalRow227TriangleData1693.coefficient144_176,
  OriginalRow227TriangleData1693.coefficient144_177,
  OriginalRow227TriangleData1693.coefficient144_178,
  OriginalRow227TriangleData1693.coefficient144_179,
  OriginalRow227TriangleData1693.coefficient144_180,
  OriginalRow227TriangleData1693.coefficient144_181,
  OriginalRow227TriangleData1693.coefficient144_182,
  OriginalRow227TriangleData1693.coefficient144_183,
  OriginalRow227TriangleData1693.coefficient144_184,
  OriginalRow227TriangleData1693.coefficient144_185,
  OriginalRow227TriangleData1693.coefficient144_186,
  OriginalRow227TriangleData1693.coefficient144_187,
  OriginalRow227TriangleData1693.coefficient144_188,
  OriginalRow227TriangleData1693.coefficient144_189,
  OriginalRow227TriangleData1693.coefficient144_190,
  OriginalRow227TriangleData1693.coefficient144_191,
  OriginalRow227TriangleData1693.coefficient144_192,
  OriginalRow227TriangleData1693.coefficient144_193,
  OriginalRow227TriangleData1693.coefficient144_194,
  OriginalRow227TriangleData1693.coefficient144_195,
  OriginalRow227TriangleData1693.coefficient144_196,
  OriginalRow227TriangleData1693.coefficient144_197,
  OriginalRow227TriangleData1693.coefficient144_198,
  OriginalRow227TriangleData1693.coefficient144_199,
  OriginalRow227TriangleData1693.coefficient144_200,
  OriginalRow227TriangleData1693.coefficient144_201,
  OriginalRow227TriangleData1693.coefficient144_202,
  OriginalRow227TriangleData1693.coefficient144_203,
  OriginalRow227TriangleData1693.coefficient144_204,
  OriginalRow227TriangleData1693.coefficient144_205,
  OriginalRow227TriangleData1693.coefficient144_206
]

theorem values1693_size : values1693.size = 32 := rfl

def block1693 : ℕ → Option IntervalDyadic := segment 175 values1693

theorem block1693_domain : ExactDomain block1693 175 207 := by
  simpa only [values1693_size] using segment_domain 175 values1693

theorem block1693_get (i : Fin 32) :
    block1693 (175 + i.val) = some (values1693[i.val]'(by rw [values1693_size]; exact i.isLt)) := by
  exact segment_get 175 values1693 ⟨i.val, by rw [values1693_size]; exact i.isLt⟩

def values1694 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1694.coefficient144_207,
  OriginalRow227TriangleData1694.coefficient144_208,
  OriginalRow227TriangleData1694.coefficient144_209,
  OriginalRow227TriangleData1694.coefficient144_210,
  OriginalRow227TriangleData1694.coefficient144_211,
  OriginalRow227TriangleData1694.coefficient144_212,
  OriginalRow227TriangleData1694.coefficient144_213,
  OriginalRow227TriangleData1694.coefficient144_214,
  OriginalRow227TriangleData1694.coefficient144_215,
  OriginalRow227TriangleData1694.coefficient144_216,
  OriginalRow227TriangleData1694.coefficient144_217,
  OriginalRow227TriangleData1694.coefficient144_218,
  OriginalRow227TriangleData1694.coefficient144_219,
  OriginalRow227TriangleData1694.coefficient144_220,
  OriginalRow227TriangleData1694.coefficient144_221,
  OriginalRow227TriangleData1694.coefficient144_222,
  OriginalRow227TriangleData1694.coefficient144_223,
  OriginalRow227TriangleData1694.coefficient144_224,
  OriginalRow227TriangleData1694.coefficient144_225,
  OriginalRow227TriangleData1694.coefficient144_226,
  OriginalRow227TriangleData1694.coefficient144_227,
  OriginalRow227TriangleData1694.coefficient144_228,
  OriginalRow227TriangleData1694.coefficient144_229,
  OriginalRow227TriangleData1694.coefficient144_230,
  OriginalRow227TriangleData1694.coefficient144_231,
  OriginalRow227TriangleData1694.coefficient144_232,
  OriginalRow227TriangleData1694.coefficient144_233,
  OriginalRow227TriangleData1694.coefficient144_234,
  OriginalRow227TriangleData1694.coefficient144_235,
  OriginalRow227TriangleData1694.coefficient144_236,
  OriginalRow227TriangleData1694.coefficient144_237,
  OriginalRow227TriangleData1694.coefficient144_238
]

theorem values1694_size : values1694.size = 32 := rfl

def block1694 : ℕ → Option IntervalDyadic := segment 207 values1694

theorem block1694_domain : ExactDomain block1694 207 239 := by
  simpa only [values1694_size] using segment_domain 207 values1694

theorem block1694_get (i : Fin 32) :
    block1694 (207 + i.val) = some (values1694[i.val]'(by rw [values1694_size]; exact i.isLt)) := by
  exact segment_get 207 values1694 ⟨i.val, by rw [values1694_size]; exact i.isLt⟩

def values1695 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1695.coefficient144_239,
  OriginalRow227TriangleData1695.coefficient144_240,
  OriginalRow227TriangleData1695.coefficient144_241,
  OriginalRow227TriangleData1695.coefficient144_242,
  OriginalRow227TriangleData1695.coefficient144_243,
  OriginalRow227TriangleData1695.coefficient144_244,
  OriginalRow227TriangleData1695.coefficient144_245,
  OriginalRow227TriangleData1695.coefficient144_246,
  OriginalRow227TriangleData1695.coefficient144_247,
  OriginalRow227TriangleData1695.coefficient144_248,
  OriginalRow227TriangleData1695.coefficient144_249,
  OriginalRow227TriangleData1695.coefficient144_250,
  OriginalRow227TriangleData1695.coefficient144_251,
  OriginalRow227TriangleData1695.coefficient144_252,
  OriginalRow227TriangleData1695.coefficient144_253,
  OriginalRow227TriangleData1695.coefficient144_254,
  OriginalRow227TriangleData1695.coefficient144_255,
  OriginalRow227TriangleData1695.coefficient144_256,
  OriginalRow227TriangleData1695.coefficient144_257,
  OriginalRow227TriangleData1695.coefficient144_258,
  OriginalRow227TriangleData1695.coefficient144_259,
  OriginalRow227TriangleData1695.coefficient144_260,
  OriginalRow227TriangleData1695.coefficient144_261,
  OriginalRow227TriangleData1695.coefficient144_262,
  OriginalRow227TriangleData1695.coefficient144_263,
  OriginalRow227TriangleData1695.coefficient144_264,
  OriginalRow227TriangleData1695.coefficient144_265,
  OriginalRow227TriangleData1695.coefficient144_266,
  OriginalRow227TriangleData1695.coefficient144_267,
  OriginalRow227TriangleData1695.coefficient144_268,
  OriginalRow227TriangleData1695.coefficient144_269,
  OriginalRow227TriangleData1695.coefficient144_270
]

theorem values1695_size : values1695.size = 32 := rfl

def block1695 : ℕ → Option IntervalDyadic := segment 239 values1695

theorem block1695_domain : ExactDomain block1695 239 271 := by
  simpa only [values1695_size] using segment_domain 239 values1695

theorem block1695_get (i : Fin 32) :
    block1695 (239 + i.val) = some (values1695[i.val]'(by rw [values1695_size]; exact i.isLt)) := by
  exact segment_get 239 values1695 ⟨i.val, by rw [values1695_size]; exact i.isLt⟩

def values1696 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1696.coefficient144_271,
  OriginalRow227TriangleData1696.coefficient144_272,
  OriginalRow227TriangleData1696.coefficient144_273,
  OriginalRow227TriangleData1696.coefficient144_274,
  OriginalRow227TriangleData1696.coefficient144_275,
  OriginalRow227TriangleData1696.coefficient144_276,
  OriginalRow227TriangleData1696.coefficient144_277,
  OriginalRow227TriangleData1696.coefficient144_278,
  OriginalRow227TriangleData1696.coefficient144_279,
  OriginalRow227TriangleData1696.coefficient144_280,
  OriginalRow227TriangleData1696.coefficient144_281,
  OriginalRow227TriangleData1696.coefficient144_282,
  OriginalRow227TriangleData1696.coefficient144_283,
  OriginalRow227TriangleData1696.coefficient144_284,
  OriginalRow227TriangleData1696.coefficient144_285,
  OriginalRow227TriangleData1696.coefficient144_286,
  OriginalRow227TriangleData1696.coefficient144_287,
  OriginalRow227TriangleData1696.coefficient144_288,
  OriginalRow227TriangleData1696.coefficient144_289,
  OriginalRow227TriangleData1696.coefficient144_290,
  OriginalRow227TriangleData1696.coefficient144_291,
  OriginalRow227TriangleData1696.coefficient144_292,
  OriginalRow227TriangleData1696.coefficient144_293,
  OriginalRow227TriangleData1696.coefficient144_294,
  OriginalRow227TriangleData1696.coefficient144_295,
  OriginalRow227TriangleData1696.coefficient144_296,
  OriginalRow227TriangleData1696.coefficient144_297,
  OriginalRow227TriangleData1696.coefficient144_298,
  OriginalRow227TriangleData1696.coefficient144_299,
  OriginalRow227TriangleData1696.coefficient144_300,
  OriginalRow227TriangleData1696.coefficient144_301,
  OriginalRow227TriangleData1696.coefficient144_302
]

theorem values1696_size : values1696.size = 32 := rfl

def block1696 : ℕ → Option IntervalDyadic := segment 271 values1696

theorem block1696_domain : ExactDomain block1696 271 303 := by
  simpa only [values1696_size] using segment_domain 271 values1696

theorem block1696_get (i : Fin 32) :
    block1696 (271 + i.val) = some (values1696[i.val]'(by rw [values1696_size]; exact i.isLt)) := by
  exact segment_get 271 values1696 ⟨i.val, by rw [values1696_size]; exact i.isLt⟩

def values1697 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1697.coefficient144_303,
  OriginalRow227TriangleData1697.coefficient144_304,
  OriginalRow227TriangleData1697.coefficient144_305,
  OriginalRow227TriangleData1697.coefficient144_306,
  OriginalRow227TriangleData1697.coefficient144_307,
  OriginalRow227TriangleData1697.coefficient144_308,
  OriginalRow227TriangleData1697.coefficient144_309,
  OriginalRow227TriangleData1697.coefficient144_310,
  OriginalRow227TriangleData1697.coefficient144_311,
  OriginalRow227TriangleData1697.coefficient144_312,
  OriginalRow227TriangleData1697.coefficient144_313,
  OriginalRow227TriangleData1697.coefficient144_314,
  OriginalRow227TriangleData1697.coefficient144_315,
  OriginalRow227TriangleData1697.coefficient144_316,
  OriginalRow227TriangleData1697.coefficient144_317,
  OriginalRow227TriangleData1697.coefficient144_318,
  OriginalRow227TriangleData1697.coefficient144_319,
  OriginalRow227TriangleData1697.coefficient144_320,
  OriginalRow227TriangleData1697.coefficient144_321,
  OriginalRow227TriangleData1697.coefficient144_322,
  OriginalRow227TriangleData1697.coefficient144_323,
  OriginalRow227TriangleData1697.coefficient144_324,
  OriginalRow227TriangleData1697.coefficient144_325,
  OriginalRow227TriangleData1697.coefficient144_326,
  OriginalRow227TriangleData1697.coefficient144_327,
  OriginalRow227TriangleData1697.coefficient144_328,
  OriginalRow227TriangleData1697.coefficient144_329,
  OriginalRow227TriangleData1697.coefficient144_330,
  OriginalRow227TriangleData1697.coefficient144_331,
  OriginalRow227TriangleData1697.coefficient144_332,
  OriginalRow227TriangleData1697.coefficient144_333,
  OriginalRow227TriangleData1697.coefficient144_334
]

theorem values1697_size : values1697.size = 32 := rfl

def block1697 : ℕ → Option IntervalDyadic := segment 303 values1697

theorem block1697_domain : ExactDomain block1697 303 335 := by
  simpa only [values1697_size] using segment_domain 303 values1697

theorem block1697_get (i : Fin 32) :
    block1697 (303 + i.val) = some (values1697[i.val]'(by rw [values1697_size]; exact i.isLt)) := by
  exact segment_get 303 values1697 ⟨i.val, by rw [values1697_size]; exact i.isLt⟩

def values1698 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1698.coefficient144_335,
  OriginalRow227TriangleData1698.coefficient144_336,
  OriginalRow227TriangleData1698.coefficient144_337,
  OriginalRow227TriangleData1698.coefficient144_338,
  OriginalRow227TriangleData1698.coefficient144_339,
  OriginalRow227TriangleData1698.coefficient144_340,
  OriginalRow227TriangleData1698.coefficient144_341,
  OriginalRow227TriangleData1698.coefficient144_342,
  OriginalRow227TriangleData1698.coefficient144_343,
  OriginalRow227TriangleData1698.coefficient144_344,
  OriginalRow227TriangleData1698.coefficient144_345,
  OriginalRow227TriangleData1698.coefficient144_346,
  OriginalRow227TriangleData1698.coefficient144_347,
  OriginalRow227TriangleData1698.coefficient144_348,
  OriginalRow227TriangleData1698.coefficient144_349,
  OriginalRow227TriangleData1698.coefficient144_350,
  OriginalRow227TriangleData1698.coefficient144_351,
  OriginalRow227TriangleData1698.coefficient144_352,
  OriginalRow227TriangleData1698.coefficient144_353,
  OriginalRow227TriangleData1698.coefficient144_354,
  OriginalRow227TriangleData1698.coefficient144_355,
  OriginalRow227TriangleData1698.coefficient144_356,
  OriginalRow227TriangleData1698.coefficient144_357
]

theorem values1698_size : values1698.size = 23 := rfl

def block1698 : ℕ → Option IntervalDyadic := segment 335 values1698

theorem block1698_domain : ExactDomain block1698 335 358 := by
  simpa only [values1698_size] using segment_domain 335 values1698

theorem block1698_get (i : Fin 23) :
    block1698 (335 + i.val) = some (values1698[i.val]'(by rw [values1698_size]; exact i.isLt)) := by
  exact segment_get 335 values1698 ⟨i.val, by rw [values1698_size]; exact i.isLt⟩

def node0175_0239 : ℕ → Option IntervalDyadic := split 207 block1693 block1694

theorem node0175_0239_domain : ExactDomain node0175_0239 175 239 := by
  exact split_domain (by decide) (by decide) block1693_domain block1694_domain

def node0143_0239 : ℕ → Option IntervalDyadic := split 175 block1692 node0175_0239

theorem node0143_0239_domain : ExactDomain node0143_0239 143 239 := by
  exact split_domain (by decide) (by decide) block1692_domain node0175_0239_domain

def node0239_0303 : ℕ → Option IntervalDyadic := split 271 block1695 block1696

theorem node0239_0303_domain : ExactDomain node0239_0303 239 303 := by
  exact split_domain (by decide) (by decide) block1695_domain block1696_domain

def node0303_0358 : ℕ → Option IntervalDyadic := split 335 block1697 block1698

theorem node0303_0358_domain : ExactDomain node0303_0358 303 358 := by
  exact split_domain (by decide) (by decide) block1697_domain block1698_domain

def node0239_0358 : ℕ → Option IntervalDyadic := split 303 node0239_0303 node0303_0358

theorem node0239_0358_domain : ExactDomain node0239_0358 239 358 := by
  exact split_domain (by decide) (by decide) node0239_0303_domain node0303_0358_domain

def node0143_0358 : ℕ → Option IntervalDyadic := split 239 node0143_0239 node0239_0358

theorem node0143_0358_domain : ExactDomain node0143_0358 143 358 := by
  exact split_domain (by decide) (by decide) node0143_0239_domain node0239_0358_domain

def lookup : ℕ → Option IntervalDyadic := node0143_0358

theorem lookup_domain : ExactDomain lookup 143 358 :=
  node0143_0358_domain

theorem block1692_lookup (i : Fin 32) :
    lookup (143 + i.val) = some (values1692[i.val]'(by rw [values1692_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0143_0358 (143 + i.val) = _
  rw [node0143_0358, split_left 239 node0143_0239 node0239_0358 (by omega)]
  rw [node0143_0239, split_left 175 block1692 node0175_0239 (by omega)]
  exact block1692_get i

theorem block1693_lookup (i : Fin 32) :
    lookup (175 + i.val) = some (values1693[i.val]'(by rw [values1693_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0143_0358 (175 + i.val) = _
  rw [node0143_0358, split_left 239 node0143_0239 node0239_0358 (by omega)]
  rw [node0143_0239, split_right 175 block1692 node0175_0239 (by omega)]
  rw [node0175_0239, split_left 207 block1693 block1694 (by omega)]
  exact block1693_get i

theorem block1694_lookup (i : Fin 32) :
    lookup (207 + i.val) = some (values1694[i.val]'(by rw [values1694_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0143_0358 (207 + i.val) = _
  rw [node0143_0358, split_left 239 node0143_0239 node0239_0358 (by omega)]
  rw [node0143_0239, split_right 175 block1692 node0175_0239 (by omega)]
  rw [node0175_0239, split_right 207 block1693 block1694 (by omega)]
  exact block1694_get i

theorem block1695_lookup (i : Fin 32) :
    lookup (239 + i.val) = some (values1695[i.val]'(by rw [values1695_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0143_0358 (239 + i.val) = _
  rw [node0143_0358, split_right 239 node0143_0239 node0239_0358 (by omega)]
  rw [node0239_0358, split_left 303 node0239_0303 node0303_0358 (by omega)]
  rw [node0239_0303, split_left 271 block1695 block1696 (by omega)]
  exact block1695_get i

theorem block1696_lookup (i : Fin 32) :
    lookup (271 + i.val) = some (values1696[i.val]'(by rw [values1696_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0143_0358 (271 + i.val) = _
  rw [node0143_0358, split_right 239 node0143_0239 node0239_0358 (by omega)]
  rw [node0239_0358, split_left 303 node0239_0303 node0303_0358 (by omega)]
  rw [node0239_0303, split_right 271 block1695 block1696 (by omega)]
  exact block1696_get i

theorem block1697_lookup (i : Fin 32) :
    lookup (303 + i.val) = some (values1697[i.val]'(by rw [values1697_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0143_0358 (303 + i.val) = _
  rw [node0143_0358, split_right 239 node0143_0239 node0239_0358 (by omega)]
  rw [node0239_0358, split_right 303 node0239_0303 node0303_0358 (by omega)]
  rw [node0303_0358, split_left 335 block1697 block1698 (by omega)]
  exact block1697_get i

theorem block1698_lookup (i : Fin 23) :
    lookup (335 + i.val) = some (values1698[i.val]'(by rw [values1698_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0143_0358 (335 + i.val) = _
  rw [node0143_0358, split_right 239 node0143_0239 node0239_0358 (by omega)]
  rw [node0239_0358, split_right 303 node0239_0303 node0303_0358 (by omega)]
  rw [node0303_0358, split_right 335 block1697 block1698 (by omega)]
  exact block1698_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1692_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1692_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1693_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1693_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1694_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1694_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1695_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1695_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1696_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1696_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1697_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1697_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1698_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1698_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1692_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1693_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1694_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1695_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1696_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1697_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow144.block1698_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow144
