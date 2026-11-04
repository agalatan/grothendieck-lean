import Grothe.UpperQuad.GaussSound
import Grothe.UpperQuad.PairsSound
import GrotheQuadKernel.Contract

/-!
# Soundness of the contraction (the node factors and the raw accumulator)

Fixed-point intervals `Fx` at scale `2^KFix` contain a real `x` when `lo ≤ x · 2^K ≤ hi`
(`memFx`); products are exact at scale `2^{2K}` (`memFx2`).  The node factors enclose
`ψ_{k,j}(s) · e^{−s} · W` (`RadialLaguerre.radialFactor`), and one accumulation step adds to every
entry `[k][j][cIdx]` the product of the node factor with the node's canonical coefficient of the
pair `pairOf k cIdx` when its degree is within the cutoff.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos

/-- `x ∈ [lo, hi] / 2^KFix`. -/
def memFx (x : ℝ) (a : Fx) : Prop :=
  (a.lo : ℝ) ≤ x * (2 : ℝ) ^ KFix ∧ x * (2 : ℝ) ^ KFix ≤ a.hi

/-- `x ∈ [lo, hi] / 2^(2 KFix)` (accumulators and products). -/
def memFx2 (x : ℝ) (p : ℤ × ℤ) : Prop :=
  (p.1 : ℝ) ≤ x * (2 : ℝ) ^ (2 * KFix) ∧ x * (2 : ℝ) ^ (2 * KFix) ≤ p.2

lemma memFx_toFx {x : ℝ} {a : Ival} (hx : mem x a) : memFx x (toFx a) :=
  ⟨toFixedLo_le KFix hx, le_toFixedHi KFix hx⟩

lemma memFx2_zero : memFx2 0 ((0 : ℤ), (0 : ℤ)) := by simp [memFx2]

lemma memFx2_addPair {x y : ℝ} {p q : ℤ × ℤ} (hx : memFx2 x p) (hy : memFx2 y q) :
    memFx2 (x + y) (addPair p q) := by
  unfold memFx2 addPair at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2, hy.1, hy.2]

/-- The product of two real numbers within integer bounds, with the sign cases of `mulFx`. -/
lemma mulFx_bounds {X Y : ℝ} {a b : Fx} (hx1 : (a.lo : ℝ) ≤ X) (hx2 : X ≤ a.hi)
    (hy1 : (b.lo : ℝ) ≤ Y) (hy2 : Y ≤ b.hi) :
    ((mulFx a b).1 : ℝ) ≤ X * Y ∧ X * Y ≤ (mulFx a b).2 := by
  unfold mulFx
  split_ifs with h1 h2 h3 h4 h5 h6 h7 h8 <;> simp only [ge_iff_le, not_le] at * <;> push_cast
  all_goals try have h1r : (0 : ℝ) ≤ a.lo := by exact_mod_cast h1
  all_goals try have h1r : (a.lo : ℝ) < 0 := by exact_mod_cast h1
  all_goals try have h2r : (0 : ℝ) ≤ b.lo := by exact_mod_cast h2
  all_goals try have h2r : (b.lo : ℝ) < 0 := by exact_mod_cast h2
  all_goals try have h3r : (b.hi : ℝ) ≤ 0 := by exact_mod_cast h3
  all_goals try have h3r : (0 : ℝ) < b.hi := by exact_mod_cast h3
  all_goals try have h4r : (a.hi : ℝ) ≤ 0 := by exact_mod_cast h4
  all_goals try have h4r : (0 : ℝ) < a.hi := by exact_mod_cast h4
  all_goals try have h5r : (0 : ℝ) ≤ b.lo := by exact_mod_cast h5
  all_goals try have h5r : (b.lo : ℝ) < 0 := by exact_mod_cast h5
  all_goals try have h6r : (b.hi : ℝ) ≤ 0 := by exact_mod_cast h6
  all_goals try have h6r : (0 : ℝ) < b.hi := by exact_mod_cast h6
  all_goals try have h7r : (0 : ℝ) ≤ b.lo := by exact_mod_cast h7
  all_goals try have h7r : (b.lo : ℝ) < 0 := by exact_mod_cast h7
  all_goals try have h8r : (b.hi : ℝ) ≤ 0 := by exact_mod_cast h8
  all_goals try have h8r : (0 : ℝ) < b.hi := by exact_mod_cast h8
  · constructor <;> nlinarith
  · constructor <;> nlinarith
  · constructor <;> nlinarith
  · constructor <;> nlinarith
  · constructor <;> nlinarith
  · constructor <;> nlinarith
  · constructor <;> nlinarith
  · constructor <;> nlinarith
  · exact mul_bounds ⟨hx1, hx2⟩ ⟨hy1, hy2⟩

/-- The product of fixed intervals is sound (scale `2^{2K}`). -/
lemma memFx2_mulFx {x y : ℝ} {a b : Fx} (hx : memFx x a) (hy : memFx y b) :
    memFx2 (x * y) (mulFx a b) := by
  have hsc : x * y * (2 : ℝ) ^ (2 * KFix) = (x * (2 : ℝ) ^ KFix) * (y * (2 : ℝ) ^ KFix) := by
    rw [two_mul, pow_add]; ring
  unfold memFx2
  rw [hsc]
  exact mulFx_bounds hx.1 hx.2 hy.1 hy.2

/-! ### The node factors -/

/-- Entry `j` of row `k` of the node factors encloses `ψ_{k,j}(s) · (e^{−s} · W)`. -/
lemma memFx_nodeFactors (P : ℕ) (hP : 1 ≤ P) {s W : ℝ} {sI wI : Ival} (hs0 : 0 ≤ s) (hs : mem s sI)
    (hw : mem W wI) (hv : nodeFactorsValid P sI = true) (k j : ℕ) (hk : k < numCharges)
    (hj : j < blockSide k) :
    memFx (RadialLaguerre.radialFactor k j s * (Real.exp (-s) * W))
      (((nodeFactors P sI wI).getD k #[]).getD j default) := by
  unfold nodeFactorsValid at hv
  simp only [Bool.and_eq_true] at hv
  have hew : mem (Real.exp (-s) * W) (mulI P (expNegI P 400 sI) wI) :=
    mem_mulI P (mem_expNegI P hP 400 hs0 hs hv.1 hv.2) hw
  have hk' : k ≤ 251 := by unfold numCharges at hk; omega
  have hM : blockSide k - 1 ≤ 251 - k := by
    unfold blockSide; split_ifs with h <;> simp only [beq_iff_eq] at h <;> omega
  have hj' : j < blockSide k - 1 + 1 := by omega
  unfold nodeFactors nodeFactorsFrom
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hk, ↓reduceDIte, Option.getD_some,
    Array.getElem?_map]
  simp only [← Array.getD_eq_getD_getElem?]
  have hsz : (radialRowI P k (blockSide k - 1)
      ((lagTable P 251 (negExpTerms P (negI sI) 251)).getD (251 - k) #[])
      (powTable P (sqrtI P sI) 251)).size = blockSide k - 1 + 1 := by simp [radialRowI]
  rw [Array.getElem?_eq_getElem (by rw [hsz]; exact hj'), Option.map_some, Option.getD_some]
  apply memFx_toFx
  apply mem_mulI P _ hew
  have h := mem_radialRowI P hP k (blockSide k - 1) hs0 hs hk' hM j (by omega)
  rwa [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem (by rw [hsz]; exact hj'),
    Option.getD_some] at h

end Grothe.UpperQuad
