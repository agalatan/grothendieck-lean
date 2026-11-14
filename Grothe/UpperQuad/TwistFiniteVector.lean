import Grothe.UpperQuad.TwistFiniteExtension

/-!
# Finite-vector bound from the twisted matrix columns

Vanishing above the degree triangle puts every selected coefficient in one common finite sum.
The Euclidean triangle inequality then controls the whole coefficient vector by the norms of
the matrix columns. This step introduces no count of the selected output modes.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorization

open PolynomialHermite Explicit

noncomputable section

/-- A degree-bounded output coefficient may use the common larger input triangle. -/
theorem Jext_eq_sum_of_degree_le (j : ℕ) (r A : ℂ) (c d D : ℕ) (hcd : c + d ≤ D) :
    Jext j r A c d = ∑ gh ∈ indices (D + 35 * j),
      matrixCoefficient j r c d gh.1 gh.2 *
        Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A) := by
  unfold Jext
  apply Finset.sum_subset
  · rintro ⟨g, h⟩ hgh
    simp only [mem_indices] at hgh ⊢
    omega
  · rintro ⟨g, h⟩ _ hgh
    have hdeg : c + d + 35 * j < g + h := by
      simp only [mem_indices] at hgh
      omega
    rw [matrixCoefficient_eq_zero_of_degree_lt j r c d g h hdeg, zero_mul]

private def finiteVector (S : Finset (ℕ × ℕ)) (f : ℕ × ℕ → ℂ) : EuclideanSpace ℂ S :=
  WithLp.toLp 2 fun cd : S ↦ f cd.1

private lemma norm_finiteVector (S : Finset (ℕ × ℕ)) (f : ℕ × ℕ → ℂ) :
    ‖finiteVector S f‖ = Real.sqrt (∑ cd ∈ S, ‖f cd‖ ^ 2) := by
  rw [finiteVector, EuclideanSpace.norm_eq, ← Finset.sum_coe_sort S]

/-- Minkowski bounds the selected output vector by the finite matrix column norms. -/
theorem sqrt_sum_norm_Jext_sq_le (S : Finset (ℕ × ℕ)) (D : ℕ)
    (hS : ∀ cd ∈ S, cd.1 + cd.2 ≤ D) (j : ℕ) (r A : ℂ) :
    Real.sqrt (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) ≤
      ∑ gh ∈ indices (D + 35 * j),
        Real.sqrt (∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 gh.1 gh.2‖ ^ 2) *
          ‖Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A)‖ := by
  classical
  let v := finiteVector S (fun cd ↦ Jext j r A cd.1 cd.2)
  let col := fun gh : ℕ × ℕ ↦
    finiteVector S (fun cd ↦ matrixCoefficient j r cd.1 cd.2 gh.1 gh.2)
  let U := fun gh : ℕ × ℕ ↦ Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A)
  have hv : v = ∑ gh ∈ indices (D + 35 * j), U gh • col gh := by
    apply PiLp.ext
    intro cd
    change Jext j r A cd.1.1 cd.1.2 =
      (WithLp.ofLp (∑ gh ∈ indices (D + 35 * j), U gh • col gh)) cd
    simp only [WithLp.ofLp_sum, Finset.sum_apply, WithLp.ofLp_smul, Pi.smul_apply,
      smul_eq_mul]
    rw [Jext_eq_sum_of_degree_le j r A cd.1.1 cd.1.2 D (hS cd.1 cd.2)]
    exact Finset.sum_congr rfl fun _ _ ↦ mul_comm _ _
  calc
    Real.sqrt (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) = ‖v‖ :=
      (norm_finiteVector S _).symm
    _ = ‖∑ gh ∈ indices (D + 35 * j), U gh • col gh‖ := congrArg norm hv
    _ ≤ ∑ gh ∈ indices (D + 35 * j), ‖U gh • col gh‖ := norm_sum_le _ _
    _ = _ := by
      apply Finset.sum_congr rfl
      intro gh _
      rw [norm_smul, norm_finiteVector]
      exact mul_comm _ _

end

end Grothe.UpperQuad.TwistFactorization
