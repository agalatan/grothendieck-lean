import Grothe.LowerAnalytic.ComplexGaussianSymmetry
import Grothe.LowerAnalytic.FibreSup

/-!
# The two symmetries of the fibre potential and the coverage lemma for the caps (PLAN_CAPS, L-f)

The fibre potential `Ψ(s) = sup_y J(y, s)` (`pot`, `Jpot` in `FibreSup.lean`) has two symmetries,
induced by the measure-preserving maps `z ↦ z̄` and `z ↦ −z` of the standard complex Gaussian
`gaussC` (`gaussC_map_conj`, `gaussC_map_neg`, in `ComplexGaussianSymmetry.lean`, which does not
depend on the fibre theory).  In the packing `Fib` (`η = (y₀ + i y₃, y₁ + i y₄,
y₂ + i y₅)`, `ζ = (y₆ + i y₈, y₇ + i y₉)`, `d = y₁₀ + i y₁₁`) they act on the dual variable by

* `Fib.cj` (`S_c`): conjugate every complex coordinate, i.e. flip the real coordinates
  `y₃, y₄, y₅, y₈, y₉, y₁₁`; then `B_{S_c y}(z) = conj(B_y(z̄))` (`Fib.fn_cj`),
* `Fib.ng` (`S_-`): negate `ζ₁, ζ₂, d`, i.e. flip `y₆, …, y₁₁` (the odd functions
  `z, z(|z|²−2)/√2, iz, iz(|z|²−2)/√2, z̄, iz̄`); then `B_{S_- y}(z) = B_y(−z)` (`Fib.fn_ng`).

With `L(z̄) = conj L(z)`, `L(−z) = −L(z)`, `M S = S M`, `quad ∘ S = quad` and `S a = a` (true for
`aFib b₁ b₂ b₃`, which has real even coordinates only) this gives `J(S_c y, s) = J(y, s)`
(`Jpot_cj`) and `J(S_- y, s) = J(y, s)` (`Jpot_ng`), for every identity tail `ν`: the pair
potential satisfies `Ψ_ν(Ā, B̄) = Ψ_ν(A, B)` and `Ψ_ν(−B, −A) = Ψ_ν(A, B)` (`psiT_conj`, `psiT_neg`,
`psiT_comm`).  Hence a cap proved on pieces `Π_i` covers the whole fibre space as soon as the
pieces and their three symmetric images cover it (`pot_le_of_cover`, `pot_le_sup'_of_cover`).
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### The fibre functions under the symmetries -/

lemma fB1_conj (z : ℂ) : fB1 (conj z) = fB1 z := by simp [fB1]
lemma fB2_conj (z : ℂ) : fB2 (conj z) = conj (fB2 z) := by simp [fB2, map_div₀]
lemma fB4_conj (z : ℂ) : fB4 (conj z) = conj (fB4 z) := by simp [fB4, map_div₀, map_ofNat]
lemma fB1_neg (z : ℂ) : fB1 (-z) = fB1 z := by simp [fB1]
lemma fB2_neg (z : ℂ) : fB2 (-z) = fB2 z := by simp [fB2]
lemma fB4_neg (z : ℂ) : fB4 (-z) = -fB4 z := by simp [fB4]; ring

/-- `L(z̄) = conj L(z)`. -/
lemma Lf_conj (ℓ β : ℝ) (z : ℂ) : Lf ℓ β (conj z) = conj (Lf ℓ β z) := by simp [Lf, map_ofNat]
/-- `L(−z) = −L(z)`. -/
lemma Lf_neg (ℓ β : ℝ) (z : ℂ) : Lf ℓ β (-z) = -Lf ℓ β z := by simp [Lf]

namespace Fib

/-- `S_c`: conjugate every coordinate (flip `y₃, y₄, y₅, y₈, y₉, y₁₁`). -/
def cj (v : Fib) : Fib := ⟨conj v.e1, conj v.e2, conj v.e3, conj v.z1, conj v.z2, conj v.d⟩
/-- `S_-`: negate the odd coordinates `ζ₁, ζ₂, d` (flip `y₆, …, y₁₁`). -/
def ng (v : Fib) : Fib := ⟨v.e1, v.e2, v.e3, -v.z1, -v.z2, -v.d⟩

lemma cj_cj (v : Fib) : v.cj.cj = v := by simp [cj]
lemma ng_ng (v : Fib) : v.ng.ng = v := by simp [ng]

/-- `B_{S_c v}(z) = conj(B_v(z̄))`. -/
theorem fn_cj (v : Fib) (z : ℂ) : v.cj.fn z = conj (v.fn (conj z)) := by
  simp only [fn, cj, map_add, map_mul, fB1_conj, fB2_conj, fB4_conj, Complex.conj_conj]
  simp [fB1]

/-- `B_{S_- v}(z) = B_v(−z)`. -/
theorem fn_ng (v : Fib) (z : ℂ) : v.ng.fn z = v.fn (-z) := by
  simp only [fn, ng, fB1_neg, fB2_neg, fB4_neg, map_neg]; ring

variable (E : Sym3) (R : Sym2)

lemma M_cj (y : Fib) : M E R y.cj = (M E R y).cj := by
  simp [M, cj, map_add, map_mul]

lemma M_ng (y : Fib) : M E R y.ng = (M E R y).ng := by
  simp only [M, ng, mk.injEq]; refine ⟨trivial, trivial, trivial, ?_, ?_, ?_⟩ <;> ring

lemma quad_cj (y : Fib) : quad E R y.cj = quad E R y := by
  simp [quad, cj, Sym3.form, Sym2.form, hre_eq]

lemma quad_ng (y : Fib) : quad E R y.ng = quad E R y := by
  simp [quad, ng, Sym3.form, Sym2.form, hre_eq]

end Fib

lemma aFib_cj (b1 b2 b3 : ℝ) : (aFib b1 b2 b3).cj = aFib b1 b2 b3 := by
  simp [aFib, Fib.cj, Complex.conj_ofReal]

lemma aFib_ng (b1 b2 b3 : ℝ) : (aFib b1 b2 b3).ng = aFib b1 b2 b3 := by
  simp [aFib, Fib.ng]

/-! ### Invariance of `J` -/

variable (E : Sym3) (R : Sym2) (ℓ β : ℝ) (a : Fib) (ν : ℝ)

lemma pfn_cj (ha : a.cj = a) (y : Fib) (s : ℝ) (z : ℂ) :
    pfn E R a y.cj s z = conj (pfn E R a y s (conj z)) := by
  rw [pfn_eq, pfn_eq, Fib.M_cj, Fib.fn_cj]
  conv_lhs => rw [← ha, Fib.fn_cj]
  simp [map_add, map_mul]

lemma pfn_ng (ha : a.ng = a) (y : Fib) (s : ℝ) (z : ℂ) :
    pfn E R a y.ng s z = pfn E R a y s (-z) := by
  rw [pfn_eq, pfn_eq, Fib.M_ng, Fib.fn_ng]
  conv_lhs => rw [← ha, Fib.fn_ng]

/-- **`J(S_c y, s) = J(y, s)`** when `S_c a = a`. -/
theorem Jpot_cj (ha : a.cj = a) (y : Fib) (s : ℝ) :
    Jpot E R ℓ β a ν y.cj s = Jpot E R ℓ β a ν y s := by
  unfold Jpot
  rw [Fib.quad_cj]
  refine congrArg (· - Fib.quad E R y) ?_
  rw [← integral_gaussC_comp _ Complex.continuous_conj gaussC_map_conj _
    (continuous_Jtail E R ℓ β a ν y s)]
  refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
  have hz : Lf ℓ β z = conj (Lf ℓ β (conj z)) := by rw [Lf_conj, Complex.conj_conj]
  beta_reduce
  rw [pfn_cj E R a ha, hz, ← map_add, ← map_sub, psiT_conj]

/-- **`J(S_- y, s) = J(y, s)`** when `S_- a = a` (the two arguments `L ± p` of `Ψ_ν` are exchanged
and negated). -/
theorem Jpot_ng (ha : a.ng = a) (y : Fib) (s : ℝ) :
    Jpot E R ℓ β a ν y.ng s = Jpot E R ℓ β a ν y s := by
  unfold Jpot
  rw [Fib.quad_ng]
  refine congrArg (· - Fib.quad E R y) ?_
  rw [← integral_gaussC_comp _ continuous_neg gaussC_map_neg _ (continuous_Jtail E R ℓ β a ν y s)]
  refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
  have hz : Lf ℓ β z = -Lf ℓ β (-z) := by rw [Lf_neg, neg_neg]
  beta_reduce
  rw [pfn_ng E R a ha, hz,
    show -Lf ℓ β (-z) + pfn E R a y s (-z) = -(Lf ℓ β (-z) - pfn E R a y s (-z)) by ring,
    show -Lf ℓ β (-z) - pfn E R a y s (-z) = -(Lf ℓ β (-z) + pfn E R a y s (-z)) by ring,
    psiT_neg, psiT_comm]

/-! ### The coverage lemma -/

/-- The orbit of a piece under the group `{1, S_c, S_-, S_c S_-}`. -/
def symOrbit (P : Set Fib) : Set Fib :=
  P ∪ Fib.cj '' P ∪ Fib.ng '' P ∪ (fun y => (Fib.ng y).cj) '' P

/-- A bound of `J` on a piece holds on its orbit. -/
lemma Jpot_le_of_mem_symOrbit (hc : a.cj = a) (hn : a.ng = a) (s q : ℝ) (P : Set Fib)
    (hP : ∀ y ∈ P, Jpot E R ℓ β a ν y s ≤ q) {y : Fib} (hy : y ∈ symOrbit P) :
    Jpot E R ℓ β a ν y s ≤ q := by
  rcases hy with ((hy | ⟨w, hw, rfl⟩) | ⟨w, hw, rfl⟩) | ⟨w, hw, rfl⟩
  · exact hP y hy
  · rw [Jpot_cj E R ℓ β a ν hc]; exact hP w hw
  · rw [Jpot_ng E R ℓ β a ν hn]; exact hP w hw
  · rw [Jpot_cj E R ℓ β a ν hc, Jpot_ng E R ℓ β a ν hn]; exact hP w hw

end

end Grothe.LowerAnalytic
