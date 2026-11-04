import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1812
import Grothe.UpperChaos.OriginalRow227TriangleData1813
import Grothe.UpperChaos.OriginalRow227TriangleData1814
import Grothe.UpperChaos.OriginalRow227TriangleData1815
import Grothe.UpperChaos.OriginalRow227TriangleData1816
import Grothe.UpperChaos.OriginalRow227TriangleData1817

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow162

open ConditionalTableLookup

def values1812 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1812.coefficient162_161,
  OriginalRow227TriangleData1812.coefficient162_162,
  OriginalRow227TriangleData1812.coefficient162_163,
  OriginalRow227TriangleData1812.coefficient162_164,
  OriginalRow227TriangleData1812.coefficient162_165,
  OriginalRow227TriangleData1812.coefficient162_166,
  OriginalRow227TriangleData1812.coefficient162_167,
  OriginalRow227TriangleData1812.coefficient162_168,
  OriginalRow227TriangleData1812.coefficient162_169,
  OriginalRow227TriangleData1812.coefficient162_170,
  OriginalRow227TriangleData1812.coefficient162_171,
  OriginalRow227TriangleData1812.coefficient162_172,
  OriginalRow227TriangleData1812.coefficient162_173,
  OriginalRow227TriangleData1812.coefficient162_174,
  OriginalRow227TriangleData1812.coefficient162_175,
  OriginalRow227TriangleData1812.coefficient162_176,
  OriginalRow227TriangleData1812.coefficient162_177,
  OriginalRow227TriangleData1812.coefficient162_178,
  OriginalRow227TriangleData1812.coefficient162_179,
  OriginalRow227TriangleData1812.coefficient162_180,
  OriginalRow227TriangleData1812.coefficient162_181,
  OriginalRow227TriangleData1812.coefficient162_182,
  OriginalRow227TriangleData1812.coefficient162_183,
  OriginalRow227TriangleData1812.coefficient162_184,
  OriginalRow227TriangleData1812.coefficient162_185,
  OriginalRow227TriangleData1812.coefficient162_186,
  OriginalRow227TriangleData1812.coefficient162_187,
  OriginalRow227TriangleData1812.coefficient162_188,
  OriginalRow227TriangleData1812.coefficient162_189,
  OriginalRow227TriangleData1812.coefficient162_190,
  OriginalRow227TriangleData1812.coefficient162_191,
  OriginalRow227TriangleData1812.coefficient162_192
]

theorem values1812_size : values1812.size = 32 := rfl

def block1812 : ℕ → Option IntervalDyadic := segment 161 values1812

theorem block1812_domain : ExactDomain block1812 161 193 := by
  simpa only [values1812_size] using segment_domain 161 values1812

theorem block1812_get (i : Fin 32) :
    block1812 (161 + i.val) = some (values1812[i.val]'(by rw [values1812_size]; exact i.isLt)) := by
  exact segment_get 161 values1812 ⟨i.val, by rw [values1812_size]; exact i.isLt⟩

def values1813 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1813.coefficient162_193,
  OriginalRow227TriangleData1813.coefficient162_194,
  OriginalRow227TriangleData1813.coefficient162_195,
  OriginalRow227TriangleData1813.coefficient162_196,
  OriginalRow227TriangleData1813.coefficient162_197,
  OriginalRow227TriangleData1813.coefficient162_198,
  OriginalRow227TriangleData1813.coefficient162_199,
  OriginalRow227TriangleData1813.coefficient162_200,
  OriginalRow227TriangleData1813.coefficient162_201,
  OriginalRow227TriangleData1813.coefficient162_202,
  OriginalRow227TriangleData1813.coefficient162_203,
  OriginalRow227TriangleData1813.coefficient162_204,
  OriginalRow227TriangleData1813.coefficient162_205,
  OriginalRow227TriangleData1813.coefficient162_206,
  OriginalRow227TriangleData1813.coefficient162_207,
  OriginalRow227TriangleData1813.coefficient162_208,
  OriginalRow227TriangleData1813.coefficient162_209,
  OriginalRow227TriangleData1813.coefficient162_210,
  OriginalRow227TriangleData1813.coefficient162_211,
  OriginalRow227TriangleData1813.coefficient162_212,
  OriginalRow227TriangleData1813.coefficient162_213,
  OriginalRow227TriangleData1813.coefficient162_214,
  OriginalRow227TriangleData1813.coefficient162_215,
  OriginalRow227TriangleData1813.coefficient162_216,
  OriginalRow227TriangleData1813.coefficient162_217,
  OriginalRow227TriangleData1813.coefficient162_218,
  OriginalRow227TriangleData1813.coefficient162_219,
  OriginalRow227TriangleData1813.coefficient162_220,
  OriginalRow227TriangleData1813.coefficient162_221,
  OriginalRow227TriangleData1813.coefficient162_222,
  OriginalRow227TriangleData1813.coefficient162_223,
  OriginalRow227TriangleData1813.coefficient162_224
]

theorem values1813_size : values1813.size = 32 := rfl

def block1813 : ℕ → Option IntervalDyadic := segment 193 values1813

theorem block1813_domain : ExactDomain block1813 193 225 := by
  simpa only [values1813_size] using segment_domain 193 values1813

theorem block1813_get (i : Fin 32) :
    block1813 (193 + i.val) = some (values1813[i.val]'(by rw [values1813_size]; exact i.isLt)) := by
  exact segment_get 193 values1813 ⟨i.val, by rw [values1813_size]; exact i.isLt⟩

def values1814 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1814.coefficient162_225,
  OriginalRow227TriangleData1814.coefficient162_226,
  OriginalRow227TriangleData1814.coefficient162_227,
  OriginalRow227TriangleData1814.coefficient162_228,
  OriginalRow227TriangleData1814.coefficient162_229,
  OriginalRow227TriangleData1814.coefficient162_230,
  OriginalRow227TriangleData1814.coefficient162_231,
  OriginalRow227TriangleData1814.coefficient162_232,
  OriginalRow227TriangleData1814.coefficient162_233,
  OriginalRow227TriangleData1814.coefficient162_234,
  OriginalRow227TriangleData1814.coefficient162_235,
  OriginalRow227TriangleData1814.coefficient162_236,
  OriginalRow227TriangleData1814.coefficient162_237,
  OriginalRow227TriangleData1814.coefficient162_238,
  OriginalRow227TriangleData1814.coefficient162_239,
  OriginalRow227TriangleData1814.coefficient162_240,
  OriginalRow227TriangleData1814.coefficient162_241,
  OriginalRow227TriangleData1814.coefficient162_242,
  OriginalRow227TriangleData1814.coefficient162_243,
  OriginalRow227TriangleData1814.coefficient162_244,
  OriginalRow227TriangleData1814.coefficient162_245,
  OriginalRow227TriangleData1814.coefficient162_246,
  OriginalRow227TriangleData1814.coefficient162_247,
  OriginalRow227TriangleData1814.coefficient162_248,
  OriginalRow227TriangleData1814.coefficient162_249,
  OriginalRow227TriangleData1814.coefficient162_250,
  OriginalRow227TriangleData1814.coefficient162_251,
  OriginalRow227TriangleData1814.coefficient162_252,
  OriginalRow227TriangleData1814.coefficient162_253,
  OriginalRow227TriangleData1814.coefficient162_254,
  OriginalRow227TriangleData1814.coefficient162_255,
  OriginalRow227TriangleData1814.coefficient162_256
]

theorem values1814_size : values1814.size = 32 := rfl

def block1814 : ℕ → Option IntervalDyadic := segment 225 values1814

theorem block1814_domain : ExactDomain block1814 225 257 := by
  simpa only [values1814_size] using segment_domain 225 values1814

theorem block1814_get (i : Fin 32) :
    block1814 (225 + i.val) = some (values1814[i.val]'(by rw [values1814_size]; exact i.isLt)) := by
  exact segment_get 225 values1814 ⟨i.val, by rw [values1814_size]; exact i.isLt⟩

def values1815 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1815.coefficient162_257,
  OriginalRow227TriangleData1815.coefficient162_258,
  OriginalRow227TriangleData1815.coefficient162_259,
  OriginalRow227TriangleData1815.coefficient162_260,
  OriginalRow227TriangleData1815.coefficient162_261,
  OriginalRow227TriangleData1815.coefficient162_262,
  OriginalRow227TriangleData1815.coefficient162_263,
  OriginalRow227TriangleData1815.coefficient162_264,
  OriginalRow227TriangleData1815.coefficient162_265,
  OriginalRow227TriangleData1815.coefficient162_266,
  OriginalRow227TriangleData1815.coefficient162_267,
  OriginalRow227TriangleData1815.coefficient162_268,
  OriginalRow227TriangleData1815.coefficient162_269,
  OriginalRow227TriangleData1815.coefficient162_270,
  OriginalRow227TriangleData1815.coefficient162_271,
  OriginalRow227TriangleData1815.coefficient162_272,
  OriginalRow227TriangleData1815.coefficient162_273,
  OriginalRow227TriangleData1815.coefficient162_274,
  OriginalRow227TriangleData1815.coefficient162_275,
  OriginalRow227TriangleData1815.coefficient162_276,
  OriginalRow227TriangleData1815.coefficient162_277,
  OriginalRow227TriangleData1815.coefficient162_278,
  OriginalRow227TriangleData1815.coefficient162_279,
  OriginalRow227TriangleData1815.coefficient162_280,
  OriginalRow227TriangleData1815.coefficient162_281,
  OriginalRow227TriangleData1815.coefficient162_282,
  OriginalRow227TriangleData1815.coefficient162_283,
  OriginalRow227TriangleData1815.coefficient162_284,
  OriginalRow227TriangleData1815.coefficient162_285,
  OriginalRow227TriangleData1815.coefficient162_286,
  OriginalRow227TriangleData1815.coefficient162_287,
  OriginalRow227TriangleData1815.coefficient162_288
]

theorem values1815_size : values1815.size = 32 := rfl

def block1815 : ℕ → Option IntervalDyadic := segment 257 values1815

theorem block1815_domain : ExactDomain block1815 257 289 := by
  simpa only [values1815_size] using segment_domain 257 values1815

theorem block1815_get (i : Fin 32) :
    block1815 (257 + i.val) = some (values1815[i.val]'(by rw [values1815_size]; exact i.isLt)) := by
  exact segment_get 257 values1815 ⟨i.val, by rw [values1815_size]; exact i.isLt⟩

def values1816 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1816.coefficient162_289,
  OriginalRow227TriangleData1816.coefficient162_290,
  OriginalRow227TriangleData1816.coefficient162_291,
  OriginalRow227TriangleData1816.coefficient162_292,
  OriginalRow227TriangleData1816.coefficient162_293,
  OriginalRow227TriangleData1816.coefficient162_294,
  OriginalRow227TriangleData1816.coefficient162_295,
  OriginalRow227TriangleData1816.coefficient162_296,
  OriginalRow227TriangleData1816.coefficient162_297,
  OriginalRow227TriangleData1816.coefficient162_298,
  OriginalRow227TriangleData1816.coefficient162_299,
  OriginalRow227TriangleData1816.coefficient162_300,
  OriginalRow227TriangleData1816.coefficient162_301,
  OriginalRow227TriangleData1816.coefficient162_302,
  OriginalRow227TriangleData1816.coefficient162_303,
  OriginalRow227TriangleData1816.coefficient162_304,
  OriginalRow227TriangleData1816.coefficient162_305,
  OriginalRow227TriangleData1816.coefficient162_306,
  OriginalRow227TriangleData1816.coefficient162_307,
  OriginalRow227TriangleData1816.coefficient162_308,
  OriginalRow227TriangleData1816.coefficient162_309,
  OriginalRow227TriangleData1816.coefficient162_310,
  OriginalRow227TriangleData1816.coefficient162_311,
  OriginalRow227TriangleData1816.coefficient162_312,
  OriginalRow227TriangleData1816.coefficient162_313,
  OriginalRow227TriangleData1816.coefficient162_314,
  OriginalRow227TriangleData1816.coefficient162_315,
  OriginalRow227TriangleData1816.coefficient162_316,
  OriginalRow227TriangleData1816.coefficient162_317,
  OriginalRow227TriangleData1816.coefficient162_318,
  OriginalRow227TriangleData1816.coefficient162_319,
  OriginalRow227TriangleData1816.coefficient162_320
]

theorem values1816_size : values1816.size = 32 := rfl

def block1816 : ℕ → Option IntervalDyadic := segment 289 values1816

theorem block1816_domain : ExactDomain block1816 289 321 := by
  simpa only [values1816_size] using segment_domain 289 values1816

theorem block1816_get (i : Fin 32) :
    block1816 (289 + i.val) = some (values1816[i.val]'(by rw [values1816_size]; exact i.isLt)) := by
  exact segment_get 289 values1816 ⟨i.val, by rw [values1816_size]; exact i.isLt⟩

def values1817 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1817.coefficient162_321,
  OriginalRow227TriangleData1817.coefficient162_322,
  OriginalRow227TriangleData1817.coefficient162_323,
  OriginalRow227TriangleData1817.coefficient162_324,
  OriginalRow227TriangleData1817.coefficient162_325,
  OriginalRow227TriangleData1817.coefficient162_326,
  OriginalRow227TriangleData1817.coefficient162_327,
  OriginalRow227TriangleData1817.coefficient162_328,
  OriginalRow227TriangleData1817.coefficient162_329,
  OriginalRow227TriangleData1817.coefficient162_330,
  OriginalRow227TriangleData1817.coefficient162_331,
  OriginalRow227TriangleData1817.coefficient162_332,
  OriginalRow227TriangleData1817.coefficient162_333,
  OriginalRow227TriangleData1817.coefficient162_334,
  OriginalRow227TriangleData1817.coefficient162_335,
  OriginalRow227TriangleData1817.coefficient162_336,
  OriginalRow227TriangleData1817.coefficient162_337,
  OriginalRow227TriangleData1817.coefficient162_338,
  OriginalRow227TriangleData1817.coefficient162_339
]

theorem values1817_size : values1817.size = 19 := rfl

def block1817 : ℕ → Option IntervalDyadic := segment 321 values1817

theorem block1817_domain : ExactDomain block1817 321 340 := by
  simpa only [values1817_size] using segment_domain 321 values1817

theorem block1817_get (i : Fin 19) :
    block1817 (321 + i.val) = some (values1817[i.val]'(by rw [values1817_size]; exact i.isLt)) := by
  exact segment_get 321 values1817 ⟨i.val, by rw [values1817_size]; exact i.isLt⟩

def node0193_0257 : ℕ → Option IntervalDyadic := split 225 block1813 block1814

theorem node0193_0257_domain : ExactDomain node0193_0257 193 257 := by
  exact split_domain (by decide) (by decide) block1813_domain block1814_domain

def node0161_0257 : ℕ → Option IntervalDyadic := split 193 block1812 node0193_0257

theorem node0161_0257_domain : ExactDomain node0161_0257 161 257 := by
  exact split_domain (by decide) (by decide) block1812_domain node0193_0257_domain

def node0289_0340 : ℕ → Option IntervalDyadic := split 321 block1816 block1817

theorem node0289_0340_domain : ExactDomain node0289_0340 289 340 := by
  exact split_domain (by decide) (by decide) block1816_domain block1817_domain

def node0257_0340 : ℕ → Option IntervalDyadic := split 289 block1815 node0289_0340

theorem node0257_0340_domain : ExactDomain node0257_0340 257 340 := by
  exact split_domain (by decide) (by decide) block1815_domain node0289_0340_domain

def node0161_0340 : ℕ → Option IntervalDyadic := split 257 node0161_0257 node0257_0340

theorem node0161_0340_domain : ExactDomain node0161_0340 161 340 := by
  exact split_domain (by decide) (by decide) node0161_0257_domain node0257_0340_domain

def lookup : ℕ → Option IntervalDyadic := node0161_0340

theorem lookup_domain : ExactDomain lookup 161 340 :=
  node0161_0340_domain

theorem block1812_lookup (i : Fin 32) :
    lookup (161 + i.val) = some (values1812[i.val]'(by rw [values1812_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0161_0340 (161 + i.val) = _
  rw [node0161_0340, split_left 257 node0161_0257 node0257_0340 (by omega)]
  rw [node0161_0257, split_left 193 block1812 node0193_0257 (by omega)]
  exact block1812_get i

theorem block1813_lookup (i : Fin 32) :
    lookup (193 + i.val) = some (values1813[i.val]'(by rw [values1813_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0161_0340 (193 + i.val) = _
  rw [node0161_0340, split_left 257 node0161_0257 node0257_0340 (by omega)]
  rw [node0161_0257, split_right 193 block1812 node0193_0257 (by omega)]
  rw [node0193_0257, split_left 225 block1813 block1814 (by omega)]
  exact block1813_get i

theorem block1814_lookup (i : Fin 32) :
    lookup (225 + i.val) = some (values1814[i.val]'(by rw [values1814_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0161_0340 (225 + i.val) = _
  rw [node0161_0340, split_left 257 node0161_0257 node0257_0340 (by omega)]
  rw [node0161_0257, split_right 193 block1812 node0193_0257 (by omega)]
  rw [node0193_0257, split_right 225 block1813 block1814 (by omega)]
  exact block1814_get i

theorem block1815_lookup (i : Fin 32) :
    lookup (257 + i.val) = some (values1815[i.val]'(by rw [values1815_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0161_0340 (257 + i.val) = _
  rw [node0161_0340, split_right 257 node0161_0257 node0257_0340 (by omega)]
  rw [node0257_0340, split_left 289 block1815 node0289_0340 (by omega)]
  exact block1815_get i

theorem block1816_lookup (i : Fin 32) :
    lookup (289 + i.val) = some (values1816[i.val]'(by rw [values1816_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0161_0340 (289 + i.val) = _
  rw [node0161_0340, split_right 257 node0161_0257 node0257_0340 (by omega)]
  rw [node0257_0340, split_right 289 block1815 node0289_0340 (by omega)]
  rw [node0289_0340, split_left 321 block1816 block1817 (by omega)]
  exact block1816_get i

theorem block1817_lookup (i : Fin 19) :
    lookup (321 + i.val) = some (values1817[i.val]'(by rw [values1817_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0161_0340 (321 + i.val) = _
  rw [node0161_0340, split_right 257 node0161_0257 node0257_0340 (by omega)]
  rw [node0257_0340, split_right 289 block1815 node0289_0340 (by omega)]
  rw [node0289_0340, split_right 321 block1816 block1817 (by omega)]
  exact block1817_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1812_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1812_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1813_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1813_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1814_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1814_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1815_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1815_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1816_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1816_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1817_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1817_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1812_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1813_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1814_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1815_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1816_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow162.block1817_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow162
