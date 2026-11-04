import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1830
import Grothe.UpperChaos.OriginalRow227TriangleData1831
import Grothe.UpperChaos.OriginalRow227TriangleData1832
import Grothe.UpperChaos.OriginalRow227TriangleData1833
import Grothe.UpperChaos.OriginalRow227TriangleData1834
import Grothe.UpperChaos.OriginalRow227TriangleData1835

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow165

open ConditionalTableLookup

def values1830 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1830.coefficient165_164,
  OriginalRow227TriangleData1830.coefficient165_165,
  OriginalRow227TriangleData1830.coefficient165_166,
  OriginalRow227TriangleData1830.coefficient165_167,
  OriginalRow227TriangleData1830.coefficient165_168,
  OriginalRow227TriangleData1830.coefficient165_169,
  OriginalRow227TriangleData1830.coefficient165_170,
  OriginalRow227TriangleData1830.coefficient165_171,
  OriginalRow227TriangleData1830.coefficient165_172,
  OriginalRow227TriangleData1830.coefficient165_173,
  OriginalRow227TriangleData1830.coefficient165_174,
  OriginalRow227TriangleData1830.coefficient165_175,
  OriginalRow227TriangleData1830.coefficient165_176,
  OriginalRow227TriangleData1830.coefficient165_177,
  OriginalRow227TriangleData1830.coefficient165_178,
  OriginalRow227TriangleData1830.coefficient165_179,
  OriginalRow227TriangleData1830.coefficient165_180,
  OriginalRow227TriangleData1830.coefficient165_181,
  OriginalRow227TriangleData1830.coefficient165_182,
  OriginalRow227TriangleData1830.coefficient165_183,
  OriginalRow227TriangleData1830.coefficient165_184,
  OriginalRow227TriangleData1830.coefficient165_185,
  OriginalRow227TriangleData1830.coefficient165_186,
  OriginalRow227TriangleData1830.coefficient165_187,
  OriginalRow227TriangleData1830.coefficient165_188,
  OriginalRow227TriangleData1830.coefficient165_189,
  OriginalRow227TriangleData1830.coefficient165_190,
  OriginalRow227TriangleData1830.coefficient165_191,
  OriginalRow227TriangleData1830.coefficient165_192,
  OriginalRow227TriangleData1830.coefficient165_193,
  OriginalRow227TriangleData1830.coefficient165_194,
  OriginalRow227TriangleData1830.coefficient165_195
]

theorem values1830_size : values1830.size = 32 := rfl

def block1830 : ℕ → Option IntervalDyadic := segment 164 values1830

theorem block1830_domain : ExactDomain block1830 164 196 := by
  simpa only [values1830_size] using segment_domain 164 values1830

theorem block1830_get (i : Fin 32) :
    block1830 (164 + i.val) = some (values1830[i.val]'(by rw [values1830_size]; exact i.isLt)) := by
  exact segment_get 164 values1830 ⟨i.val, by rw [values1830_size]; exact i.isLt⟩

def values1831 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1831.coefficient165_196,
  OriginalRow227TriangleData1831.coefficient165_197,
  OriginalRow227TriangleData1831.coefficient165_198,
  OriginalRow227TriangleData1831.coefficient165_199,
  OriginalRow227TriangleData1831.coefficient165_200,
  OriginalRow227TriangleData1831.coefficient165_201,
  OriginalRow227TriangleData1831.coefficient165_202,
  OriginalRow227TriangleData1831.coefficient165_203,
  OriginalRow227TriangleData1831.coefficient165_204,
  OriginalRow227TriangleData1831.coefficient165_205,
  OriginalRow227TriangleData1831.coefficient165_206,
  OriginalRow227TriangleData1831.coefficient165_207,
  OriginalRow227TriangleData1831.coefficient165_208,
  OriginalRow227TriangleData1831.coefficient165_209,
  OriginalRow227TriangleData1831.coefficient165_210,
  OriginalRow227TriangleData1831.coefficient165_211,
  OriginalRow227TriangleData1831.coefficient165_212,
  OriginalRow227TriangleData1831.coefficient165_213,
  OriginalRow227TriangleData1831.coefficient165_214,
  OriginalRow227TriangleData1831.coefficient165_215,
  OriginalRow227TriangleData1831.coefficient165_216,
  OriginalRow227TriangleData1831.coefficient165_217,
  OriginalRow227TriangleData1831.coefficient165_218,
  OriginalRow227TriangleData1831.coefficient165_219,
  OriginalRow227TriangleData1831.coefficient165_220,
  OriginalRow227TriangleData1831.coefficient165_221,
  OriginalRow227TriangleData1831.coefficient165_222,
  OriginalRow227TriangleData1831.coefficient165_223,
  OriginalRow227TriangleData1831.coefficient165_224,
  OriginalRow227TriangleData1831.coefficient165_225,
  OriginalRow227TriangleData1831.coefficient165_226,
  OriginalRow227TriangleData1831.coefficient165_227
]

theorem values1831_size : values1831.size = 32 := rfl

def block1831 : ℕ → Option IntervalDyadic := segment 196 values1831

theorem block1831_domain : ExactDomain block1831 196 228 := by
  simpa only [values1831_size] using segment_domain 196 values1831

theorem block1831_get (i : Fin 32) :
    block1831 (196 + i.val) = some (values1831[i.val]'(by rw [values1831_size]; exact i.isLt)) := by
  exact segment_get 196 values1831 ⟨i.val, by rw [values1831_size]; exact i.isLt⟩

def values1832 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1832.coefficient165_228,
  OriginalRow227TriangleData1832.coefficient165_229,
  OriginalRow227TriangleData1832.coefficient165_230,
  OriginalRow227TriangleData1832.coefficient165_231,
  OriginalRow227TriangleData1832.coefficient165_232,
  OriginalRow227TriangleData1832.coefficient165_233,
  OriginalRow227TriangleData1832.coefficient165_234,
  OriginalRow227TriangleData1832.coefficient165_235,
  OriginalRow227TriangleData1832.coefficient165_236,
  OriginalRow227TriangleData1832.coefficient165_237,
  OriginalRow227TriangleData1832.coefficient165_238,
  OriginalRow227TriangleData1832.coefficient165_239,
  OriginalRow227TriangleData1832.coefficient165_240,
  OriginalRow227TriangleData1832.coefficient165_241,
  OriginalRow227TriangleData1832.coefficient165_242,
  OriginalRow227TriangleData1832.coefficient165_243,
  OriginalRow227TriangleData1832.coefficient165_244,
  OriginalRow227TriangleData1832.coefficient165_245,
  OriginalRow227TriangleData1832.coefficient165_246,
  OriginalRow227TriangleData1832.coefficient165_247,
  OriginalRow227TriangleData1832.coefficient165_248,
  OriginalRow227TriangleData1832.coefficient165_249,
  OriginalRow227TriangleData1832.coefficient165_250,
  OriginalRow227TriangleData1832.coefficient165_251,
  OriginalRow227TriangleData1832.coefficient165_252,
  OriginalRow227TriangleData1832.coefficient165_253,
  OriginalRow227TriangleData1832.coefficient165_254,
  OriginalRow227TriangleData1832.coefficient165_255,
  OriginalRow227TriangleData1832.coefficient165_256,
  OriginalRow227TriangleData1832.coefficient165_257,
  OriginalRow227TriangleData1832.coefficient165_258,
  OriginalRow227TriangleData1832.coefficient165_259
]

theorem values1832_size : values1832.size = 32 := rfl

def block1832 : ℕ → Option IntervalDyadic := segment 228 values1832

theorem block1832_domain : ExactDomain block1832 228 260 := by
  simpa only [values1832_size] using segment_domain 228 values1832

theorem block1832_get (i : Fin 32) :
    block1832 (228 + i.val) = some (values1832[i.val]'(by rw [values1832_size]; exact i.isLt)) := by
  exact segment_get 228 values1832 ⟨i.val, by rw [values1832_size]; exact i.isLt⟩

def values1833 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1833.coefficient165_260,
  OriginalRow227TriangleData1833.coefficient165_261,
  OriginalRow227TriangleData1833.coefficient165_262,
  OriginalRow227TriangleData1833.coefficient165_263,
  OriginalRow227TriangleData1833.coefficient165_264,
  OriginalRow227TriangleData1833.coefficient165_265,
  OriginalRow227TriangleData1833.coefficient165_266,
  OriginalRow227TriangleData1833.coefficient165_267,
  OriginalRow227TriangleData1833.coefficient165_268,
  OriginalRow227TriangleData1833.coefficient165_269,
  OriginalRow227TriangleData1833.coefficient165_270,
  OriginalRow227TriangleData1833.coefficient165_271,
  OriginalRow227TriangleData1833.coefficient165_272,
  OriginalRow227TriangleData1833.coefficient165_273,
  OriginalRow227TriangleData1833.coefficient165_274,
  OriginalRow227TriangleData1833.coefficient165_275,
  OriginalRow227TriangleData1833.coefficient165_276,
  OriginalRow227TriangleData1833.coefficient165_277,
  OriginalRow227TriangleData1833.coefficient165_278,
  OriginalRow227TriangleData1833.coefficient165_279,
  OriginalRow227TriangleData1833.coefficient165_280,
  OriginalRow227TriangleData1833.coefficient165_281,
  OriginalRow227TriangleData1833.coefficient165_282,
  OriginalRow227TriangleData1833.coefficient165_283,
  OriginalRow227TriangleData1833.coefficient165_284,
  OriginalRow227TriangleData1833.coefficient165_285,
  OriginalRow227TriangleData1833.coefficient165_286,
  OriginalRow227TriangleData1833.coefficient165_287,
  OriginalRow227TriangleData1833.coefficient165_288,
  OriginalRow227TriangleData1833.coefficient165_289,
  OriginalRow227TriangleData1833.coefficient165_290,
  OriginalRow227TriangleData1833.coefficient165_291
]

theorem values1833_size : values1833.size = 32 := rfl

def block1833 : ℕ → Option IntervalDyadic := segment 260 values1833

theorem block1833_domain : ExactDomain block1833 260 292 := by
  simpa only [values1833_size] using segment_domain 260 values1833

theorem block1833_get (i : Fin 32) :
    block1833 (260 + i.val) = some (values1833[i.val]'(by rw [values1833_size]; exact i.isLt)) := by
  exact segment_get 260 values1833 ⟨i.val, by rw [values1833_size]; exact i.isLt⟩

def values1834 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1834.coefficient165_292,
  OriginalRow227TriangleData1834.coefficient165_293,
  OriginalRow227TriangleData1834.coefficient165_294,
  OriginalRow227TriangleData1834.coefficient165_295,
  OriginalRow227TriangleData1834.coefficient165_296,
  OriginalRow227TriangleData1834.coefficient165_297,
  OriginalRow227TriangleData1834.coefficient165_298,
  OriginalRow227TriangleData1834.coefficient165_299,
  OriginalRow227TriangleData1834.coefficient165_300,
  OriginalRow227TriangleData1834.coefficient165_301,
  OriginalRow227TriangleData1834.coefficient165_302,
  OriginalRow227TriangleData1834.coefficient165_303,
  OriginalRow227TriangleData1834.coefficient165_304,
  OriginalRow227TriangleData1834.coefficient165_305,
  OriginalRow227TriangleData1834.coefficient165_306,
  OriginalRow227TriangleData1834.coefficient165_307,
  OriginalRow227TriangleData1834.coefficient165_308,
  OriginalRow227TriangleData1834.coefficient165_309,
  OriginalRow227TriangleData1834.coefficient165_310,
  OriginalRow227TriangleData1834.coefficient165_311,
  OriginalRow227TriangleData1834.coefficient165_312,
  OriginalRow227TriangleData1834.coefficient165_313,
  OriginalRow227TriangleData1834.coefficient165_314,
  OriginalRow227TriangleData1834.coefficient165_315,
  OriginalRow227TriangleData1834.coefficient165_316,
  OriginalRow227TriangleData1834.coefficient165_317,
  OriginalRow227TriangleData1834.coefficient165_318,
  OriginalRow227TriangleData1834.coefficient165_319,
  OriginalRow227TriangleData1834.coefficient165_320,
  OriginalRow227TriangleData1834.coefficient165_321,
  OriginalRow227TriangleData1834.coefficient165_322,
  OriginalRow227TriangleData1834.coefficient165_323
]

theorem values1834_size : values1834.size = 32 := rfl

def block1834 : ℕ → Option IntervalDyadic := segment 292 values1834

theorem block1834_domain : ExactDomain block1834 292 324 := by
  simpa only [values1834_size] using segment_domain 292 values1834

theorem block1834_get (i : Fin 32) :
    block1834 (292 + i.val) = some (values1834[i.val]'(by rw [values1834_size]; exact i.isLt)) := by
  exact segment_get 292 values1834 ⟨i.val, by rw [values1834_size]; exact i.isLt⟩

def values1835 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1835.coefficient165_324,
  OriginalRow227TriangleData1835.coefficient165_325,
  OriginalRow227TriangleData1835.coefficient165_326,
  OriginalRow227TriangleData1835.coefficient165_327,
  OriginalRow227TriangleData1835.coefficient165_328,
  OriginalRow227TriangleData1835.coefficient165_329,
  OriginalRow227TriangleData1835.coefficient165_330,
  OriginalRow227TriangleData1835.coefficient165_331,
  OriginalRow227TriangleData1835.coefficient165_332,
  OriginalRow227TriangleData1835.coefficient165_333,
  OriginalRow227TriangleData1835.coefficient165_334,
  OriginalRow227TriangleData1835.coefficient165_335,
  OriginalRow227TriangleData1835.coefficient165_336
]

theorem values1835_size : values1835.size = 13 := rfl

def block1835 : ℕ → Option IntervalDyadic := segment 324 values1835

theorem block1835_domain : ExactDomain block1835 324 337 := by
  simpa only [values1835_size] using segment_domain 324 values1835

theorem block1835_get (i : Fin 13) :
    block1835 (324 + i.val) = some (values1835[i.val]'(by rw [values1835_size]; exact i.isLt)) := by
  exact segment_get 324 values1835 ⟨i.val, by rw [values1835_size]; exact i.isLt⟩

def node0196_0260 : ℕ → Option IntervalDyadic := split 228 block1831 block1832

theorem node0196_0260_domain : ExactDomain node0196_0260 196 260 := by
  exact split_domain (by decide) (by decide) block1831_domain block1832_domain

def node0164_0260 : ℕ → Option IntervalDyadic := split 196 block1830 node0196_0260

theorem node0164_0260_domain : ExactDomain node0164_0260 164 260 := by
  exact split_domain (by decide) (by decide) block1830_domain node0196_0260_domain

def node0292_0337 : ℕ → Option IntervalDyadic := split 324 block1834 block1835

theorem node0292_0337_domain : ExactDomain node0292_0337 292 337 := by
  exact split_domain (by decide) (by decide) block1834_domain block1835_domain

def node0260_0337 : ℕ → Option IntervalDyadic := split 292 block1833 node0292_0337

theorem node0260_0337_domain : ExactDomain node0260_0337 260 337 := by
  exact split_domain (by decide) (by decide) block1833_domain node0292_0337_domain

def node0164_0337 : ℕ → Option IntervalDyadic := split 260 node0164_0260 node0260_0337

theorem node0164_0337_domain : ExactDomain node0164_0337 164 337 := by
  exact split_domain (by decide) (by decide) node0164_0260_domain node0260_0337_domain

def lookup : ℕ → Option IntervalDyadic := node0164_0337

theorem lookup_domain : ExactDomain lookup 164 337 :=
  node0164_0337_domain

theorem block1830_lookup (i : Fin 32) :
    lookup (164 + i.val) = some (values1830[i.val]'(by rw [values1830_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0164_0337 (164 + i.val) = _
  rw [node0164_0337, split_left 260 node0164_0260 node0260_0337 (by omega)]
  rw [node0164_0260, split_left 196 block1830 node0196_0260 (by omega)]
  exact block1830_get i

theorem block1831_lookup (i : Fin 32) :
    lookup (196 + i.val) = some (values1831[i.val]'(by rw [values1831_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0164_0337 (196 + i.val) = _
  rw [node0164_0337, split_left 260 node0164_0260 node0260_0337 (by omega)]
  rw [node0164_0260, split_right 196 block1830 node0196_0260 (by omega)]
  rw [node0196_0260, split_left 228 block1831 block1832 (by omega)]
  exact block1831_get i

theorem block1832_lookup (i : Fin 32) :
    lookup (228 + i.val) = some (values1832[i.val]'(by rw [values1832_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0164_0337 (228 + i.val) = _
  rw [node0164_0337, split_left 260 node0164_0260 node0260_0337 (by omega)]
  rw [node0164_0260, split_right 196 block1830 node0196_0260 (by omega)]
  rw [node0196_0260, split_right 228 block1831 block1832 (by omega)]
  exact block1832_get i

theorem block1833_lookup (i : Fin 32) :
    lookup (260 + i.val) = some (values1833[i.val]'(by rw [values1833_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0164_0337 (260 + i.val) = _
  rw [node0164_0337, split_right 260 node0164_0260 node0260_0337 (by omega)]
  rw [node0260_0337, split_left 292 block1833 node0292_0337 (by omega)]
  exact block1833_get i

theorem block1834_lookup (i : Fin 32) :
    lookup (292 + i.val) = some (values1834[i.val]'(by rw [values1834_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0164_0337 (292 + i.val) = _
  rw [node0164_0337, split_right 260 node0164_0260 node0260_0337 (by omega)]
  rw [node0260_0337, split_right 292 block1833 node0292_0337 (by omega)]
  rw [node0292_0337, split_left 324 block1834 block1835 (by omega)]
  exact block1834_get i

theorem block1835_lookup (i : Fin 13) :
    lookup (324 + i.val) = some (values1835[i.val]'(by rw [values1835_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0164_0337 (324 + i.val) = _
  rw [node0164_0337, split_right 260 node0164_0260 node0260_0337 (by omega)]
  rw [node0260_0337, split_right 292 block1833 node0292_0337 (by omega)]
  rw [node0292_0337, split_right 324 block1834 block1835 (by omega)]
  exact block1835_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1830_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1830_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1831_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1831_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1832_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1832_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1833_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1833_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1834_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1834_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1835_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1835_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1830_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1831_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1832_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1833_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1834_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow165.block1835_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow165
