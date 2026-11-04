import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1818
import Grothe.UpperChaos.OriginalRow227TriangleData1819
import Grothe.UpperChaos.OriginalRow227TriangleData1820
import Grothe.UpperChaos.OriginalRow227TriangleData1821
import Grothe.UpperChaos.OriginalRow227TriangleData1822
import Grothe.UpperChaos.OriginalRow227TriangleData1823

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow163

open ConditionalTableLookup

def values1818 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1818.coefficient163_162,
  OriginalRow227TriangleData1818.coefficient163_163,
  OriginalRow227TriangleData1818.coefficient163_164,
  OriginalRow227TriangleData1818.coefficient163_165,
  OriginalRow227TriangleData1818.coefficient163_166,
  OriginalRow227TriangleData1818.coefficient163_167,
  OriginalRow227TriangleData1818.coefficient163_168,
  OriginalRow227TriangleData1818.coefficient163_169,
  OriginalRow227TriangleData1818.coefficient163_170,
  OriginalRow227TriangleData1818.coefficient163_171,
  OriginalRow227TriangleData1818.coefficient163_172,
  OriginalRow227TriangleData1818.coefficient163_173,
  OriginalRow227TriangleData1818.coefficient163_174,
  OriginalRow227TriangleData1818.coefficient163_175,
  OriginalRow227TriangleData1818.coefficient163_176,
  OriginalRow227TriangleData1818.coefficient163_177,
  OriginalRow227TriangleData1818.coefficient163_178,
  OriginalRow227TriangleData1818.coefficient163_179,
  OriginalRow227TriangleData1818.coefficient163_180,
  OriginalRow227TriangleData1818.coefficient163_181,
  OriginalRow227TriangleData1818.coefficient163_182,
  OriginalRow227TriangleData1818.coefficient163_183,
  OriginalRow227TriangleData1818.coefficient163_184,
  OriginalRow227TriangleData1818.coefficient163_185,
  OriginalRow227TriangleData1818.coefficient163_186,
  OriginalRow227TriangleData1818.coefficient163_187,
  OriginalRow227TriangleData1818.coefficient163_188,
  OriginalRow227TriangleData1818.coefficient163_189,
  OriginalRow227TriangleData1818.coefficient163_190,
  OriginalRow227TriangleData1818.coefficient163_191,
  OriginalRow227TriangleData1818.coefficient163_192,
  OriginalRow227TriangleData1818.coefficient163_193
]

theorem values1818_size : values1818.size = 32 := rfl

def block1818 : ℕ → Option IntervalDyadic := segment 162 values1818

theorem block1818_domain : ExactDomain block1818 162 194 := by
  simpa only [values1818_size] using segment_domain 162 values1818

theorem block1818_get (i : Fin 32) :
    block1818 (162 + i.val) = some (values1818[i.val]'(by rw [values1818_size]; exact i.isLt)) := by
  exact segment_get 162 values1818 ⟨i.val, by rw [values1818_size]; exact i.isLt⟩

def values1819 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1819.coefficient163_194,
  OriginalRow227TriangleData1819.coefficient163_195,
  OriginalRow227TriangleData1819.coefficient163_196,
  OriginalRow227TriangleData1819.coefficient163_197,
  OriginalRow227TriangleData1819.coefficient163_198,
  OriginalRow227TriangleData1819.coefficient163_199,
  OriginalRow227TriangleData1819.coefficient163_200,
  OriginalRow227TriangleData1819.coefficient163_201,
  OriginalRow227TriangleData1819.coefficient163_202,
  OriginalRow227TriangleData1819.coefficient163_203,
  OriginalRow227TriangleData1819.coefficient163_204,
  OriginalRow227TriangleData1819.coefficient163_205,
  OriginalRow227TriangleData1819.coefficient163_206,
  OriginalRow227TriangleData1819.coefficient163_207,
  OriginalRow227TriangleData1819.coefficient163_208,
  OriginalRow227TriangleData1819.coefficient163_209,
  OriginalRow227TriangleData1819.coefficient163_210,
  OriginalRow227TriangleData1819.coefficient163_211,
  OriginalRow227TriangleData1819.coefficient163_212,
  OriginalRow227TriangleData1819.coefficient163_213,
  OriginalRow227TriangleData1819.coefficient163_214,
  OriginalRow227TriangleData1819.coefficient163_215,
  OriginalRow227TriangleData1819.coefficient163_216,
  OriginalRow227TriangleData1819.coefficient163_217,
  OriginalRow227TriangleData1819.coefficient163_218,
  OriginalRow227TriangleData1819.coefficient163_219,
  OriginalRow227TriangleData1819.coefficient163_220,
  OriginalRow227TriangleData1819.coefficient163_221,
  OriginalRow227TriangleData1819.coefficient163_222,
  OriginalRow227TriangleData1819.coefficient163_223,
  OriginalRow227TriangleData1819.coefficient163_224,
  OriginalRow227TriangleData1819.coefficient163_225
]

theorem values1819_size : values1819.size = 32 := rfl

def block1819 : ℕ → Option IntervalDyadic := segment 194 values1819

theorem block1819_domain : ExactDomain block1819 194 226 := by
  simpa only [values1819_size] using segment_domain 194 values1819

theorem block1819_get (i : Fin 32) :
    block1819 (194 + i.val) = some (values1819[i.val]'(by rw [values1819_size]; exact i.isLt)) := by
  exact segment_get 194 values1819 ⟨i.val, by rw [values1819_size]; exact i.isLt⟩

def values1820 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1820.coefficient163_226,
  OriginalRow227TriangleData1820.coefficient163_227,
  OriginalRow227TriangleData1820.coefficient163_228,
  OriginalRow227TriangleData1820.coefficient163_229,
  OriginalRow227TriangleData1820.coefficient163_230,
  OriginalRow227TriangleData1820.coefficient163_231,
  OriginalRow227TriangleData1820.coefficient163_232,
  OriginalRow227TriangleData1820.coefficient163_233,
  OriginalRow227TriangleData1820.coefficient163_234,
  OriginalRow227TriangleData1820.coefficient163_235,
  OriginalRow227TriangleData1820.coefficient163_236,
  OriginalRow227TriangleData1820.coefficient163_237,
  OriginalRow227TriangleData1820.coefficient163_238,
  OriginalRow227TriangleData1820.coefficient163_239,
  OriginalRow227TriangleData1820.coefficient163_240,
  OriginalRow227TriangleData1820.coefficient163_241,
  OriginalRow227TriangleData1820.coefficient163_242,
  OriginalRow227TriangleData1820.coefficient163_243,
  OriginalRow227TriangleData1820.coefficient163_244,
  OriginalRow227TriangleData1820.coefficient163_245,
  OriginalRow227TriangleData1820.coefficient163_246,
  OriginalRow227TriangleData1820.coefficient163_247,
  OriginalRow227TriangleData1820.coefficient163_248,
  OriginalRow227TriangleData1820.coefficient163_249,
  OriginalRow227TriangleData1820.coefficient163_250,
  OriginalRow227TriangleData1820.coefficient163_251,
  OriginalRow227TriangleData1820.coefficient163_252,
  OriginalRow227TriangleData1820.coefficient163_253,
  OriginalRow227TriangleData1820.coefficient163_254,
  OriginalRow227TriangleData1820.coefficient163_255,
  OriginalRow227TriangleData1820.coefficient163_256,
  OriginalRow227TriangleData1820.coefficient163_257
]

theorem values1820_size : values1820.size = 32 := rfl

def block1820 : ℕ → Option IntervalDyadic := segment 226 values1820

theorem block1820_domain : ExactDomain block1820 226 258 := by
  simpa only [values1820_size] using segment_domain 226 values1820

theorem block1820_get (i : Fin 32) :
    block1820 (226 + i.val) = some (values1820[i.val]'(by rw [values1820_size]; exact i.isLt)) := by
  exact segment_get 226 values1820 ⟨i.val, by rw [values1820_size]; exact i.isLt⟩

def values1821 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1821.coefficient163_258,
  OriginalRow227TriangleData1821.coefficient163_259,
  OriginalRow227TriangleData1821.coefficient163_260,
  OriginalRow227TriangleData1821.coefficient163_261,
  OriginalRow227TriangleData1821.coefficient163_262,
  OriginalRow227TriangleData1821.coefficient163_263,
  OriginalRow227TriangleData1821.coefficient163_264,
  OriginalRow227TriangleData1821.coefficient163_265,
  OriginalRow227TriangleData1821.coefficient163_266,
  OriginalRow227TriangleData1821.coefficient163_267,
  OriginalRow227TriangleData1821.coefficient163_268,
  OriginalRow227TriangleData1821.coefficient163_269,
  OriginalRow227TriangleData1821.coefficient163_270,
  OriginalRow227TriangleData1821.coefficient163_271,
  OriginalRow227TriangleData1821.coefficient163_272,
  OriginalRow227TriangleData1821.coefficient163_273,
  OriginalRow227TriangleData1821.coefficient163_274,
  OriginalRow227TriangleData1821.coefficient163_275,
  OriginalRow227TriangleData1821.coefficient163_276,
  OriginalRow227TriangleData1821.coefficient163_277,
  OriginalRow227TriangleData1821.coefficient163_278,
  OriginalRow227TriangleData1821.coefficient163_279,
  OriginalRow227TriangleData1821.coefficient163_280,
  OriginalRow227TriangleData1821.coefficient163_281,
  OriginalRow227TriangleData1821.coefficient163_282,
  OriginalRow227TriangleData1821.coefficient163_283,
  OriginalRow227TriangleData1821.coefficient163_284,
  OriginalRow227TriangleData1821.coefficient163_285,
  OriginalRow227TriangleData1821.coefficient163_286,
  OriginalRow227TriangleData1821.coefficient163_287,
  OriginalRow227TriangleData1821.coefficient163_288,
  OriginalRow227TriangleData1821.coefficient163_289
]

theorem values1821_size : values1821.size = 32 := rfl

def block1821 : ℕ → Option IntervalDyadic := segment 258 values1821

theorem block1821_domain : ExactDomain block1821 258 290 := by
  simpa only [values1821_size] using segment_domain 258 values1821

theorem block1821_get (i : Fin 32) :
    block1821 (258 + i.val) = some (values1821[i.val]'(by rw [values1821_size]; exact i.isLt)) := by
  exact segment_get 258 values1821 ⟨i.val, by rw [values1821_size]; exact i.isLt⟩

def values1822 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1822.coefficient163_290,
  OriginalRow227TriangleData1822.coefficient163_291,
  OriginalRow227TriangleData1822.coefficient163_292,
  OriginalRow227TriangleData1822.coefficient163_293,
  OriginalRow227TriangleData1822.coefficient163_294,
  OriginalRow227TriangleData1822.coefficient163_295,
  OriginalRow227TriangleData1822.coefficient163_296,
  OriginalRow227TriangleData1822.coefficient163_297,
  OriginalRow227TriangleData1822.coefficient163_298,
  OriginalRow227TriangleData1822.coefficient163_299,
  OriginalRow227TriangleData1822.coefficient163_300,
  OriginalRow227TriangleData1822.coefficient163_301,
  OriginalRow227TriangleData1822.coefficient163_302,
  OriginalRow227TriangleData1822.coefficient163_303,
  OriginalRow227TriangleData1822.coefficient163_304,
  OriginalRow227TriangleData1822.coefficient163_305,
  OriginalRow227TriangleData1822.coefficient163_306,
  OriginalRow227TriangleData1822.coefficient163_307,
  OriginalRow227TriangleData1822.coefficient163_308,
  OriginalRow227TriangleData1822.coefficient163_309,
  OriginalRow227TriangleData1822.coefficient163_310,
  OriginalRow227TriangleData1822.coefficient163_311,
  OriginalRow227TriangleData1822.coefficient163_312,
  OriginalRow227TriangleData1822.coefficient163_313,
  OriginalRow227TriangleData1822.coefficient163_314,
  OriginalRow227TriangleData1822.coefficient163_315,
  OriginalRow227TriangleData1822.coefficient163_316,
  OriginalRow227TriangleData1822.coefficient163_317,
  OriginalRow227TriangleData1822.coefficient163_318,
  OriginalRow227TriangleData1822.coefficient163_319,
  OriginalRow227TriangleData1822.coefficient163_320,
  OriginalRow227TriangleData1822.coefficient163_321
]

theorem values1822_size : values1822.size = 32 := rfl

def block1822 : ℕ → Option IntervalDyadic := segment 290 values1822

theorem block1822_domain : ExactDomain block1822 290 322 := by
  simpa only [values1822_size] using segment_domain 290 values1822

theorem block1822_get (i : Fin 32) :
    block1822 (290 + i.val) = some (values1822[i.val]'(by rw [values1822_size]; exact i.isLt)) := by
  exact segment_get 290 values1822 ⟨i.val, by rw [values1822_size]; exact i.isLt⟩

def values1823 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1823.coefficient163_322,
  OriginalRow227TriangleData1823.coefficient163_323,
  OriginalRow227TriangleData1823.coefficient163_324,
  OriginalRow227TriangleData1823.coefficient163_325,
  OriginalRow227TriangleData1823.coefficient163_326,
  OriginalRow227TriangleData1823.coefficient163_327,
  OriginalRow227TriangleData1823.coefficient163_328,
  OriginalRow227TriangleData1823.coefficient163_329,
  OriginalRow227TriangleData1823.coefficient163_330,
  OriginalRow227TriangleData1823.coefficient163_331,
  OriginalRow227TriangleData1823.coefficient163_332,
  OriginalRow227TriangleData1823.coefficient163_333,
  OriginalRow227TriangleData1823.coefficient163_334,
  OriginalRow227TriangleData1823.coefficient163_335,
  OriginalRow227TriangleData1823.coefficient163_336,
  OriginalRow227TriangleData1823.coefficient163_337,
  OriginalRow227TriangleData1823.coefficient163_338
]

theorem values1823_size : values1823.size = 17 := rfl

def block1823 : ℕ → Option IntervalDyadic := segment 322 values1823

theorem block1823_domain : ExactDomain block1823 322 339 := by
  simpa only [values1823_size] using segment_domain 322 values1823

theorem block1823_get (i : Fin 17) :
    block1823 (322 + i.val) = some (values1823[i.val]'(by rw [values1823_size]; exact i.isLt)) := by
  exact segment_get 322 values1823 ⟨i.val, by rw [values1823_size]; exact i.isLt⟩

def node0194_0258 : ℕ → Option IntervalDyadic := split 226 block1819 block1820

theorem node0194_0258_domain : ExactDomain node0194_0258 194 258 := by
  exact split_domain (by decide) (by decide) block1819_domain block1820_domain

def node0162_0258 : ℕ → Option IntervalDyadic := split 194 block1818 node0194_0258

theorem node0162_0258_domain : ExactDomain node0162_0258 162 258 := by
  exact split_domain (by decide) (by decide) block1818_domain node0194_0258_domain

def node0290_0339 : ℕ → Option IntervalDyadic := split 322 block1822 block1823

theorem node0290_0339_domain : ExactDomain node0290_0339 290 339 := by
  exact split_domain (by decide) (by decide) block1822_domain block1823_domain

def node0258_0339 : ℕ → Option IntervalDyadic := split 290 block1821 node0290_0339

theorem node0258_0339_domain : ExactDomain node0258_0339 258 339 := by
  exact split_domain (by decide) (by decide) block1821_domain node0290_0339_domain

def node0162_0339 : ℕ → Option IntervalDyadic := split 258 node0162_0258 node0258_0339

theorem node0162_0339_domain : ExactDomain node0162_0339 162 339 := by
  exact split_domain (by decide) (by decide) node0162_0258_domain node0258_0339_domain

def lookup : ℕ → Option IntervalDyadic := node0162_0339

theorem lookup_domain : ExactDomain lookup 162 339 :=
  node0162_0339_domain

theorem block1818_lookup (i : Fin 32) :
    lookup (162 + i.val) = some (values1818[i.val]'(by rw [values1818_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0162_0339 (162 + i.val) = _
  rw [node0162_0339, split_left 258 node0162_0258 node0258_0339 (by omega)]
  rw [node0162_0258, split_left 194 block1818 node0194_0258 (by omega)]
  exact block1818_get i

theorem block1819_lookup (i : Fin 32) :
    lookup (194 + i.val) = some (values1819[i.val]'(by rw [values1819_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0162_0339 (194 + i.val) = _
  rw [node0162_0339, split_left 258 node0162_0258 node0258_0339 (by omega)]
  rw [node0162_0258, split_right 194 block1818 node0194_0258 (by omega)]
  rw [node0194_0258, split_left 226 block1819 block1820 (by omega)]
  exact block1819_get i

theorem block1820_lookup (i : Fin 32) :
    lookup (226 + i.val) = some (values1820[i.val]'(by rw [values1820_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0162_0339 (226 + i.val) = _
  rw [node0162_0339, split_left 258 node0162_0258 node0258_0339 (by omega)]
  rw [node0162_0258, split_right 194 block1818 node0194_0258 (by omega)]
  rw [node0194_0258, split_right 226 block1819 block1820 (by omega)]
  exact block1820_get i

theorem block1821_lookup (i : Fin 32) :
    lookup (258 + i.val) = some (values1821[i.val]'(by rw [values1821_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0162_0339 (258 + i.val) = _
  rw [node0162_0339, split_right 258 node0162_0258 node0258_0339 (by omega)]
  rw [node0258_0339, split_left 290 block1821 node0290_0339 (by omega)]
  exact block1821_get i

theorem block1822_lookup (i : Fin 32) :
    lookup (290 + i.val) = some (values1822[i.val]'(by rw [values1822_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0162_0339 (290 + i.val) = _
  rw [node0162_0339, split_right 258 node0162_0258 node0258_0339 (by omega)]
  rw [node0258_0339, split_right 290 block1821 node0290_0339 (by omega)]
  rw [node0290_0339, split_left 322 block1822 block1823 (by omega)]
  exact block1822_get i

theorem block1823_lookup (i : Fin 17) :
    lookup (322 + i.val) = some (values1823[i.val]'(by rw [values1823_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0162_0339 (322 + i.val) = _
  rw [node0162_0339, split_right 258 node0162_0258 node0258_0339 (by omega)]
  rw [node0258_0339, split_right 290 block1821 node0290_0339 (by omega)]
  rw [node0290_0339, split_right 322 block1822 block1823 (by omega)]
  exact block1823_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1818_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1818_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1819_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1819_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1820_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1820_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1821_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1821_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1822_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1822_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1823_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1823_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1818_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1819_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1820_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1821_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1822_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow163.block1823_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow163
