import Grothe.UpperChaos.ConditionalTableLookup
import Grothe.UpperChaos.OriginalRow227TriangleData1887
import Grothe.UpperChaos.OriginalRow227TriangleData1888
import Grothe.UpperChaos.OriginalRow227TriangleData1889
import Grothe.UpperChaos.OriginalRow227TriangleData1890
import Grothe.UpperChaos.OriginalRow227TriangleData1891

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleLookupRow175

open ConditionalTableLookup

def values1887 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1887.coefficient175_174,
  OriginalRow227TriangleData1887.coefficient175_175,
  OriginalRow227TriangleData1887.coefficient175_176,
  OriginalRow227TriangleData1887.coefficient175_177,
  OriginalRow227TriangleData1887.coefficient175_178,
  OriginalRow227TriangleData1887.coefficient175_179,
  OriginalRow227TriangleData1887.coefficient175_180,
  OriginalRow227TriangleData1887.coefficient175_181,
  OriginalRow227TriangleData1887.coefficient175_182,
  OriginalRow227TriangleData1887.coefficient175_183,
  OriginalRow227TriangleData1887.coefficient175_184,
  OriginalRow227TriangleData1887.coefficient175_185,
  OriginalRow227TriangleData1887.coefficient175_186,
  OriginalRow227TriangleData1887.coefficient175_187,
  OriginalRow227TriangleData1887.coefficient175_188,
  OriginalRow227TriangleData1887.coefficient175_189,
  OriginalRow227TriangleData1887.coefficient175_190,
  OriginalRow227TriangleData1887.coefficient175_191,
  OriginalRow227TriangleData1887.coefficient175_192,
  OriginalRow227TriangleData1887.coefficient175_193,
  OriginalRow227TriangleData1887.coefficient175_194,
  OriginalRow227TriangleData1887.coefficient175_195,
  OriginalRow227TriangleData1887.coefficient175_196,
  OriginalRow227TriangleData1887.coefficient175_197,
  OriginalRow227TriangleData1887.coefficient175_198,
  OriginalRow227TriangleData1887.coefficient175_199,
  OriginalRow227TriangleData1887.coefficient175_200,
  OriginalRow227TriangleData1887.coefficient175_201,
  OriginalRow227TriangleData1887.coefficient175_202,
  OriginalRow227TriangleData1887.coefficient175_203,
  OriginalRow227TriangleData1887.coefficient175_204,
  OriginalRow227TriangleData1887.coefficient175_205
]

theorem values1887_size : values1887.size = 32 := rfl

def block1887 : ℕ → Option IntervalDyadic := segment 174 values1887

theorem block1887_domain : ExactDomain block1887 174 206 := by
  simpa only [values1887_size] using segment_domain 174 values1887

theorem block1887_get (i : Fin 32) :
    block1887 (174 + i.val) = some (values1887[i.val]'(by rw [values1887_size]; exact i.isLt)) := by
  exact segment_get 174 values1887 ⟨i.val, by rw [values1887_size]; exact i.isLt⟩

def values1888 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1888.coefficient175_206,
  OriginalRow227TriangleData1888.coefficient175_207,
  OriginalRow227TriangleData1888.coefficient175_208,
  OriginalRow227TriangleData1888.coefficient175_209,
  OriginalRow227TriangleData1888.coefficient175_210,
  OriginalRow227TriangleData1888.coefficient175_211,
  OriginalRow227TriangleData1888.coefficient175_212,
  OriginalRow227TriangleData1888.coefficient175_213,
  OriginalRow227TriangleData1888.coefficient175_214,
  OriginalRow227TriangleData1888.coefficient175_215,
  OriginalRow227TriangleData1888.coefficient175_216,
  OriginalRow227TriangleData1888.coefficient175_217,
  OriginalRow227TriangleData1888.coefficient175_218,
  OriginalRow227TriangleData1888.coefficient175_219,
  OriginalRow227TriangleData1888.coefficient175_220,
  OriginalRow227TriangleData1888.coefficient175_221,
  OriginalRow227TriangleData1888.coefficient175_222,
  OriginalRow227TriangleData1888.coefficient175_223,
  OriginalRow227TriangleData1888.coefficient175_224,
  OriginalRow227TriangleData1888.coefficient175_225,
  OriginalRow227TriangleData1888.coefficient175_226,
  OriginalRow227TriangleData1888.coefficient175_227,
  OriginalRow227TriangleData1888.coefficient175_228,
  OriginalRow227TriangleData1888.coefficient175_229,
  OriginalRow227TriangleData1888.coefficient175_230,
  OriginalRow227TriangleData1888.coefficient175_231,
  OriginalRow227TriangleData1888.coefficient175_232,
  OriginalRow227TriangleData1888.coefficient175_233,
  OriginalRow227TriangleData1888.coefficient175_234,
  OriginalRow227TriangleData1888.coefficient175_235,
  OriginalRow227TriangleData1888.coefficient175_236,
  OriginalRow227TriangleData1888.coefficient175_237
]

theorem values1888_size : values1888.size = 32 := rfl

def block1888 : ℕ → Option IntervalDyadic := segment 206 values1888

theorem block1888_domain : ExactDomain block1888 206 238 := by
  simpa only [values1888_size] using segment_domain 206 values1888

theorem block1888_get (i : Fin 32) :
    block1888 (206 + i.val) = some (values1888[i.val]'(by rw [values1888_size]; exact i.isLt)) := by
  exact segment_get 206 values1888 ⟨i.val, by rw [values1888_size]; exact i.isLt⟩

def values1889 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1889.coefficient175_238,
  OriginalRow227TriangleData1889.coefficient175_239,
  OriginalRow227TriangleData1889.coefficient175_240,
  OriginalRow227TriangleData1889.coefficient175_241,
  OriginalRow227TriangleData1889.coefficient175_242,
  OriginalRow227TriangleData1889.coefficient175_243,
  OriginalRow227TriangleData1889.coefficient175_244,
  OriginalRow227TriangleData1889.coefficient175_245,
  OriginalRow227TriangleData1889.coefficient175_246,
  OriginalRow227TriangleData1889.coefficient175_247,
  OriginalRow227TriangleData1889.coefficient175_248,
  OriginalRow227TriangleData1889.coefficient175_249,
  OriginalRow227TriangleData1889.coefficient175_250,
  OriginalRow227TriangleData1889.coefficient175_251,
  OriginalRow227TriangleData1889.coefficient175_252,
  OriginalRow227TriangleData1889.coefficient175_253,
  OriginalRow227TriangleData1889.coefficient175_254,
  OriginalRow227TriangleData1889.coefficient175_255,
  OriginalRow227TriangleData1889.coefficient175_256,
  OriginalRow227TriangleData1889.coefficient175_257,
  OriginalRow227TriangleData1889.coefficient175_258,
  OriginalRow227TriangleData1889.coefficient175_259,
  OriginalRow227TriangleData1889.coefficient175_260,
  OriginalRow227TriangleData1889.coefficient175_261,
  OriginalRow227TriangleData1889.coefficient175_262,
  OriginalRow227TriangleData1889.coefficient175_263,
  OriginalRow227TriangleData1889.coefficient175_264,
  OriginalRow227TriangleData1889.coefficient175_265,
  OriginalRow227TriangleData1889.coefficient175_266,
  OriginalRow227TriangleData1889.coefficient175_267,
  OriginalRow227TriangleData1889.coefficient175_268,
  OriginalRow227TriangleData1889.coefficient175_269
]

theorem values1889_size : values1889.size = 32 := rfl

def block1889 : ℕ → Option IntervalDyadic := segment 238 values1889

theorem block1889_domain : ExactDomain block1889 238 270 := by
  simpa only [values1889_size] using segment_domain 238 values1889

theorem block1889_get (i : Fin 32) :
    block1889 (238 + i.val) = some (values1889[i.val]'(by rw [values1889_size]; exact i.isLt)) := by
  exact segment_get 238 values1889 ⟨i.val, by rw [values1889_size]; exact i.isLt⟩

def values1890 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1890.coefficient175_270,
  OriginalRow227TriangleData1890.coefficient175_271,
  OriginalRow227TriangleData1890.coefficient175_272,
  OriginalRow227TriangleData1890.coefficient175_273,
  OriginalRow227TriangleData1890.coefficient175_274,
  OriginalRow227TriangleData1890.coefficient175_275,
  OriginalRow227TriangleData1890.coefficient175_276,
  OriginalRow227TriangleData1890.coefficient175_277,
  OriginalRow227TriangleData1890.coefficient175_278,
  OriginalRow227TriangleData1890.coefficient175_279,
  OriginalRow227TriangleData1890.coefficient175_280,
  OriginalRow227TriangleData1890.coefficient175_281,
  OriginalRow227TriangleData1890.coefficient175_282,
  OriginalRow227TriangleData1890.coefficient175_283,
  OriginalRow227TriangleData1890.coefficient175_284,
  OriginalRow227TriangleData1890.coefficient175_285,
  OriginalRow227TriangleData1890.coefficient175_286,
  OriginalRow227TriangleData1890.coefficient175_287,
  OriginalRow227TriangleData1890.coefficient175_288,
  OriginalRow227TriangleData1890.coefficient175_289,
  OriginalRow227TriangleData1890.coefficient175_290,
  OriginalRow227TriangleData1890.coefficient175_291,
  OriginalRow227TriangleData1890.coefficient175_292,
  OriginalRow227TriangleData1890.coefficient175_293,
  OriginalRow227TriangleData1890.coefficient175_294,
  OriginalRow227TriangleData1890.coefficient175_295,
  OriginalRow227TriangleData1890.coefficient175_296,
  OriginalRow227TriangleData1890.coefficient175_297,
  OriginalRow227TriangleData1890.coefficient175_298,
  OriginalRow227TriangleData1890.coefficient175_299,
  OriginalRow227TriangleData1890.coefficient175_300,
  OriginalRow227TriangleData1890.coefficient175_301
]

theorem values1890_size : values1890.size = 32 := rfl

def block1890 : ℕ → Option IntervalDyadic := segment 270 values1890

theorem block1890_domain : ExactDomain block1890 270 302 := by
  simpa only [values1890_size] using segment_domain 270 values1890

theorem block1890_get (i : Fin 32) :
    block1890 (270 + i.val) = some (values1890[i.val]'(by rw [values1890_size]; exact i.isLt)) := by
  exact segment_get 270 values1890 ⟨i.val, by rw [values1890_size]; exact i.isLt⟩

def values1891 : Array IntervalDyadic := #[
  OriginalRow227TriangleData1891.coefficient175_302,
  OriginalRow227TriangleData1891.coefficient175_303,
  OriginalRow227TriangleData1891.coefficient175_304,
  OriginalRow227TriangleData1891.coefficient175_305,
  OriginalRow227TriangleData1891.coefficient175_306,
  OriginalRow227TriangleData1891.coefficient175_307,
  OriginalRow227TriangleData1891.coefficient175_308,
  OriginalRow227TriangleData1891.coefficient175_309,
  OriginalRow227TriangleData1891.coefficient175_310,
  OriginalRow227TriangleData1891.coefficient175_311,
  OriginalRow227TriangleData1891.coefficient175_312,
  OriginalRow227TriangleData1891.coefficient175_313,
  OriginalRow227TriangleData1891.coefficient175_314,
  OriginalRow227TriangleData1891.coefficient175_315,
  OriginalRow227TriangleData1891.coefficient175_316,
  OriginalRow227TriangleData1891.coefficient175_317,
  OriginalRow227TriangleData1891.coefficient175_318,
  OriginalRow227TriangleData1891.coefficient175_319,
  OriginalRow227TriangleData1891.coefficient175_320,
  OriginalRow227TriangleData1891.coefficient175_321,
  OriginalRow227TriangleData1891.coefficient175_322,
  OriginalRow227TriangleData1891.coefficient175_323,
  OriginalRow227TriangleData1891.coefficient175_324,
  OriginalRow227TriangleData1891.coefficient175_325,
  OriginalRow227TriangleData1891.coefficient175_326
]

theorem values1891_size : values1891.size = 25 := rfl

def block1891 : ℕ → Option IntervalDyadic := segment 302 values1891

theorem block1891_domain : ExactDomain block1891 302 327 := by
  simpa only [values1891_size] using segment_domain 302 values1891

theorem block1891_get (i : Fin 25) :
    block1891 (302 + i.val) = some (values1891[i.val]'(by rw [values1891_size]; exact i.isLt)) := by
  exact segment_get 302 values1891 ⟨i.val, by rw [values1891_size]; exact i.isLt⟩

def node0174_0238 : ℕ → Option IntervalDyadic := split 206 block1887 block1888

theorem node0174_0238_domain : ExactDomain node0174_0238 174 238 := by
  exact split_domain (by decide) (by decide) block1887_domain block1888_domain

def node0270_0327 : ℕ → Option IntervalDyadic := split 302 block1890 block1891

theorem node0270_0327_domain : ExactDomain node0270_0327 270 327 := by
  exact split_domain (by decide) (by decide) block1890_domain block1891_domain

def node0238_0327 : ℕ → Option IntervalDyadic := split 270 block1889 node0270_0327

theorem node0238_0327_domain : ExactDomain node0238_0327 238 327 := by
  exact split_domain (by decide) (by decide) block1889_domain node0270_0327_domain

def node0174_0327 : ℕ → Option IntervalDyadic := split 238 node0174_0238 node0238_0327

theorem node0174_0327_domain : ExactDomain node0174_0327 174 327 := by
  exact split_domain (by decide) (by decide) node0174_0238_domain node0238_0327_domain

def lookup : ℕ → Option IntervalDyadic := node0174_0327

theorem lookup_domain : ExactDomain lookup 174 327 :=
  node0174_0327_domain

theorem block1887_lookup (i : Fin 32) :
    lookup (174 + i.val) = some (values1887[i.val]'(by rw [values1887_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0174_0327 (174 + i.val) = _
  rw [node0174_0327, split_left 238 node0174_0238 node0238_0327 (by omega)]
  rw [node0174_0238, split_left 206 block1887 block1888 (by omega)]
  exact block1887_get i

theorem block1888_lookup (i : Fin 32) :
    lookup (206 + i.val) = some (values1888[i.val]'(by rw [values1888_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0174_0327 (206 + i.val) = _
  rw [node0174_0327, split_left 238 node0174_0238 node0238_0327 (by omega)]
  rw [node0174_0238, split_right 206 block1887 block1888 (by omega)]
  exact block1888_get i

theorem block1889_lookup (i : Fin 32) :
    lookup (238 + i.val) = some (values1889[i.val]'(by rw [values1889_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0174_0327 (238 + i.val) = _
  rw [node0174_0327, split_right 238 node0174_0238 node0238_0327 (by omega)]
  rw [node0238_0327, split_left 270 block1889 node0270_0327 (by omega)]
  exact block1889_get i

theorem block1890_lookup (i : Fin 32) :
    lookup (270 + i.val) = some (values1890[i.val]'(by rw [values1890_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0174_0327 (270 + i.val) = _
  rw [node0174_0327, split_right 238 node0174_0238 node0238_0327 (by omega)]
  rw [node0238_0327, split_right 270 block1889 node0270_0327 (by omega)]
  rw [node0270_0327, split_left 302 block1890 block1891 (by omega)]
  exact block1890_get i

theorem block1891_lookup (i : Fin 25) :
    lookup (302 + i.val) = some (values1891[i.val]'(by rw [values1891_size]; exact i.isLt)) := by
  have hi := i.isLt
  change node0174_0327 (302 + i.val) = _
  rw [node0174_0327, split_right 238 node0174_0238 node0238_0327 (by omega)]
  rw [node0238_0327, split_right 270 block1889 node0270_0327 (by omega)]
  rw [node0270_0327, split_right 302 block1890 block1891 (by omega)]
  exact block1891_get i


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1887_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1887_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1888_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1888_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1889_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1889_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1890_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1890_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1891_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1891_get,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.lookup_domain,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1887_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1888_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1889_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1890_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleLookupRow175.block1891_lookup] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleLookupRow175
