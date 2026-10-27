import Grothe.UpperChaos.BandProj

/-!
# Finite rational Hermite expansions

The coefficients in `hermiteFinite` multiply the normalized tensor Hermite
vectors `hvec2`, not the unnormalized polynomials `H2`. Orthonormality therefore
identifies the squared norm with the sum of rational coefficient squares,
without factorial weights. Projection onto a mode set filters this finite sum.
These identities provide an exact interface for finite coefficient certificates.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- A finite expansion in the normalized tensor Hermite basis with rational coefficients. -/
def hermiteFinite (s : Finset Idx2) (a : Idx2 → ℚ) : Lp ℂ 2 mu2 :=
  ∑ i ∈ s, (a i : ℂ) • hvec2 i

/-- The Hermite coefficients are exactly the prescribed rationals on the finite index set. -/
theorem inner_hvec2_hermiteFinite (s : Finset Idx2) (a : Idx2 → ℚ) (i : Idx2) :
    ⟪hvec2 i, hermiteFinite s a⟫_ℂ = if i ∈ s then (a i : ℂ) else 0 := by
  simp [hermiteFinite, inner_sum, inner_smul_right, inner_hvec2]

/-- The squared norm is the sum of squares of the normalized Hermite coefficients. -/
theorem norm_hermiteFinite_sq (s : Finset Idx2) (a : Idx2 → ℚ) :
    ‖hermiteFinite s a‖ ^ 2 = ∑ i ∈ s, (a i : ℝ) ^ 2 := by
  rw [hermiteFinite, @norm_sq_eq_re_inner ℂ, orthonormal_hvec2.inner_sum,
    RCLike.re_to_complex, Complex.re_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Complex.conj_mul', ← Complex.ofReal_pow, Complex.ofReal_re, Complex.norm_ratCast, sq_abs]

/-- The same norm formula with all finite arithmetic performed in the rationals. -/
theorem norm_hermiteFinite_sq_cast (s : Finset Idx2) (a : Idx2 → ℚ) :
    ‖hermiteFinite s a‖ ^ 2 = ((∑ i ∈ s, a i ^ 2 : ℚ) : ℝ) := by
  rw [norm_hermiteFinite_sq]
  simp only [Rat.cast_sum, Rat.cast_pow]

/-- Projection retains exactly the coefficients whose indices belong to the mode set. -/
theorem projOn_hermiteFinite (B : Set Idx2) [DecidablePred (· ∈ B)]
    (s : Finset Idx2) (a : Idx2 → ℚ) :
    projOn B (hermiteFinite s a) = hermiteFinite (s.filter (· ∈ B)) a := by
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_projOn, inner_hvec2_hermiteFinite, Finset.mem_filter]
  by_cases hi : i ∈ B <;> simp [hi]

/-- The projected energy is the sum of coefficient squares on the selected modes. -/
theorem norm_projOn_hermiteFinite_sq (B : Set Idx2) [DecidablePred (· ∈ B)]
    (s : Finset Idx2) (a : Idx2 → ℚ) :
    ‖projOn B (hermiteFinite s a)‖ ^ 2 = ∑ i ∈ s.filter (· ∈ B), (a i : ℝ) ^ 2 := by
  rw [projOn_hermiteFinite, norm_hermiteFinite_sq]

/-- A projected norm formula whose right side is an exact finite rational sum. -/
theorem norm_projOn_hermiteFinite_sq_cast (B : Set Idx2) [DecidablePred (· ∈ B)]
    (s : Finset Idx2) (a : Idx2 → ℚ) :
    ‖projOn B (hermiteFinite s a)‖ ^ 2 = ((∑ i ∈ s.filter (· ∈ B), a i ^ 2 : ℚ) : ℝ) := by
  rw [projOn_hermiteFinite, norm_hermiteFinite_sq_cast]

/-- A finite expansion vanishes on any mode set disjoint from its listed indices. -/
theorem projOn_hermiteFinite_eq_zero (B : Set Idx2) [DecidablePred (· ∈ B)]
    (s : Finset Idx2) (a : Idx2 → ℚ) (h : ∀ i ∈ s, i ∉ B) :
    projOn B (hermiteFinite s a) = 0 := by
  have hs : s.filter (· ∈ B) = ∅ := by
    apply Finset.filter_eq_empty_iff.mpr
    intro i hi
    exact h i hi
  rw [projOn_hermiteFinite, hs, hermiteFinite, Finset.sum_empty]

end

end Grothe.UpperChaos
