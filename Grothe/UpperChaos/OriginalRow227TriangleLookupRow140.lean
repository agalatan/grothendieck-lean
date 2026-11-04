import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1664
import Grothe.UpperChaos.OriginalRow227TriangleData1665
import Grothe.UpperChaos.OriginalRow227TriangleData1666
import Grothe.UpperChaos.OriginalRow227TriangleData1667
import Grothe.UpperChaos.OriginalRow227TriangleData1668
import Grothe.UpperChaos.OriginalRow227TriangleData1669
import Grothe.UpperChaos.OriginalRow227TriangleData1670

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow140

open ConditionalTableLookup

def values1664 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1664.coefficient140_139,
  OriginalRow227TriangleData1664.coefficient140_140,
  OriginalRow227TriangleData1664.coefficient140_141,
  OriginalRow227TriangleData1664.coefficient140_142,
  OriginalRow227TriangleData1664.coefficient140_143,
  OriginalRow227TriangleData1664.coefficient140_144,
  OriginalRow227TriangleData1664.coefficient140_145,
  OriginalRow227TriangleData1664.coefficient140_146,
  OriginalRow227TriangleData1664.coefficient140_147,
  OriginalRow227TriangleData1664.coefficient140_148,
  OriginalRow227TriangleData1664.coefficient140_149,
  OriginalRow227TriangleData1664.coefficient140_150,
  OriginalRow227TriangleData1664.coefficient140_151,
  OriginalRow227TriangleData1664.coefficient140_152,
  OriginalRow227TriangleData1664.coefficient140_153,
  OriginalRow227TriangleData1664.coefficient140_154,
  OriginalRow227TriangleData1664.coefficient140_155,
  OriginalRow227TriangleData1664.coefficient140_156,
  OriginalRow227TriangleData1664.coefficient140_157,
  OriginalRow227TriangleData1664.coefficient140_158,
  OriginalRow227TriangleData1664.coefficient140_159,
  OriginalRow227TriangleData1664.coefficient140_160,
  OriginalRow227TriangleData1664.coefficient140_161,
  OriginalRow227TriangleData1664.coefficient140_162,
  OriginalRow227TriangleData1664.coefficient140_163,
  OriginalRow227TriangleData1664.coefficient140_164,
  OriginalRow227TriangleData1664.coefficient140_165,
  OriginalRow227TriangleData1664.coefficient140_166,
  OriginalRow227TriangleData1664.coefficient140_167,
  OriginalRow227TriangleData1664.coefficient140_168,
  OriginalRow227TriangleData1664.coefficient140_169,
  OriginalRow227TriangleData1664.coefficient140_170
]

theorem values1664_size : values1664.size = 32 := rfl

def block1664 : ℕ → Option IntervalDyadic := segment 139 values1664

theorem block1664_domain : ExactDomain block1664 139 171 := by
  simpa only [values1664_size] using segment_domain 139 values1664

theorem block1664_get (i : Fin 32) :
    block1664 (139 + i.val) = some (values1664[i.val]'(by rw [values1664_size]; exact i.isLt)) := by
  exact segment_get 139 values1664 ⟨i.val, by rw [values1664_size]; exact i.isLt⟩

def values1665 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1665.coefficient140_171,
  OriginalRow227TriangleData1665.coefficient140_172,
  OriginalRow227TriangleData1665.coefficient140_173,
  OriginalRow227TriangleData1665.coefficient140_174,
  OriginalRow227TriangleData1665.coefficient140_175,
  OriginalRow227TriangleData1665.coefficient140_176,
  OriginalRow227TriangleData1665.coefficient140_177,
  OriginalRow227TriangleData1665.coefficient140_178,
  OriginalRow227TriangleData1665.coefficient140_179,
  OriginalRow227TriangleData1665.coefficient140_180,
  OriginalRow227TriangleData1665.coefficient140_181,
  OriginalRow227TriangleData1665.coefficient140_182,
  OriginalRow227TriangleData1665.coefficient140_183,
  OriginalRow227TriangleData1665.coefficient140_184,
  OriginalRow227TriangleData1665.coefficient140_185,
  OriginalRow227TriangleData1665.coefficient140_186,
  OriginalRow227TriangleData1665.coefficient140_187,
  OriginalRow227TriangleData1665.coefficient140_188,
  OriginalRow227TriangleData1665.coefficient140_189,
  OriginalRow227TriangleData1665.coefficient140_190,
  OriginalRow227TriangleData1665.coefficient140_191,
  OriginalRow227TriangleData1665.coefficient140_192,
  OriginalRow227TriangleData1665.coefficient140_193,
  OriginalRow227TriangleData1665.coefficient140_194,
  OriginalRow227TriangleData1665.coefficient140_195,
  OriginalRow227TriangleData1665.coefficient140_196,
  OriginalRow227TriangleData1665.coefficient140_197,
  OriginalRow227TriangleData1665.coefficient140_198,
  OriginalRow227TriangleData1665.coefficient140_199,
  OriginalRow227TriangleData1665.coefficient140_200,
  OriginalRow227TriangleData1665.coefficient140_201,
  OriginalRow227TriangleData1665.coefficient140_202
]

theorem values1665_size : values1665.size = 32 := rfl

def block1665 : ℕ → Option IntervalDyadic := segment 171 values1665

theorem block1665_domain : ExactDomain block1665 171 203 := by
  simpa only [values1665_size] using segment_domain 171 values1665

theorem block1665_get (i : Fin 32) :
    block1665 (171 + i.val) = some (values1665[i.val]'(by rw [values1665_size]; exact i.isLt)) := by
  exact segment_get 171 values1665 ⟨i.val, by rw [values1665_size]; exact i.isLt⟩

def values1666 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1666.coefficient140_203,
  OriginalRow227TriangleData1666.coefficient140_204,
  OriginalRow227TriangleData1666.coefficient140_205,
  OriginalRow227TriangleData1666.coefficient140_206,
  OriginalRow227TriangleData1666.coefficient140_207,
  OriginalRow227TriangleData1666.coefficient140_208,
  OriginalRow227TriangleData1666.coefficient140_209,
  OriginalRow227TriangleData1666.coefficient140_210,
  OriginalRow227TriangleData1666.coefficient140_211,
  OriginalRow227TriangleData1666.coefficient140_212,
  OriginalRow227TriangleData1666.coefficient140_213,
  OriginalRow227TriangleData1666.coefficient140_214,
  OriginalRow227TriangleData1666.coefficient140_215,
  OriginalRow227TriangleData1666.coefficient140_216,
  OriginalRow227TriangleData1666.coefficient140_217,
  OriginalRow227TriangleData1666.coefficient140_218,
  OriginalRow227TriangleData1666.coefficient140_219,
  OriginalRow227TriangleData1666.coefficient140_220,
  OriginalRow227TriangleData1666.coefficient140_221,
  OriginalRow227TriangleData1666.coefficient140_222,
  OriginalRow227TriangleData1666.coefficient140_223,
  OriginalRow227TriangleData1666.coefficient140_224,
  OriginalRow227TriangleData1666.coefficient140_225,
  OriginalRow227TriangleData1666.coefficient140_226,
  OriginalRow227TriangleData1666.coefficient140_227,
  OriginalRow227TriangleData1666.coefficient140_228,
  OriginalRow227TriangleData1666.coefficient140_229,
  OriginalRow227TriangleData1666.coefficient140_230,
  OriginalRow227TriangleData1666.coefficient140_231,
  OriginalRow227TriangleData1666.coefficient140_232,
  OriginalRow227TriangleData1666.coefficient140_233,
  OriginalRow227TriangleData1666.coefficient140_234
]

theorem values1666_size : values1666.size = 32 := rfl

def block1666 : ℕ → Option IntervalDyadic := segment 203 values1666

theorem block1666_domain : ExactDomain block1666 203 235 := by
  simpa only [values1666_size] using segment_domain 203 values1666

theorem block1666_get (i : Fin 32) :
    block1666 (203 + i.val) = some (values1666[i.val]'(by rw [values1666_size]; exact i.isLt)) := by
  exact segment_get 203 values1666 ⟨i.val, by rw [values1666_size]; exact i.isLt⟩

def values1667 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1667.coefficient140_235,
  OriginalRow227TriangleData1667.coefficient140_236,
  OriginalRow227TriangleData1667.coefficient140_237,
  OriginalRow227TriangleData1667.coefficient140_238,
  OriginalRow227TriangleData1667.coefficient140_239,
  OriginalRow227TriangleData1667.coefficient140_240,
  OriginalRow227TriangleData1667.coefficient140_241,
  OriginalRow227TriangleData1667.coefficient140_242,
  OriginalRow227TriangleData1667.coefficient140_243,
  OriginalRow227TriangleData1667.coefficient140_244,
  OriginalRow227TriangleData1667.coefficient140_245,
  OriginalRow227TriangleData1667.coefficient140_246,
  OriginalRow227TriangleData1667.coefficient140_247,
  OriginalRow227TriangleData1667.coefficient140_248,
  OriginalRow227TriangleData1667.coefficient140_249,
  OriginalRow227TriangleData1667.coefficient140_250,
  OriginalRow227TriangleData1667.coefficient140_251,
  OriginalRow227TriangleData1667.coefficient140_252,
  OriginalRow227TriangleData1667.coefficient140_253,
  OriginalRow227TriangleData1667.coefficient140_254,
  OriginalRow227TriangleData1667.coefficient140_255,
  OriginalRow227TriangleData1667.coefficient140_256,
  OriginalRow227TriangleData1667.coefficient140_257,
  OriginalRow227TriangleData1667.coefficient140_258,
  OriginalRow227TriangleData1667.coefficient140_259,
  OriginalRow227TriangleData1667.coefficient140_260,
  OriginalRow227TriangleData1667.coefficient140_261,
  OriginalRow227TriangleData1667.coefficient140_262,
  OriginalRow227TriangleData1667.coefficient140_263,
  OriginalRow227TriangleData1667.coefficient140_264,
  OriginalRow227TriangleData1667.coefficient140_265,
  OriginalRow227TriangleData1667.coefficient140_266
]

theorem values1667_size : values1667.size = 32 := rfl

def block1667 : ℕ → Option IntervalDyadic := segment 235 values1667

theorem block1667_domain : ExactDomain block1667 235 267 := by
  simpa only [values1667_size] using segment_domain 235 values1667

theorem block1667_get (i : Fin 32) :
    block1667 (235 + i.val) = some (values1667[i.val]'(by rw [values1667_size]; exact i.isLt)) := by
  exact segment_get 235 values1667 ⟨i.val, by rw [values1667_size]; exact i.isLt⟩

def values1668 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1668.coefficient140_267,
  OriginalRow227TriangleData1668.coefficient140_268,
  OriginalRow227TriangleData1668.coefficient140_269,
  OriginalRow227TriangleData1668.coefficient140_270,
  OriginalRow227TriangleData1668.coefficient140_271,
  OriginalRow227TriangleData1668.coefficient140_272,
  OriginalRow227TriangleData1668.coefficient140_273,
  OriginalRow227TriangleData1668.coefficient140_274,
  OriginalRow227TriangleData1668.coefficient140_275,
  OriginalRow227TriangleData1668.coefficient140_276,
  OriginalRow227TriangleData1668.coefficient140_277,
  OriginalRow227TriangleData1668.coefficient140_278,
  OriginalRow227TriangleData1668.coefficient140_279,
  OriginalRow227TriangleData1668.coefficient140_280,
  OriginalRow227TriangleData1668.coefficient140_281,
  OriginalRow227TriangleData1668.coefficient140_282,
  OriginalRow227TriangleData1668.coefficient140_283,
  OriginalRow227TriangleData1668.coefficient140_284,
  OriginalRow227TriangleData1668.coefficient140_285,
  OriginalRow227TriangleData1668.coefficient140_286,
  OriginalRow227TriangleData1668.coefficient140_287,
  OriginalRow227TriangleData1668.coefficient140_288,
  OriginalRow227TriangleData1668.coefficient140_289,
  OriginalRow227TriangleData1668.coefficient140_290,
  OriginalRow227TriangleData1668.coefficient140_291,
  OriginalRow227TriangleData1668.coefficient140_292,
  OriginalRow227TriangleData1668.coefficient140_293,
  OriginalRow227TriangleData1668.coefficient140_294,
  OriginalRow227TriangleData1668.coefficient140_295,
  OriginalRow227TriangleData1668.coefficient140_296,
  OriginalRow227TriangleData1668.coefficient140_297,
  OriginalRow227TriangleData1668.coefficient140_298
]

theorem values1668_size : values1668.size = 32 := rfl

def block1668 : ℕ → Option IntervalDyadic := segment 267 values1668

theorem block1668_domain : ExactDomain block1668 267 299 := by
  simpa only [values1668_size] using segment_domain 267 values1668

theorem block1668_get (i : Fin 32) :
    block1668 (267 + i.val) = some (values1668[i.val]'(by rw [values1668_size]; exact i.isLt)) := by
  exact segment_get 267 values1668 ⟨i.val, by rw [values1668_size]; exact i.isLt⟩

def values1669 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1669.coefficient140_299,
  OriginalRow227TriangleData1669.coefficient140_300,
  OriginalRow227TriangleData1669.coefficient140_301,
  OriginalRow227TriangleData1669.coefficient140_302,
  OriginalRow227TriangleData1669.coefficient140_303,
  OriginalRow227TriangleData1669.coefficient140_304,
  OriginalRow227TriangleData1669.coefficient140_305,
  OriginalRow227TriangleData1669.coefficient140_306,
  OriginalRow227TriangleData1669.coefficient140_307,
  OriginalRow227TriangleData1669.coefficient140_308,
  OriginalRow227TriangleData1669.coefficient140_309,
  OriginalRow227TriangleData1669.coefficient140_310,
  OriginalRow227TriangleData1669.coefficient140_311,
  OriginalRow227TriangleData1669.coefficient140_312,
  OriginalRow227TriangleData1669.coefficient140_313,
  OriginalRow227TriangleData1669.coefficient140_314,
  OriginalRow227TriangleData1669.coefficient140_315,
  OriginalRow227TriangleData1669.coefficient140_316,
  OriginalRow227TriangleData1669.coefficient140_317,
  OriginalRow227TriangleData1669.coefficient140_318,
  OriginalRow227TriangleData1669.coefficient140_319,
  OriginalRow227TriangleData1669.coefficient140_320,
  OriginalRow227TriangleData1669.coefficient140_321,
  OriginalRow227TriangleData1669.coefficient140_322,
  OriginalRow227TriangleData1669.coefficient140_323,
  OriginalRow227TriangleData1669.coefficient140_324,
  OriginalRow227TriangleData1669.coefficient140_325,
  OriginalRow227TriangleData1669.coefficient140_326,
  OriginalRow227TriangleData1669.coefficient140_327,
  OriginalRow227TriangleData1669.coefficient140_328,
  OriginalRow227TriangleData1669.coefficient140_329,
  OriginalRow227TriangleData1669.coefficient140_330
]

theorem values1669_size : values1669.size = 32 := rfl

def block1669 : ℕ → Option IntervalDyadic := segment 299 values1669

theorem block1669_domain : ExactDomain block1669 299 331 := by
  simpa only [values1669_size] using segment_domain 299 values1669

theorem block1669_get (i : Fin 32) :
    block1669 (299 + i.val) = some (values1669[i.val]'(by rw [values1669_size]; exact i.isLt)) := by
  exact segment_get 299 values1669 ⟨i.val, by rw [values1669_size]; exact i.isLt⟩

def values1670 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1670.coefficient140_331,
  OriginalRow227TriangleData1670.coefficient140_332,
  OriginalRow227TriangleData1670.coefficient140_333,
  OriginalRow227TriangleData1670.coefficient140_334,
  OriginalRow227TriangleData1670.coefficient140_335,
  OriginalRow227TriangleData1670.coefficient140_336,
  OriginalRow227TriangleData1670.coefficient140_337,
  OriginalRow227TriangleData1670.coefficient140_338,
  OriginalRow227TriangleData1670.coefficient140_339,
  OriginalRow227TriangleData1670.coefficient140_340,
  OriginalRow227TriangleData1670.coefficient140_341,
  OriginalRow227TriangleData1670.coefficient140_342,
  OriginalRow227TriangleData1670.coefficient140_343,
  OriginalRow227TriangleData1670.coefficient140_344,
  OriginalRow227TriangleData1670.coefficient140_345,
  OriginalRow227TriangleData1670.coefficient140_346,
  OriginalRow227TriangleData1670.coefficient140_347,
  OriginalRow227TriangleData1670.coefficient140_348,
  OriginalRow227TriangleData1670.coefficient140_349,
  OriginalRow227TriangleData1670.coefficient140_350,
  OriginalRow227TriangleData1670.coefficient140_351,
  OriginalRow227TriangleData1670.coefficient140_352,
  OriginalRow227TriangleData1670.coefficient140_353,
  OriginalRow227TriangleData1670.coefficient140_354,
  OriginalRow227TriangleData1670.coefficient140_355,
  OriginalRow227TriangleData1670.coefficient140_356,
  OriginalRow227TriangleData1670.coefficient140_357,
  OriginalRow227TriangleData1670.coefficient140_358,
  OriginalRow227TriangleData1670.coefficient140_359,
  OriginalRow227TriangleData1670.coefficient140_360,
  OriginalRow227TriangleData1670.coefficient140_361
]

theorem values1670_size : values1670.size = 31 := rfl

def block1670 : ℕ → Option IntervalDyadic := segment 331 values1670

theorem block1670_domain : ExactDomain block1670 331 362 := by
  simpa only [values1670_size] using segment_domain 331 values1670

theorem block1670_get (i : Fin 31) :
    block1670 (331 + i.val) = some (values1670[i.val]'(by rw [values1670_size]; exact i.isLt)) := by
  exact segment_get 331 values1670 ⟨i.val, by rw [values1670_size]; exact i.isLt⟩

def node0171_0235 : ℕ → Option IntervalDyadic := split 203 block1665 block1666

theorem node0171_0235_domain : ExactDomain node0171_0235 171 235 := by
  exact split_domain (by decide) (by decide) block1665_domain block1666_domain

def node0139_0235 : ℕ → Option IntervalDyadic := split 171 block1664 node0171_0235

theorem node0139_0235_domain : ExactDomain node0139_0235 139 235 := by
  exact split_domain (by decide) (by decide) block1664_domain node0171_0235_domain

def node0235_0299 : ℕ → Option IntervalDyadic := split 267 block1667 block1668

theorem node0235_0299_domain : ExactDomain node0235_0299 235 299 := by
  exact split_domain (by decide) (by decide) block1667_domain block1668_domain

def node0299_0362 : ℕ → Option IntervalDyadic := split 331 block1669 block1670

theorem node0299_0362_domain : ExactDomain node0299_0362 299 362 := by
  exact split_domain (by decide) (by decide) block1669_domain block1670_domain

def node0235_0362 : ℕ → Option IntervalDyadic := split 299 node0235_0299 node0299_0362

theorem node0235_0362_domain : ExactDomain node0235_0362 235 362 := by
  exact split_domain (by decide) (by decide) node0235_0299_domain node0299_0362_domain

def node0139_0362 : ℕ → Option IntervalDyadic := split 235 node0139_0235 node0235_0362

theorem node0139_0362_domain : ExactDomain node0139_0362 139 362 := by
  exact split_domain (by decide) (by decide) node0139_0235_domain node0235_0362_domain

def lookup : ℕ → Option IntervalDyadic := node0139_0362

theorem lookup_domain : ExactDomain lookup 139 362 :=
  node0139_0362_domain

theorem block1664_lookup (i : Fin 32) :
    lookup (139 + i.val) = some (values1664[i.val]'(by rw [values1664_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0139_0362 (139 + i.val) = _
  rw [node0139_0362, split_left 235 node0139_0235 node0235_0362 (by omega)]
  rw [node0139_0235, split_left 171 block1664 node0171_0235 (by omega)]
  exact block1664_get i

theorem block1665_lookup (i : Fin 32) :
    lookup (171 + i.val) = some (values1665[i.val]'(by rw [values1665_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0139_0362 (171 + i.val) = _
  rw [node0139_0362, split_left 235 node0139_0235 node0235_0362 (by omega)]
  rw [node0139_0235, split_right 171 block1664 node0171_0235 (by omega)]
  rw [node0171_0235, split_left 203 block1665 block1666 (by omega)]
  exact block1665_get i

theorem block1666_lookup (i : Fin 32) :
    lookup (203 + i.val) = some (values1666[i.val]'(by rw [values1666_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0139_0362 (203 + i.val) = _
  rw [node0139_0362, split_left 235 node0139_0235 node0235_0362 (by omega)]
  rw [node0139_0235, split_right 171 block1664 node0171_0235 (by omega)]
  rw [node0171_0235, split_right 203 block1665 block1666 (by omega)]
  exact block1666_get i

theorem block1667_lookup (i : Fin 32) :
    lookup (235 + i.val) = some (values1667[i.val]'(by rw [values1667_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0139_0362 (235 + i.val) = _
  rw [node0139_0362, split_right 235 node0139_0235 node0235_0362 (by omega)]
  rw [node0235_0362, split_left 299 node0235_0299 node0299_0362 (by omega)]
  rw [node0235_0299, split_left 267 block1667 block1668 (by omega)]
  exact block1667_get i

theorem block1668_lookup (i : Fin 32) :
    lookup (267 + i.val) = some (values1668[i.val]'(by rw [values1668_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0139_0362 (267 + i.val) = _
  rw [node0139_0362, split_right 235 node0139_0235 node0235_0362 (by omega)]
  rw [node0235_0362, split_left 299 node0235_0299 node0299_0362 (by omega)]
  rw [node0235_0299, split_right 267 block1667 block1668 (by omega)]
  exact block1668_get i

theorem block1669_lookup (i : Fin 32) :
    lookup (299 + i.val) = some (values1669[i.val]'(by rw [values1669_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0139_0362 (299 + i.val) = _
  rw [node0139_0362, split_right 235 node0139_0235 node0235_0362 (by omega)]
  rw [node0235_0362, split_right 299 node0235_0299 node0299_0362 (by omega)]
  rw [node0299_0362, split_left 331 block1669 block1670 (by omega)]
  exact block1669_get i

theorem block1670_lookup (i : Fin 31) :
    lookup (331 + i.val) = some (values1670[i.val]'(by rw [values1670_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0139_0362 (331 + i.val) = _
  rw [node0139_0362, split_right 235 node0139_0235 node0235_0362 (by omega)]
  rw [node0235_0362, split_right 299 node0235_0299 node0299_0362 (by omega)]
  rw [node0299_0362, split_right 331 block1669 block1670 (by omega)]
  exact block1670_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1664_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1664_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1665_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1665_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1666_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1666_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1667_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1667_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1668_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1668_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1669_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1669_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1670_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1670_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1664_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1665_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1666_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1667_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1668_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1669_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow140.block1670_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow140
