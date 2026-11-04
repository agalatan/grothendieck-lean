import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1755
import Grothe.UpperChaos.OriginalRow227TriangleData1756
import Grothe.UpperChaos.OriginalRow227TriangleData1757
import Grothe.UpperChaos.OriginalRow227TriangleData1758
import Grothe.UpperChaos.OriginalRow227TriangleData1759
import Grothe.UpperChaos.OriginalRow227TriangleData1760
import Grothe.UpperChaos.OriginalRow227TriangleData1761

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow153

open ConditionalTableLookup

def values1755 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1755.coefficient153_152,
  OriginalRow227TriangleData1755.coefficient153_153,
  OriginalRow227TriangleData1755.coefficient153_154,
  OriginalRow227TriangleData1755.coefficient153_155,
  OriginalRow227TriangleData1755.coefficient153_156,
  OriginalRow227TriangleData1755.coefficient153_157,
  OriginalRow227TriangleData1755.coefficient153_158,
  OriginalRow227TriangleData1755.coefficient153_159,
  OriginalRow227TriangleData1755.coefficient153_160,
  OriginalRow227TriangleData1755.coefficient153_161,
  OriginalRow227TriangleData1755.coefficient153_162,
  OriginalRow227TriangleData1755.coefficient153_163,
  OriginalRow227TriangleData1755.coefficient153_164,
  OriginalRow227TriangleData1755.coefficient153_165,
  OriginalRow227TriangleData1755.coefficient153_166,
  OriginalRow227TriangleData1755.coefficient153_167,
  OriginalRow227TriangleData1755.coefficient153_168,
  OriginalRow227TriangleData1755.coefficient153_169,
  OriginalRow227TriangleData1755.coefficient153_170,
  OriginalRow227TriangleData1755.coefficient153_171,
  OriginalRow227TriangleData1755.coefficient153_172,
  OriginalRow227TriangleData1755.coefficient153_173,
  OriginalRow227TriangleData1755.coefficient153_174,
  OriginalRow227TriangleData1755.coefficient153_175,
  OriginalRow227TriangleData1755.coefficient153_176,
  OriginalRow227TriangleData1755.coefficient153_177,
  OriginalRow227TriangleData1755.coefficient153_178,
  OriginalRow227TriangleData1755.coefficient153_179,
  OriginalRow227TriangleData1755.coefficient153_180,
  OriginalRow227TriangleData1755.coefficient153_181,
  OriginalRow227TriangleData1755.coefficient153_182,
  OriginalRow227TriangleData1755.coefficient153_183
]

theorem values1755_size : values1755.size = 32 := rfl

def block1755 : ℕ → Option IntervalDyadic := segment 152 values1755

theorem block1755_domain : ExactDomain block1755 152 184 := by
  simpa only [values1755_size] using segment_domain 152 values1755

theorem block1755_get (i : Fin 32) :
    block1755 (152 + i.val) = some (values1755[i.val]'(by rw [values1755_size]; exact i.isLt)) := by
  exact segment_get 152 values1755 ⟨i.val, by rw [values1755_size]; exact i.isLt⟩

def values1756 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1756.coefficient153_184,
  OriginalRow227TriangleData1756.coefficient153_185,
  OriginalRow227TriangleData1756.coefficient153_186,
  OriginalRow227TriangleData1756.coefficient153_187,
  OriginalRow227TriangleData1756.coefficient153_188,
  OriginalRow227TriangleData1756.coefficient153_189,
  OriginalRow227TriangleData1756.coefficient153_190,
  OriginalRow227TriangleData1756.coefficient153_191,
  OriginalRow227TriangleData1756.coefficient153_192,
  OriginalRow227TriangleData1756.coefficient153_193,
  OriginalRow227TriangleData1756.coefficient153_194,
  OriginalRow227TriangleData1756.coefficient153_195,
  OriginalRow227TriangleData1756.coefficient153_196,
  OriginalRow227TriangleData1756.coefficient153_197,
  OriginalRow227TriangleData1756.coefficient153_198,
  OriginalRow227TriangleData1756.coefficient153_199,
  OriginalRow227TriangleData1756.coefficient153_200,
  OriginalRow227TriangleData1756.coefficient153_201,
  OriginalRow227TriangleData1756.coefficient153_202,
  OriginalRow227TriangleData1756.coefficient153_203,
  OriginalRow227TriangleData1756.coefficient153_204,
  OriginalRow227TriangleData1756.coefficient153_205,
  OriginalRow227TriangleData1756.coefficient153_206,
  OriginalRow227TriangleData1756.coefficient153_207,
  OriginalRow227TriangleData1756.coefficient153_208,
  OriginalRow227TriangleData1756.coefficient153_209,
  OriginalRow227TriangleData1756.coefficient153_210,
  OriginalRow227TriangleData1756.coefficient153_211,
  OriginalRow227TriangleData1756.coefficient153_212,
  OriginalRow227TriangleData1756.coefficient153_213,
  OriginalRow227TriangleData1756.coefficient153_214,
  OriginalRow227TriangleData1756.coefficient153_215
]

theorem values1756_size : values1756.size = 32 := rfl

def block1756 : ℕ → Option IntervalDyadic := segment 184 values1756

theorem block1756_domain : ExactDomain block1756 184 216 := by
  simpa only [values1756_size] using segment_domain 184 values1756

theorem block1756_get (i : Fin 32) :
    block1756 (184 + i.val) = some (values1756[i.val]'(by rw [values1756_size]; exact i.isLt)) := by
  exact segment_get 184 values1756 ⟨i.val, by rw [values1756_size]; exact i.isLt⟩

def values1757 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1757.coefficient153_216,
  OriginalRow227TriangleData1757.coefficient153_217,
  OriginalRow227TriangleData1757.coefficient153_218,
  OriginalRow227TriangleData1757.coefficient153_219,
  OriginalRow227TriangleData1757.coefficient153_220,
  OriginalRow227TriangleData1757.coefficient153_221,
  OriginalRow227TriangleData1757.coefficient153_222,
  OriginalRow227TriangleData1757.coefficient153_223,
  OriginalRow227TriangleData1757.coefficient153_224,
  OriginalRow227TriangleData1757.coefficient153_225,
  OriginalRow227TriangleData1757.coefficient153_226,
  OriginalRow227TriangleData1757.coefficient153_227,
  OriginalRow227TriangleData1757.coefficient153_228,
  OriginalRow227TriangleData1757.coefficient153_229,
  OriginalRow227TriangleData1757.coefficient153_230,
  OriginalRow227TriangleData1757.coefficient153_231,
  OriginalRow227TriangleData1757.coefficient153_232,
  OriginalRow227TriangleData1757.coefficient153_233,
  OriginalRow227TriangleData1757.coefficient153_234,
  OriginalRow227TriangleData1757.coefficient153_235,
  OriginalRow227TriangleData1757.coefficient153_236,
  OriginalRow227TriangleData1757.coefficient153_237,
  OriginalRow227TriangleData1757.coefficient153_238,
  OriginalRow227TriangleData1757.coefficient153_239,
  OriginalRow227TriangleData1757.coefficient153_240,
  OriginalRow227TriangleData1757.coefficient153_241,
  OriginalRow227TriangleData1757.coefficient153_242,
  OriginalRow227TriangleData1757.coefficient153_243,
  OriginalRow227TriangleData1757.coefficient153_244,
  OriginalRow227TriangleData1757.coefficient153_245,
  OriginalRow227TriangleData1757.coefficient153_246,
  OriginalRow227TriangleData1757.coefficient153_247
]

theorem values1757_size : values1757.size = 32 := rfl

def block1757 : ℕ → Option IntervalDyadic := segment 216 values1757

theorem block1757_domain : ExactDomain block1757 216 248 := by
  simpa only [values1757_size] using segment_domain 216 values1757

theorem block1757_get (i : Fin 32) :
    block1757 (216 + i.val) = some (values1757[i.val]'(by rw [values1757_size]; exact i.isLt)) := by
  exact segment_get 216 values1757 ⟨i.val, by rw [values1757_size]; exact i.isLt⟩

def values1758 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1758.coefficient153_248,
  OriginalRow227TriangleData1758.coefficient153_249,
  OriginalRow227TriangleData1758.coefficient153_250,
  OriginalRow227TriangleData1758.coefficient153_251,
  OriginalRow227TriangleData1758.coefficient153_252,
  OriginalRow227TriangleData1758.coefficient153_253,
  OriginalRow227TriangleData1758.coefficient153_254,
  OriginalRow227TriangleData1758.coefficient153_255,
  OriginalRow227TriangleData1758.coefficient153_256,
  OriginalRow227TriangleData1758.coefficient153_257,
  OriginalRow227TriangleData1758.coefficient153_258,
  OriginalRow227TriangleData1758.coefficient153_259,
  OriginalRow227TriangleData1758.coefficient153_260,
  OriginalRow227TriangleData1758.coefficient153_261,
  OriginalRow227TriangleData1758.coefficient153_262,
  OriginalRow227TriangleData1758.coefficient153_263,
  OriginalRow227TriangleData1758.coefficient153_264,
  OriginalRow227TriangleData1758.coefficient153_265,
  OriginalRow227TriangleData1758.coefficient153_266,
  OriginalRow227TriangleData1758.coefficient153_267,
  OriginalRow227TriangleData1758.coefficient153_268,
  OriginalRow227TriangleData1758.coefficient153_269,
  OriginalRow227TriangleData1758.coefficient153_270,
  OriginalRow227TriangleData1758.coefficient153_271,
  OriginalRow227TriangleData1758.coefficient153_272,
  OriginalRow227TriangleData1758.coefficient153_273,
  OriginalRow227TriangleData1758.coefficient153_274,
  OriginalRow227TriangleData1758.coefficient153_275,
  OriginalRow227TriangleData1758.coefficient153_276,
  OriginalRow227TriangleData1758.coefficient153_277,
  OriginalRow227TriangleData1758.coefficient153_278,
  OriginalRow227TriangleData1758.coefficient153_279
]

theorem values1758_size : values1758.size = 32 := rfl

def block1758 : ℕ → Option IntervalDyadic := segment 248 values1758

theorem block1758_domain : ExactDomain block1758 248 280 := by
  simpa only [values1758_size] using segment_domain 248 values1758

theorem block1758_get (i : Fin 32) :
    block1758 (248 + i.val) = some (values1758[i.val]'(by rw [values1758_size]; exact i.isLt)) := by
  exact segment_get 248 values1758 ⟨i.val, by rw [values1758_size]; exact i.isLt⟩

def values1759 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1759.coefficient153_280,
  OriginalRow227TriangleData1759.coefficient153_281,
  OriginalRow227TriangleData1759.coefficient153_282,
  OriginalRow227TriangleData1759.coefficient153_283,
  OriginalRow227TriangleData1759.coefficient153_284,
  OriginalRow227TriangleData1759.coefficient153_285,
  OriginalRow227TriangleData1759.coefficient153_286,
  OriginalRow227TriangleData1759.coefficient153_287,
  OriginalRow227TriangleData1759.coefficient153_288,
  OriginalRow227TriangleData1759.coefficient153_289,
  OriginalRow227TriangleData1759.coefficient153_290,
  OriginalRow227TriangleData1759.coefficient153_291,
  OriginalRow227TriangleData1759.coefficient153_292,
  OriginalRow227TriangleData1759.coefficient153_293,
  OriginalRow227TriangleData1759.coefficient153_294,
  OriginalRow227TriangleData1759.coefficient153_295,
  OriginalRow227TriangleData1759.coefficient153_296,
  OriginalRow227TriangleData1759.coefficient153_297,
  OriginalRow227TriangleData1759.coefficient153_298,
  OriginalRow227TriangleData1759.coefficient153_299,
  OriginalRow227TriangleData1759.coefficient153_300,
  OriginalRow227TriangleData1759.coefficient153_301,
  OriginalRow227TriangleData1759.coefficient153_302,
  OriginalRow227TriangleData1759.coefficient153_303,
  OriginalRow227TriangleData1759.coefficient153_304,
  OriginalRow227TriangleData1759.coefficient153_305,
  OriginalRow227TriangleData1759.coefficient153_306,
  OriginalRow227TriangleData1759.coefficient153_307,
  OriginalRow227TriangleData1759.coefficient153_308,
  OriginalRow227TriangleData1759.coefficient153_309,
  OriginalRow227TriangleData1759.coefficient153_310,
  OriginalRow227TriangleData1759.coefficient153_311
]

theorem values1759_size : values1759.size = 32 := rfl

def block1759 : ℕ → Option IntervalDyadic := segment 280 values1759

theorem block1759_domain : ExactDomain block1759 280 312 := by
  simpa only [values1759_size] using segment_domain 280 values1759

theorem block1759_get (i : Fin 32) :
    block1759 (280 + i.val) = some (values1759[i.val]'(by rw [values1759_size]; exact i.isLt)) := by
  exact segment_get 280 values1759 ⟨i.val, by rw [values1759_size]; exact i.isLt⟩

def values1760 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1760.coefficient153_312,
  OriginalRow227TriangleData1760.coefficient153_313,
  OriginalRow227TriangleData1760.coefficient153_314,
  OriginalRow227TriangleData1760.coefficient153_315,
  OriginalRow227TriangleData1760.coefficient153_316,
  OriginalRow227TriangleData1760.coefficient153_317,
  OriginalRow227TriangleData1760.coefficient153_318,
  OriginalRow227TriangleData1760.coefficient153_319,
  OriginalRow227TriangleData1760.coefficient153_320,
  OriginalRow227TriangleData1760.coefficient153_321,
  OriginalRow227TriangleData1760.coefficient153_322,
  OriginalRow227TriangleData1760.coefficient153_323,
  OriginalRow227TriangleData1760.coefficient153_324,
  OriginalRow227TriangleData1760.coefficient153_325,
  OriginalRow227TriangleData1760.coefficient153_326,
  OriginalRow227TriangleData1760.coefficient153_327,
  OriginalRow227TriangleData1760.coefficient153_328,
  OriginalRow227TriangleData1760.coefficient153_329,
  OriginalRow227TriangleData1760.coefficient153_330,
  OriginalRow227TriangleData1760.coefficient153_331,
  OriginalRow227TriangleData1760.coefficient153_332,
  OriginalRow227TriangleData1760.coefficient153_333,
  OriginalRow227TriangleData1760.coefficient153_334,
  OriginalRow227TriangleData1760.coefficient153_335,
  OriginalRow227TriangleData1760.coefficient153_336,
  OriginalRow227TriangleData1760.coefficient153_337,
  OriginalRow227TriangleData1760.coefficient153_338,
  OriginalRow227TriangleData1760.coefficient153_339,
  OriginalRow227TriangleData1760.coefficient153_340,
  OriginalRow227TriangleData1760.coefficient153_341,
  OriginalRow227TriangleData1760.coefficient153_342,
  OriginalRow227TriangleData1760.coefficient153_343
]

theorem values1760_size : values1760.size = 32 := rfl

def block1760 : ℕ → Option IntervalDyadic := segment 312 values1760

theorem block1760_domain : ExactDomain block1760 312 344 := by
  simpa only [values1760_size] using segment_domain 312 values1760

theorem block1760_get (i : Fin 32) :
    block1760 (312 + i.val) = some (values1760[i.val]'(by rw [values1760_size]; exact i.isLt)) := by
  exact segment_get 312 values1760 ⟨i.val, by rw [values1760_size]; exact i.isLt⟩

def values1761 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1761.coefficient153_344,
  OriginalRow227TriangleData1761.coefficient153_345,
  OriginalRow227TriangleData1761.coefficient153_346,
  OriginalRow227TriangleData1761.coefficient153_347,
  OriginalRow227TriangleData1761.coefficient153_348
]

theorem values1761_size : values1761.size = 5 := rfl

def block1761 : ℕ → Option IntervalDyadic := segment 344 values1761

theorem block1761_domain : ExactDomain block1761 344 349 := by
  simpa only [values1761_size] using segment_domain 344 values1761

theorem block1761_get (i : Fin 5) :
    block1761 (344 + i.val) = some (values1761[i.val]'(by rw [values1761_size]; exact i.isLt)) := by
  exact segment_get 344 values1761 ⟨i.val, by rw [values1761_size]; exact i.isLt⟩

def node0184_0248 : ℕ → Option IntervalDyadic := split 216 block1756 block1757

theorem node0184_0248_domain : ExactDomain node0184_0248 184 248 := by
  exact split_domain (by decide) (by decide) block1756_domain block1757_domain

def node0152_0248 : ℕ → Option IntervalDyadic := split 184 block1755 node0184_0248

theorem node0152_0248_domain : ExactDomain node0152_0248 152 248 := by
  exact split_domain (by decide) (by decide) block1755_domain node0184_0248_domain

def node0248_0312 : ℕ → Option IntervalDyadic := split 280 block1758 block1759

theorem node0248_0312_domain : ExactDomain node0248_0312 248 312 := by
  exact split_domain (by decide) (by decide) block1758_domain block1759_domain

def node0312_0349 : ℕ → Option IntervalDyadic := split 344 block1760 block1761

theorem node0312_0349_domain : ExactDomain node0312_0349 312 349 := by
  exact split_domain (by decide) (by decide) block1760_domain block1761_domain

def node0248_0349 : ℕ → Option IntervalDyadic := split 312 node0248_0312 node0312_0349

theorem node0248_0349_domain : ExactDomain node0248_0349 248 349 := by
  exact split_domain (by decide) (by decide) node0248_0312_domain node0312_0349_domain

def node0152_0349 : ℕ → Option IntervalDyadic := split 248 node0152_0248 node0248_0349

theorem node0152_0349_domain : ExactDomain node0152_0349 152 349 := by
  exact split_domain (by decide) (by decide) node0152_0248_domain node0248_0349_domain

def lookup : ℕ → Option IntervalDyadic := node0152_0349

theorem lookup_domain : ExactDomain lookup 152 349 :=
  node0152_0349_domain

theorem block1755_lookup (i : Fin 32) :
    lookup (152 + i.val) = some (values1755[i.val]'(by rw [values1755_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0152_0349 (152 + i.val) = _
  rw [node0152_0349, split_left 248 node0152_0248 node0248_0349 (by omega)]
  rw [node0152_0248, split_left 184 block1755 node0184_0248 (by omega)]
  exact block1755_get i

theorem block1756_lookup (i : Fin 32) :
    lookup (184 + i.val) = some (values1756[i.val]'(by rw [values1756_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0152_0349 (184 + i.val) = _
  rw [node0152_0349, split_left 248 node0152_0248 node0248_0349 (by omega)]
  rw [node0152_0248, split_right 184 block1755 node0184_0248 (by omega)]
  rw [node0184_0248, split_left 216 block1756 block1757 (by omega)]
  exact block1756_get i

theorem block1757_lookup (i : Fin 32) :
    lookup (216 + i.val) = some (values1757[i.val]'(by rw [values1757_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0152_0349 (216 + i.val) = _
  rw [node0152_0349, split_left 248 node0152_0248 node0248_0349 (by omega)]
  rw [node0152_0248, split_right 184 block1755 node0184_0248 (by omega)]
  rw [node0184_0248, split_right 216 block1756 block1757 (by omega)]
  exact block1757_get i

theorem block1758_lookup (i : Fin 32) :
    lookup (248 + i.val) = some (values1758[i.val]'(by rw [values1758_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0152_0349 (248 + i.val) = _
  rw [node0152_0349, split_right 248 node0152_0248 node0248_0349 (by omega)]
  rw [node0248_0349, split_left 312 node0248_0312 node0312_0349 (by omega)]
  rw [node0248_0312, split_left 280 block1758 block1759 (by omega)]
  exact block1758_get i

theorem block1759_lookup (i : Fin 32) :
    lookup (280 + i.val) = some (values1759[i.val]'(by rw [values1759_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0152_0349 (280 + i.val) = _
  rw [node0152_0349, split_right 248 node0152_0248 node0248_0349 (by omega)]
  rw [node0248_0349, split_left 312 node0248_0312 node0312_0349 (by omega)]
  rw [node0248_0312, split_right 280 block1758 block1759 (by omega)]
  exact block1759_get i

theorem block1760_lookup (i : Fin 32) :
    lookup (312 + i.val) = some (values1760[i.val]'(by rw [values1760_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0152_0349 (312 + i.val) = _
  rw [node0152_0349, split_right 248 node0152_0248 node0248_0349 (by omega)]
  rw [node0248_0349, split_right 312 node0248_0312 node0312_0349 (by omega)]
  rw [node0312_0349, split_left 344 block1760 block1761 (by omega)]
  exact block1760_get i

theorem block1761_lookup (i : Fin 5) :
    lookup (344 + i.val) = some (values1761[i.val]'(by rw [values1761_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0152_0349 (344 + i.val) = _
  rw [node0152_0349, split_right 248 node0152_0248 node0248_0349 (by omega)]
  rw [node0248_0349, split_right 312 node0248_0312 node0312_0349 (by omega)]
  rw [node0312_0349, split_right 344 block1760 block1761 (by omega)]
  exact block1761_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1755_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1755_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1756_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1756_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1757_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1757_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1758_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1758_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1759_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1759_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1760_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1760_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1761_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1761_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1755_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1756_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1757_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1758_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1759_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1760_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow153.block1761_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow153
