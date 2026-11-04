import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1640
import Grothe.UpperChaos.OriginalRow227TriangleData1641
import Grothe.UpperChaos.OriginalRow227TriangleData1642
import Grothe.UpperChaos.OriginalRow227TriangleData1643
import Grothe.UpperChaos.OriginalRow227TriangleData1644
import Grothe.UpperChaos.OriginalRow227TriangleData1645
import Grothe.UpperChaos.OriginalRow227TriangleData1646
import Grothe.UpperChaos.OriginalRow227TriangleData1647

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow137

open ConditionalTableLookup

def values1640 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1640.coefficient137_136,
  OriginalRow227TriangleData1640.coefficient137_137,
  OriginalRow227TriangleData1640.coefficient137_138,
  OriginalRow227TriangleData1640.coefficient137_139,
  OriginalRow227TriangleData1640.coefficient137_140,
  OriginalRow227TriangleData1640.coefficient137_141,
  OriginalRow227TriangleData1640.coefficient137_142,
  OriginalRow227TriangleData1640.coefficient137_143,
  OriginalRow227TriangleData1640.coefficient137_144,
  OriginalRow227TriangleData1640.coefficient137_145,
  OriginalRow227TriangleData1640.coefficient137_146,
  OriginalRow227TriangleData1640.coefficient137_147,
  OriginalRow227TriangleData1640.coefficient137_148,
  OriginalRow227TriangleData1640.coefficient137_149,
  OriginalRow227TriangleData1640.coefficient137_150,
  OriginalRow227TriangleData1640.coefficient137_151,
  OriginalRow227TriangleData1640.coefficient137_152,
  OriginalRow227TriangleData1640.coefficient137_153,
  OriginalRow227TriangleData1640.coefficient137_154,
  OriginalRow227TriangleData1640.coefficient137_155,
  OriginalRow227TriangleData1640.coefficient137_156,
  OriginalRow227TriangleData1640.coefficient137_157,
  OriginalRow227TriangleData1640.coefficient137_158,
  OriginalRow227TriangleData1640.coefficient137_159,
  OriginalRow227TriangleData1640.coefficient137_160,
  OriginalRow227TriangleData1640.coefficient137_161,
  OriginalRow227TriangleData1640.coefficient137_162,
  OriginalRow227TriangleData1640.coefficient137_163,
  OriginalRow227TriangleData1640.coefficient137_164,
  OriginalRow227TriangleData1640.coefficient137_165,
  OriginalRow227TriangleData1640.coefficient137_166,
  OriginalRow227TriangleData1640.coefficient137_167
]

theorem values1640_size : values1640.size = 32 := rfl

def block1640 : ℕ → Option IntervalDyadic := segment 136 values1640

theorem block1640_domain : ExactDomain block1640 136 168 := by
  simpa only [values1640_size] using segment_domain 136 values1640

theorem block1640_get (i : Fin 32) :
    block1640 (136 + i.val) = some (values1640[i.val]'(by rw [values1640_size]; exact i.isLt)) := by
  exact segment_get 136 values1640 ⟨i.val, by rw [values1640_size]; exact i.isLt⟩

def values1641 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1641.coefficient137_168,
  OriginalRow227TriangleData1641.coefficient137_169,
  OriginalRow227TriangleData1641.coefficient137_170,
  OriginalRow227TriangleData1641.coefficient137_171,
  OriginalRow227TriangleData1641.coefficient137_172,
  OriginalRow227TriangleData1641.coefficient137_173,
  OriginalRow227TriangleData1641.coefficient137_174,
  OriginalRow227TriangleData1641.coefficient137_175,
  OriginalRow227TriangleData1641.coefficient137_176,
  OriginalRow227TriangleData1641.coefficient137_177,
  OriginalRow227TriangleData1641.coefficient137_178,
  OriginalRow227TriangleData1641.coefficient137_179,
  OriginalRow227TriangleData1641.coefficient137_180,
  OriginalRow227TriangleData1641.coefficient137_181,
  OriginalRow227TriangleData1641.coefficient137_182,
  OriginalRow227TriangleData1641.coefficient137_183,
  OriginalRow227TriangleData1641.coefficient137_184,
  OriginalRow227TriangleData1641.coefficient137_185,
  OriginalRow227TriangleData1641.coefficient137_186,
  OriginalRow227TriangleData1641.coefficient137_187,
  OriginalRow227TriangleData1641.coefficient137_188,
  OriginalRow227TriangleData1641.coefficient137_189,
  OriginalRow227TriangleData1641.coefficient137_190,
  OriginalRow227TriangleData1641.coefficient137_191,
  OriginalRow227TriangleData1641.coefficient137_192,
  OriginalRow227TriangleData1641.coefficient137_193,
  OriginalRow227TriangleData1641.coefficient137_194,
  OriginalRow227TriangleData1641.coefficient137_195,
  OriginalRow227TriangleData1641.coefficient137_196,
  OriginalRow227TriangleData1641.coefficient137_197,
  OriginalRow227TriangleData1641.coefficient137_198,
  OriginalRow227TriangleData1641.coefficient137_199
]

theorem values1641_size : values1641.size = 32 := rfl

def block1641 : ℕ → Option IntervalDyadic := segment 168 values1641

theorem block1641_domain : ExactDomain block1641 168 200 := by
  simpa only [values1641_size] using segment_domain 168 values1641

theorem block1641_get (i : Fin 32) :
    block1641 (168 + i.val) = some (values1641[i.val]'(by rw [values1641_size]; exact i.isLt)) := by
  exact segment_get 168 values1641 ⟨i.val, by rw [values1641_size]; exact i.isLt⟩

def values1642 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1642.coefficient137_200,
  OriginalRow227TriangleData1642.coefficient137_201,
  OriginalRow227TriangleData1642.coefficient137_202,
  OriginalRow227TriangleData1642.coefficient137_203,
  OriginalRow227TriangleData1642.coefficient137_204,
  OriginalRow227TriangleData1642.coefficient137_205,
  OriginalRow227TriangleData1642.coefficient137_206,
  OriginalRow227TriangleData1642.coefficient137_207,
  OriginalRow227TriangleData1642.coefficient137_208,
  OriginalRow227TriangleData1642.coefficient137_209,
  OriginalRow227TriangleData1642.coefficient137_210,
  OriginalRow227TriangleData1642.coefficient137_211,
  OriginalRow227TriangleData1642.coefficient137_212,
  OriginalRow227TriangleData1642.coefficient137_213,
  OriginalRow227TriangleData1642.coefficient137_214,
  OriginalRow227TriangleData1642.coefficient137_215,
  OriginalRow227TriangleData1642.coefficient137_216,
  OriginalRow227TriangleData1642.coefficient137_217,
  OriginalRow227TriangleData1642.coefficient137_218,
  OriginalRow227TriangleData1642.coefficient137_219,
  OriginalRow227TriangleData1642.coefficient137_220,
  OriginalRow227TriangleData1642.coefficient137_221,
  OriginalRow227TriangleData1642.coefficient137_222,
  OriginalRow227TriangleData1642.coefficient137_223,
  OriginalRow227TriangleData1642.coefficient137_224,
  OriginalRow227TriangleData1642.coefficient137_225,
  OriginalRow227TriangleData1642.coefficient137_226,
  OriginalRow227TriangleData1642.coefficient137_227,
  OriginalRow227TriangleData1642.coefficient137_228,
  OriginalRow227TriangleData1642.coefficient137_229,
  OriginalRow227TriangleData1642.coefficient137_230,
  OriginalRow227TriangleData1642.coefficient137_231
]

theorem values1642_size : values1642.size = 32 := rfl

def block1642 : ℕ → Option IntervalDyadic := segment 200 values1642

theorem block1642_domain : ExactDomain block1642 200 232 := by
  simpa only [values1642_size] using segment_domain 200 values1642

theorem block1642_get (i : Fin 32) :
    block1642 (200 + i.val) = some (values1642[i.val]'(by rw [values1642_size]; exact i.isLt)) := by
  exact segment_get 200 values1642 ⟨i.val, by rw [values1642_size]; exact i.isLt⟩

def values1643 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1643.coefficient137_232,
  OriginalRow227TriangleData1643.coefficient137_233,
  OriginalRow227TriangleData1643.coefficient137_234,
  OriginalRow227TriangleData1643.coefficient137_235,
  OriginalRow227TriangleData1643.coefficient137_236,
  OriginalRow227TriangleData1643.coefficient137_237,
  OriginalRow227TriangleData1643.coefficient137_238,
  OriginalRow227TriangleData1643.coefficient137_239,
  OriginalRow227TriangleData1643.coefficient137_240,
  OriginalRow227TriangleData1643.coefficient137_241,
  OriginalRow227TriangleData1643.coefficient137_242,
  OriginalRow227TriangleData1643.coefficient137_243,
  OriginalRow227TriangleData1643.coefficient137_244,
  OriginalRow227TriangleData1643.coefficient137_245,
  OriginalRow227TriangleData1643.coefficient137_246,
  OriginalRow227TriangleData1643.coefficient137_247,
  OriginalRow227TriangleData1643.coefficient137_248,
  OriginalRow227TriangleData1643.coefficient137_249,
  OriginalRow227TriangleData1643.coefficient137_250,
  OriginalRow227TriangleData1643.coefficient137_251,
  OriginalRow227TriangleData1643.coefficient137_252,
  OriginalRow227TriangleData1643.coefficient137_253,
  OriginalRow227TriangleData1643.coefficient137_254,
  OriginalRow227TriangleData1643.coefficient137_255,
  OriginalRow227TriangleData1643.coefficient137_256,
  OriginalRow227TriangleData1643.coefficient137_257,
  OriginalRow227TriangleData1643.coefficient137_258,
  OriginalRow227TriangleData1643.coefficient137_259,
  OriginalRow227TriangleData1643.coefficient137_260,
  OriginalRow227TriangleData1643.coefficient137_261,
  OriginalRow227TriangleData1643.coefficient137_262,
  OriginalRow227TriangleData1643.coefficient137_263
]

theorem values1643_size : values1643.size = 32 := rfl

def block1643 : ℕ → Option IntervalDyadic := segment 232 values1643

theorem block1643_domain : ExactDomain block1643 232 264 := by
  simpa only [values1643_size] using segment_domain 232 values1643

theorem block1643_get (i : Fin 32) :
    block1643 (232 + i.val) = some (values1643[i.val]'(by rw [values1643_size]; exact i.isLt)) := by
  exact segment_get 232 values1643 ⟨i.val, by rw [values1643_size]; exact i.isLt⟩

def values1644 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1644.coefficient137_264,
  OriginalRow227TriangleData1644.coefficient137_265,
  OriginalRow227TriangleData1644.coefficient137_266,
  OriginalRow227TriangleData1644.coefficient137_267,
  OriginalRow227TriangleData1644.coefficient137_268,
  OriginalRow227TriangleData1644.coefficient137_269,
  OriginalRow227TriangleData1644.coefficient137_270,
  OriginalRow227TriangleData1644.coefficient137_271,
  OriginalRow227TriangleData1644.coefficient137_272,
  OriginalRow227TriangleData1644.coefficient137_273,
  OriginalRow227TriangleData1644.coefficient137_274,
  OriginalRow227TriangleData1644.coefficient137_275,
  OriginalRow227TriangleData1644.coefficient137_276,
  OriginalRow227TriangleData1644.coefficient137_277,
  OriginalRow227TriangleData1644.coefficient137_278,
  OriginalRow227TriangleData1644.coefficient137_279,
  OriginalRow227TriangleData1644.coefficient137_280,
  OriginalRow227TriangleData1644.coefficient137_281,
  OriginalRow227TriangleData1644.coefficient137_282,
  OriginalRow227TriangleData1644.coefficient137_283,
  OriginalRow227TriangleData1644.coefficient137_284,
  OriginalRow227TriangleData1644.coefficient137_285,
  OriginalRow227TriangleData1644.coefficient137_286,
  OriginalRow227TriangleData1644.coefficient137_287,
  OriginalRow227TriangleData1644.coefficient137_288,
  OriginalRow227TriangleData1644.coefficient137_289,
  OriginalRow227TriangleData1644.coefficient137_290,
  OriginalRow227TriangleData1644.coefficient137_291,
  OriginalRow227TriangleData1644.coefficient137_292,
  OriginalRow227TriangleData1644.coefficient137_293,
  OriginalRow227TriangleData1644.coefficient137_294,
  OriginalRow227TriangleData1644.coefficient137_295
]

theorem values1644_size : values1644.size = 32 := rfl

def block1644 : ℕ → Option IntervalDyadic := segment 264 values1644

theorem block1644_domain : ExactDomain block1644 264 296 := by
  simpa only [values1644_size] using segment_domain 264 values1644

theorem block1644_get (i : Fin 32) :
    block1644 (264 + i.val) = some (values1644[i.val]'(by rw [values1644_size]; exact i.isLt)) := by
  exact segment_get 264 values1644 ⟨i.val, by rw [values1644_size]; exact i.isLt⟩

def values1645 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1645.coefficient137_296,
  OriginalRow227TriangleData1645.coefficient137_297,
  OriginalRow227TriangleData1645.coefficient137_298,
  OriginalRow227TriangleData1645.coefficient137_299,
  OriginalRow227TriangleData1645.coefficient137_300,
  OriginalRow227TriangleData1645.coefficient137_301,
  OriginalRow227TriangleData1645.coefficient137_302,
  OriginalRow227TriangleData1645.coefficient137_303,
  OriginalRow227TriangleData1645.coefficient137_304,
  OriginalRow227TriangleData1645.coefficient137_305,
  OriginalRow227TriangleData1645.coefficient137_306,
  OriginalRow227TriangleData1645.coefficient137_307,
  OriginalRow227TriangleData1645.coefficient137_308,
  OriginalRow227TriangleData1645.coefficient137_309,
  OriginalRow227TriangleData1645.coefficient137_310,
  OriginalRow227TriangleData1645.coefficient137_311,
  OriginalRow227TriangleData1645.coefficient137_312,
  OriginalRow227TriangleData1645.coefficient137_313,
  OriginalRow227TriangleData1645.coefficient137_314,
  OriginalRow227TriangleData1645.coefficient137_315,
  OriginalRow227TriangleData1645.coefficient137_316,
  OriginalRow227TriangleData1645.coefficient137_317,
  OriginalRow227TriangleData1645.coefficient137_318,
  OriginalRow227TriangleData1645.coefficient137_319,
  OriginalRow227TriangleData1645.coefficient137_320,
  OriginalRow227TriangleData1645.coefficient137_321,
  OriginalRow227TriangleData1645.coefficient137_322,
  OriginalRow227TriangleData1645.coefficient137_323,
  OriginalRow227TriangleData1645.coefficient137_324,
  OriginalRow227TriangleData1645.coefficient137_325,
  OriginalRow227TriangleData1645.coefficient137_326,
  OriginalRow227TriangleData1645.coefficient137_327
]

theorem values1645_size : values1645.size = 32 := rfl

def block1645 : ℕ → Option IntervalDyadic := segment 296 values1645

theorem block1645_domain : ExactDomain block1645 296 328 := by
  simpa only [values1645_size] using segment_domain 296 values1645

theorem block1645_get (i : Fin 32) :
    block1645 (296 + i.val) = some (values1645[i.val]'(by rw [values1645_size]; exact i.isLt)) := by
  exact segment_get 296 values1645 ⟨i.val, by rw [values1645_size]; exact i.isLt⟩

def values1646 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1646.coefficient137_328,
  OriginalRow227TriangleData1646.coefficient137_329,
  OriginalRow227TriangleData1646.coefficient137_330,
  OriginalRow227TriangleData1646.coefficient137_331,
  OriginalRow227TriangleData1646.coefficient137_332,
  OriginalRow227TriangleData1646.coefficient137_333,
  OriginalRow227TriangleData1646.coefficient137_334,
  OriginalRow227TriangleData1646.coefficient137_335,
  OriginalRow227TriangleData1646.coefficient137_336,
  OriginalRow227TriangleData1646.coefficient137_337,
  OriginalRow227TriangleData1646.coefficient137_338,
  OriginalRow227TriangleData1646.coefficient137_339,
  OriginalRow227TriangleData1646.coefficient137_340,
  OriginalRow227TriangleData1646.coefficient137_341,
  OriginalRow227TriangleData1646.coefficient137_342,
  OriginalRow227TriangleData1646.coefficient137_343,
  OriginalRow227TriangleData1646.coefficient137_344,
  OriginalRow227TriangleData1646.coefficient137_345,
  OriginalRow227TriangleData1646.coefficient137_346,
  OriginalRow227TriangleData1646.coefficient137_347,
  OriginalRow227TriangleData1646.coefficient137_348,
  OriginalRow227TriangleData1646.coefficient137_349,
  OriginalRow227TriangleData1646.coefficient137_350,
  OriginalRow227TriangleData1646.coefficient137_351,
  OriginalRow227TriangleData1646.coefficient137_352,
  OriginalRow227TriangleData1646.coefficient137_353,
  OriginalRow227TriangleData1646.coefficient137_354,
  OriginalRow227TriangleData1646.coefficient137_355,
  OriginalRow227TriangleData1646.coefficient137_356,
  OriginalRow227TriangleData1646.coefficient137_357,
  OriginalRow227TriangleData1646.coefficient137_358,
  OriginalRow227TriangleData1646.coefficient137_359
]

theorem values1646_size : values1646.size = 32 := rfl

def block1646 : ℕ → Option IntervalDyadic := segment 328 values1646

theorem block1646_domain : ExactDomain block1646 328 360 := by
  simpa only [values1646_size] using segment_domain 328 values1646

theorem block1646_get (i : Fin 32) :
    block1646 (328 + i.val) = some (values1646[i.val]'(by rw [values1646_size]; exact i.isLt)) := by
  exact segment_get 328 values1646 ⟨i.val, by rw [values1646_size]; exact i.isLt⟩

def values1647 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1647.coefficient137_360,
  OriginalRow227TriangleData1647.coefficient137_361,
  OriginalRow227TriangleData1647.coefficient137_362,
  OriginalRow227TriangleData1647.coefficient137_363,
  OriginalRow227TriangleData1647.coefficient137_364
]

theorem values1647_size : values1647.size = 5 := rfl

def block1647 : ℕ → Option IntervalDyadic := segment 360 values1647

theorem block1647_domain : ExactDomain block1647 360 365 := by
  simpa only [values1647_size] using segment_domain 360 values1647

theorem block1647_get (i : Fin 5) :
    block1647 (360 + i.val) = some (values1647[i.val]'(by rw [values1647_size]; exact i.isLt)) := by
  exact segment_get 360 values1647 ⟨i.val, by rw [values1647_size]; exact i.isLt⟩

def node0136_0200 : ℕ → Option IntervalDyadic := split 168 block1640 block1641

theorem node0136_0200_domain : ExactDomain node0136_0200 136 200 := by
  exact split_domain (by decide) (by decide) block1640_domain block1641_domain

def node0200_0264 : ℕ → Option IntervalDyadic := split 232 block1642 block1643

theorem node0200_0264_domain : ExactDomain node0200_0264 200 264 := by
  exact split_domain (by decide) (by decide) block1642_domain block1643_domain

def node0136_0264 : ℕ → Option IntervalDyadic := split 200 node0136_0200 node0200_0264

theorem node0136_0264_domain : ExactDomain node0136_0264 136 264 := by
  exact split_domain (by decide) (by decide) node0136_0200_domain node0200_0264_domain

def node0264_0328 : ℕ → Option IntervalDyadic := split 296 block1644 block1645

theorem node0264_0328_domain : ExactDomain node0264_0328 264 328 := by
  exact split_domain (by decide) (by decide) block1644_domain block1645_domain

def node0328_0365 : ℕ → Option IntervalDyadic := split 360 block1646 block1647

theorem node0328_0365_domain : ExactDomain node0328_0365 328 365 := by
  exact split_domain (by decide) (by decide) block1646_domain block1647_domain

def node0264_0365 : ℕ → Option IntervalDyadic := split 328 node0264_0328 node0328_0365

theorem node0264_0365_domain : ExactDomain node0264_0365 264 365 := by
  exact split_domain (by decide) (by decide) node0264_0328_domain node0328_0365_domain

def node0136_0365 : ℕ → Option IntervalDyadic := split 264 node0136_0264 node0264_0365

theorem node0136_0365_domain : ExactDomain node0136_0365 136 365 := by
  exact split_domain (by decide) (by decide) node0136_0264_domain node0264_0365_domain

def lookup : ℕ → Option IntervalDyadic := node0136_0365

theorem lookup_domain : ExactDomain lookup 136 365 :=
  node0136_0365_domain

theorem block1640_lookup (i : Fin 32) :
    lookup (136 + i.val) = some (values1640[i.val]'(by rw [values1640_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (136 + i.val) = _
  rw [node0136_0365, split_left 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0136_0264, split_left 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0136_0200, split_left 168 block1640 block1641 (by omega)]
  exact block1640_get i

theorem block1641_lookup (i : Fin 32) :
    lookup (168 + i.val) = some (values1641[i.val]'(by rw [values1641_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (168 + i.val) = _
  rw [node0136_0365, split_left 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0136_0264, split_left 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0136_0200, split_right 168 block1640 block1641 (by omega)]
  exact block1641_get i

theorem block1642_lookup (i : Fin 32) :
    lookup (200 + i.val) = some (values1642[i.val]'(by rw [values1642_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (200 + i.val) = _
  rw [node0136_0365, split_left 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0136_0264, split_right 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0200_0264, split_left 232 block1642 block1643 (by omega)]
  exact block1642_get i

theorem block1643_lookup (i : Fin 32) :
    lookup (232 + i.val) = some (values1643[i.val]'(by rw [values1643_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (232 + i.val) = _
  rw [node0136_0365, split_left 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0136_0264, split_right 200 node0136_0200 node0200_0264 (by omega)]
  rw [node0200_0264, split_right 232 block1642 block1643 (by omega)]
  exact block1643_get i

theorem block1644_lookup (i : Fin 32) :
    lookup (264 + i.val) = some (values1644[i.val]'(by rw [values1644_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (264 + i.val) = _
  rw [node0136_0365, split_right 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0264_0365, split_left 328 node0264_0328 node0328_0365 (by omega)]
  rw [node0264_0328, split_left 296 block1644 block1645 (by omega)]
  exact block1644_get i

theorem block1645_lookup (i : Fin 32) :
    lookup (296 + i.val) = some (values1645[i.val]'(by rw [values1645_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (296 + i.val) = _
  rw [node0136_0365, split_right 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0264_0365, split_left 328 node0264_0328 node0328_0365 (by omega)]
  rw [node0264_0328, split_right 296 block1644 block1645 (by omega)]
  exact block1645_get i

theorem block1646_lookup (i : Fin 32) :
    lookup (328 + i.val) = some (values1646[i.val]'(by rw [values1646_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (328 + i.val) = _
  rw [node0136_0365, split_right 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0264_0365, split_right 328 node0264_0328 node0328_0365 (by omega)]
  rw [node0328_0365, split_left 360 block1646 block1647 (by omega)]
  exact block1646_get i

theorem block1647_lookup (i : Fin 5) :
    lookup (360 + i.val) = some (values1647[i.val]'(by rw [values1647_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0136_0365 (360 + i.val) = _
  rw [node0136_0365, split_right 264 node0136_0264 node0264_0365 (by omega)]
  rw [node0264_0365, split_right 328 node0264_0328 node0328_0365 (by omega)]
  rw [node0328_0365, split_right 360 block1646 block1647 (by omega)]
  exact block1647_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1640_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1640_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1641_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1641_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1642_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1642_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1643_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1643_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1644_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1644_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1645_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1645_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1646_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1646_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1647_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1647_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1640_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1641_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1642_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1643_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1644_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1645_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1646_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow137.block1647_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow137
