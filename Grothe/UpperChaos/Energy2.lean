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

/-! ### Charge one ⇒ parity -/

/-- The diagonal rotation `(z₁, z₂) ↦ (cz₁, cz₂)`. -/
def rot2 (c : ℂ) (u : ℂ × ℂ) : ℂ × ℂ := (c * u.1, c * u.2)

lemma map_rot2 {c : ℂ} (hc : ‖c‖ = 1) : mu2.map (rot2 c) = mu2 := by
  have : rot2 c = Prod.map (fun z => c * z) (fun z => c * z) := rfl
  rw [this, ← Measure.map_prod_map _ _ (by fun_prop) (by fun_prop), map_rot_gaussC c hc]

lemma H2_rot2 {c : ℂ} (hcc : conj c * c = 1) (i : Idx2) (u : ℂ × ℂ) :
    H2 i (rot2 c u) = c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2) * H2 i u := by
  simp only [H2, rot2, ev_mul_H hcc, pow_add]; ring

/-- **Charge selection on `ℂ²`**: a charge-one `g` has `E[conj H2_i · g] = 0` unless
`p₁ + p₂ = q₁ + q₂ + 1`. -/
theorem integral_H2_charge_one {g : ℂ × ℂ → ℂ} (hg : MemLp g 2 mu2)
    (hch : ∀ c u, ‖c‖ = 1 → g (rot2 c u) = c * g u) {i : Idx2}
    (hi : i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1) : ∫ u, conj (H2 i u) * g u ∂mu2 = 0 := by
  obtain ⟨c, hc1, hcne⟩ := exists_charge_witness hi
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc1]; simp
  have hF : AEStronglyMeasurable (fun u => conj (H2 i u) * g u) (mu2.map (rot2 c)) := by
    rw [map_rot2 hc1]
    exact ((memLp_H2 i).aestronglyMeasurable.star).mul hg.aestronglyMeasurable
  have hrot := integral_map (by unfold rot2; fun_prop : AEMeasurable (rot2 c) mu2) hF
  rw [map_rot2 hc1] at hrot
  have e : ∀ u, conj (H2 i (rot2 c u)) * g (rot2 c u)
      = (conj (c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2)) * c) * (conj (H2 i u) * g u) :=
    fun u => by rw [H2_rot2 hcc, hch c u hc1]; simp only [map_mul]; ring
  simp_rw [e, integral_const_mul] at hrot
  have h2 : (conj (c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2)) * c - 1)
      * ∫ u, conj (H2 i u) * g u ∂mu2 = 0 := by rw [sub_mul, ← hrot, one_mul, sub_self]
  exact (mul_eq_zero.1 h2).resolve_left (sub_ne_zero.2 hcne)

/-- **Parity**: for `G` of charge one, the energies of even total degree vanish. -/
theorem energy_eq_zero_of_even {g : ℂ × ℂ → ℂ} (hg : MemLp g 2 mu2)
    (hch : ∀ c u, ‖c‖ = 1 → g (rot2 c u) = c * g u) (nm : ℕ × ℕ) (he : (nm.1 + nm.2) % 2 = 0) :
    energy (hg.toLp g) nm = 0 := by
  unfold energy
  have h0 : ∀ i : ↑(bideg ⁻¹' {nm}), ‖⟪hvec2 i.1, hg.toLp g⟫_ℂ‖ ^ 2 = 0 := fun i => by
    have hb : bideg i.1 = nm := i.2
    have hi : i.1.1.1 + i.1.2.1 ≠ i.1.1.2 + i.1.2.2 + 1 := by
      intro h
      rw [← hb] at he
      simp only [bideg] at he
      omega
    rw [inner_hvec2_left]
    have hint : ∫ u, conj (H2 i.1 u) * (hg.toLp g) u ∂mu2 = ∫ u, conj (H2 i.1 u) * g u ∂mu2 := by
      refine integral_congr_ae ?_
      filter_upwards [hg.coeFn_toLp] with u hu
      rw [hu]
    rw [hint, integral_H2_charge_one hg hch hi]; simp
  simp_rw [h0, tsum_zero]

end

end Grothe.UpperChaos
