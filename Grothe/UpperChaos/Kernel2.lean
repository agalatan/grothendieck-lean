import Grothe.UpperChaos.Energy2
import Grothe.Upper.Final
import Grothe.Upper.Realise
import Grothe.Upper.Compose

/-!
# The physical kernel of a charge-one function on `ℂ²` (U5/S6 of PLAN_UPPER)

Let `G ∈ L²(gaussC ⊗ gaussC)` have Hermite coefficients only on charge-one indices
(`p₁ + p₂ = q₁ + q₂ + 1`), let `P, Q` be real polynomials with `‖P‖_𝒜, ‖Q‖_𝒜 ≤ 1`, `|z| ≤ 1`, and
correlate the two coordinates by `ρ₁ = z P(|z|²)`, `ρ₂ = z Q(|z|²)` (`polyKernel`).  Then

    E[conj G(X) · G(Y)] = Σ_j bivarKernel P Q (energy G) j · z|z|^{2j}
                       = radialKernel (bivarKernel P Q (energy G)) z           (`Bm_polyKernel`)

i.e. the correlation kernel of the rounding `G` with preprocessors `P, Q` is the radial kernel
whose coefficients are computed from the chaos energies exactly as in `kernelCoeff`.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Finset
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

open Polynomial in
/-- **Power series of the bivariate kernel**: for `0 ≤ r ≤ 1`,
`Σ'_j bivarKernel P Q μ j · r^j = Σ'_{(n,m)} μ(n,m) · termOf P Q (n,m) (r)`. -/
theorem tsum_bivarKernel_mul_pow {P Q : ℝ[X]} (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1)
    {μ : ℕ × ℕ → ℝ} (hμ : Summable fun p => |μ p|) {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r ≤ 1) :
    ∑' j, Grothe.Upper.bivarKernel P Q μ j * r ^ j
      = ∑' p, μ p * (Grothe.Upper.termOf P Q p).eval r := by
  set f : ℕ × ℕ → ℕ → ℝ := fun p j => μ p * (Grothe.Upper.termOf P Q p).coeff j * r ^ j with hf
  have hsum : Summable (Function.uncurry f) := by
    refine Summable.of_norm ?_
    have hnn : 0 ≤ fun q : (ℕ × ℕ) × ℕ => ‖Function.uncurry f q‖ := fun q => norm_nonneg _
    refine (summable_prod_of_nonneg hnn).2 ⟨fun p => ?_, ?_⟩
    · simp only [Function.uncurry_apply_pair, hf, Real.norm_eq_abs, mul_assoc, abs_mul]
      exact ((Grothe.summable_coeff_mul_pow (Grothe.Upper.termOf P Q p) r).mul_left |μ p|).congr
        fun n => by rw [abs_mul]
    · refine Summable.of_nonneg_of_le (fun p => tsum_nonneg fun n => norm_nonneg _)
        (fun p => ?_) hμ
      simp only [Function.uncurry_apply_pair, hf, Real.norm_eq_abs, mul_assoc, abs_mul]
      rw [tsum_mul_left]
      refine mul_le_of_le_one_right (abs_nonneg _) ?_
      have := Grothe.tsum_abs_coeff_mul_pow_le (Grothe.Upper.termOf P Q p) hr0 hr1
      simp only [abs_mul] at this
      exact this.trans (Grothe.Upper.l1_termOf_le_one hP hQ p)
  have e1 : ∀ j, Grothe.Upper.bivarKernel P Q μ j * r ^ j = ∑' p, f p j := fun j => by
    rw [Grothe.Upper.bivarKernel, ← tsum_mul_right]
  have e2 : ∀ p, ∑' j, f p j = μ p * (Grothe.Upper.termOf P Q p).eval r := fun p => by
    simp only [hf, mul_assoc]
    rw [tsum_mul_left, Grothe.tsum_coeff_mul_pow]
  simp only [e1, ← e2]
  exact hsum.tsum_comm

/-- The charge-one support of the Hermite coefficients. -/
def ChargeOne (G : Lp ℂ 2 mu2) : Prop :=
  ∀ i : Idx2, i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1 → ⟪hvec2 i, G⟫_ℂ = 0

lemma shiftOf_bideg {i : Idx2} (h : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) :
    Grothe.Upper.shiftOf (bideg i) = i.1.2 + i.2.2 := by
  simp only [Grothe.Upper.shiftOf, bideg]; omega

open Polynomial in
lemma eval_termOf_bideg (P Q : ℝ[X]) (r : ℝ) (i : Idx2) :
    (Grothe.Upper.termOf P Q (bideg i)).eval r
      = r ^ Grothe.Upper.shiftOf (bideg i) * (P.eval r ^ (i.1.1 + i.1.2) * Q.eval r ^ (i.2.1 + i.2.2)) := by
  simp [Grothe.Upper.termOf, bideg, eval_mul, eval_pow]

open Polynomial in
/-- `λ_i` at `ρ₁ = zP(|z|²)`, `ρ₂ = zQ(|z|²)` on charge-one indices. -/
lemma lam_polyKernel (P Q : ℝ[X]) (z : ℂ) {i : Idx2} (h : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) :
    lam (Grothe.polyKernel P z) (Grothe.polyKernel Q z) i
      = z * (((Grothe.Upper.termOf P Q (bideg i)).eval (‖z‖ ^ 2) : ℝ) : ℂ) := by
  rw [eval_termOf_bideg, shiftOf_bideg h]
  have hzz : z * conj z = (‖z‖ : ℂ) ^ 2 := by
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]; push_cast; ring
  simp only [lam, Grothe.polyKernel, map_mul, Complex.conj_ofReal, mul_pow]
  set A : ℂ := ((P.eval (‖z‖ ^ 2) : ℝ) : ℂ)
  set B : ℂ := ((Q.eval (‖z‖ ^ 2) : ℝ) : ℂ)
  obtain ⟨⟨p₁, q₁⟩, ⟨p₂, q₂⟩⟩ := i
  simp only at h ⊢
  have hp : z ^ p₁ * z ^ p₂ = z * z ^ (q₁ + q₂) := by
    rw [← pow_add, h, pow_succ, mul_comm]
  push_cast
  rw [← hzz]
  calc z ^ p₁ * A ^ p₁ * (conj z ^ q₁ * A ^ q₁) * (z ^ p₂ * B ^ p₂ * (conj z ^ q₂ * B ^ q₂))
      = (z ^ p₁ * z ^ p₂) * conj z ^ (q₁ + q₂) * (A ^ (p₁ + q₁) * B ^ (p₂ + q₂)) := by ring
    _ = z * ((z * conj z) ^ (q₁ + q₂) * (A ^ (p₁ + q₁) * B ^ (p₂ + q₂))) := by
        rw [hp, mul_pow]; ring

open Polynomial in
/-- **The kernel of a charge-one function with preprocessors `P, Q`.** -/
theorem Bm_polyKernel {G : Lp ℂ 2 mu2} (hG : ChargeOne G) {P Q : ℝ[X]} (hP : Grothe.l1 P ≤ 1)
    (hQ : Grothe.l1 Q ≤ 1) {z : ℂ} (hz : ‖z‖ ≤ 1) (h₁ : ‖Grothe.polyKernel P z‖ ≤ 1)
    (h₂ : ‖Grothe.polyKernel Q z‖ ≤ 1) :
    Bm h₁ h₂ G G = radialKernel (Grothe.Upper.bivarKernel P Q (energy G)) z := by
  set r : ℝ := ‖z‖ ^ 2 with hr
  have hr0 : 0 ≤ r := sq_nonneg _
  have hr1 : r ≤ 1 := pow_le_one₀ (norm_nonneg _) hz
  have hm := mehler_L2 h₁ h₂ G G
  have e : ∀ i, conj ⟪hvec2 i, G⟫_ℂ * lam (Grothe.polyKernel P z) (Grothe.polyKernel Q z) i
      * ⟪hvec2 i, G⟫_ℂ
      = (((‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 * (Grothe.Upper.termOf P Q (bideg i)).eval r : ℝ) : ℂ)) * z := by
    intro i
    by_cases hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
    · have hc : conj ⟪hvec2 i, G⟫_ℂ * ⟪hvec2 i, G⟫_ℂ = ((‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 : ℝ) : ℂ) := by
        rw [mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]
      rw [lam_polyKernel P Q z hi, ← hr]
      push_cast
      push_cast at hc
      linear_combination (z * (((Grothe.Upper.termOf P Q (bideg i)).eval r : ℝ) : ℂ)) * hc
    · rw [hG i hi]; simp
  simp_rw [e] at hm
  have hf := hm.tsum_fiberwise bideg
  have hfib : ∀ nm : ℕ × ℕ,
      ∑' b : ↑(bideg ⁻¹' {nm}), (((‖⟪hvec2 b.1, G⟫_ℂ‖ ^ 2
          * (Grothe.Upper.termOf P Q (bideg b.1)).eval r : ℝ) : ℂ)) * z
        = ((energy G nm * (Grothe.Upper.termOf P Q nm).eval r : ℝ) : ℂ) * z := fun nm => by
    have hb : ∀ b : ↑(bideg ⁻¹' {nm}), (Grothe.Upper.termOf P Q (bideg b.1)).eval r
        = (Grothe.Upper.termOf P Q nm).eval r := fun b => by rw [show bideg b.1 = nm from b.2]
    simp_rw [hb]
    rw [tsum_mul_right, ← Complex.ofReal_tsum, tsum_mul_right, energy]
  simp_rw [hfib] at hf
  rw [Grothe.radialKernel_eq_mul, ← hr,
    tsum_bivarKernel_mul_pow hP hQ (summable_abs_energy G) hr0 hr1, ← hf.tsum_eq, tsum_mul_right,
    ← Complex.ofReal_tsum, mul_comm]

end

end Grothe.UpperChaos
