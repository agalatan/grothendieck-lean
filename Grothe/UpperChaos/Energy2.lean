import Grothe.UpperChaos.MehlerL2

/-!
# Chaos energies on `ℂ²` (U4 of PLAN_UPPER)

For `G ∈ L²(gaussC ⊗ gaussC)` the energy of bidegree `(n, m)` is

    energy G (n, m) = Σ_{p₁+q₁ = n, p₂+q₂ = m} |⟪h_{(p₁,q₁),(p₂,q₂)}, G⟫|²  ≥ 0.

* `hasSum_energy_bideg`: the energies sum to `‖G‖²` (so `summable`, and `Σ E ≤ 1` when `|G| ≤ 1`);
* `hasSum_kernel_real`: for real `ρ₁, ρ₂ ∈ [−1, 1]`,
  `E[conj G(X) · G(Y)] = Σ_{n,m} energy G (n, m) ρ₁ⁿ ρ₂ᵐ` — the kernel of the rounding `G` as a
  power series with the energies as coefficients;
* `energy_eq_zero_of_even`: for `G` of charge one (`G(cz₁, cz₂) = c G(z₁, z₂)` for `|c| = 1`),
  `energy G (n, m) = 0` when `n + m` is even (`parity`).
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- The bidegree `(p₁ + q₁, p₂ + q₂)` of a multi-index. -/
def bideg (i : Idx2) : ℕ × ℕ := (i.1.1 + i.1.2, i.2.1 + i.2.2)

/-- **The chaos energy** of bidegree `(n, m)`. -/
def energy (G : Lp ℂ 2 mu2) (nm : ℕ × ℕ) : ℝ := ∑' i : bideg ⁻¹' {nm}, ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2

lemma energy_nonneg (G : Lp ℂ 2 mu2) (nm : ℕ × ℕ) : 0 ≤ energy G nm :=
  tsum_nonneg fun _ => sq_nonneg _

/-- **Parseval by bidegree**: `Σ_{n,m} energy G (n, m) = ‖G‖²`. -/
theorem hasSum_energy_bideg (G : Lp ℂ 2 mu2) : HasSum (energy G) (‖G‖ ^ 2) :=
  (hasSum_energy2 G).tsum_fiberwise bideg

theorem summable_abs_energy (G : Lp ℂ 2 mu2) : Summable fun nm => |energy G nm| := by
  simp_rw [abs_of_nonneg (energy_nonneg G _)]; exact (hasSum_energy_bideg G).summable

lemma lam_real (ρ₁ ρ₂ : ℝ) (i : Idx2) :
    lam ρ₁ ρ₂ i = ((ρ₁ ^ (bideg i).1 * ρ₂ ^ (bideg i).2 : ℝ) : ℂ) := by
  simp [lam, bideg, Complex.conj_ofReal, pow_add]

/-- **The kernel of `G` for real correlations**: `E[conj G(X) G(Y)] = Σ energy G (n,m) ρ₁ⁿ ρ₂ᵐ`. -/
theorem hasSum_kernel_real {ρ₁ ρ₂ : ℝ} (h₁ : ‖(ρ₁ : ℂ)‖ ≤ 1) (h₂ : ‖(ρ₂ : ℂ)‖ ≤ 1)
    (G : Lp ℂ 2 mu2) :
    HasSum (fun nm => ((energy G nm * ρ₁ ^ nm.1 * ρ₂ ^ nm.2 : ℝ) : ℂ)) (Bm h₁ h₂ G G) := by
  have hm := mehler_L2 h₁ h₂ G G
  have e : ∀ i, conj ⟪hvec2 i, G⟫_ℂ * lam (ρ₁ : ℂ) ρ₂ i * ⟪hvec2 i, G⟫_ℂ
      = ((‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 * (ρ₁ ^ (bideg i).1 * ρ₂ ^ (bideg i).2) : ℝ) : ℂ) := fun i => by
    rw [lam_real, mul_comm (conj _), mul_assoc, Complex.conj_mul', ← Complex.ofReal_pow]
    push_cast; ring
  simp_rw [e] at hm
  have hf := hm.tsum_fiberwise bideg
  convert hf using 1
  funext nm
  have hb : ∀ b : ↑(bideg ⁻¹' {nm}),
      ρ₁ ^ (bideg b.1).1 * ρ₂ ^ (bideg b.1).2 = ρ₁ ^ nm.1 * ρ₂ ^ nm.2 := fun b => by
    rw [show bideg b.1 = nm from b.2]
  simp_rw [hb]
  rw [← Complex.ofReal_tsum, tsum_mul_right, energy, mul_assoc]

end

end Grothe.UpperChaos
