/- Intended path: Grothe/HJM/PhaseRotationTail.lean -/
import Grothe.HJM.PhaseRotation
import Grothe.HJM.OriginTail

/-!
# Tail control for rotations of the HJM origin branch

The endpoint phase-phase term cancels from the unrotated real coefficient.
Rotating introduces at most `|ζ.im|` times the full complex cross-coefficient
tail. The latter can be estimated from the same residual energies and the
Gaussian phase tail; no new integral enclosure is assumed.
-/

open MeasureTheory Finset Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.HJM.Origin

noncomputable section

/-- The complex cross-coefficients have an absolutely summable suffix. -/
theorem complexCoeff_tail_summable (N : ℕ) :
    Summable (fun j : ℕ => ‖scalarPairCoeff FLp GLp (j + N)‖) := by
  simpa only [scalarPairCoeff, norm_mul, Complex.norm_conj] using
    (summable_nat_add_iff N).mpr (chargeOneCoeff_summable_norm_mul FLp GLp)

/-- The old real-coefficient tail plus a controlled imaginary contribution
bounds every rotation in the closed unit disk. -/
theorem rotatedCoeff_tail_le (ζ : ℂ) (hζ : ‖ζ‖ ≤ 1) (N : ℕ) :
    (∑' j : ℕ, |rotatedCoeff ζ (j + N)|) ≤
      (∑' j : ℕ, |coeff (j + N)|) +
        |ζ.im| * (∑' j : ℕ, ‖scalarPairCoeff FLp GLp (j + N)‖) := by
  have hζre : |ζ.re| ≤ 1 := (Complex.abs_re_le_norm ζ).trans hζ
  have hpoint (n : ℕ) : |rotatedCoeff ζ n| ≤
      |coeff n| + |ζ.im| * ‖scalarPairCoeff FLp GLp n‖ := by
    change |(ζ * scalarPairCoeff FLp GLp n).re| ≤
      |(scalarPairCoeff FLp GLp n).re| + |ζ.im| * ‖scalarPairCoeff FLp GLp n‖
    rw [Complex.mul_re]
    calc
      _ ≤ |ζ.re| * |(scalarPairCoeff FLp GLp n).re| +
          |ζ.im| * |(scalarPairCoeff FLp GLp n).im| := by
        simpa only [abs_mul] using
          abs_sub (ζ.re * (scalarPairCoeff FLp GLp n).re)
            (ζ.im * (scalarPairCoeff FLp GLp n).im)
      _ ≤ 1 * |(scalarPairCoeff FLp GLp n).re| +
          |ζ.im| * ‖scalarPairCoeff FLp GLp n‖ :=
        add_le_add (mul_le_mul_of_nonneg_right hζre (abs_nonneg _))
          (mul_le_mul_of_nonneg_left (Complex.abs_im_le_norm _) (abs_nonneg _))
      _ = _ := by simp
  have hrot := (summable_nat_add_iff N).mpr (rotatedCoeff_summable ζ)
  have hbound := (coeff_tail_summable N).add ((complexCoeff_tail_summable N).mul_left |ζ.im|)
  calc
    _ ≤ ∑' j : ℕ, (|coeff (j + N)| +
        |ζ.im| * ‖scalarPairCoeff FLp GLp (j + N)‖) :=
      Summable.tsum_le_tsum (fun j => hpoint (j + N)) hrot hbound
    _ = _ := by
      rw [Summable.tsum_add (coeff_tail_summable N)
        ((complexCoeff_tail_summable N).mul_left |ζ.im|), tsum_mul_left]

/-- A weighted residual-energy cap controls the unweighted suffix. -/
private lemma sum_sq_le_of_weighted (s : Finset ℕ) (u : ℕ → ℝ) (E : ℝ)
    (hE : ∑ j ∈ s, (2 * ((j + 120 : ℕ) : ℝ) + 1) ^ 2 * u j ^ 2 ≤ E) :
    ∑ j ∈ s, u j ^ 2 ≤ E / (241 : ℝ) ^ 2 := by
  apply (le_div_iff₀ (by norm_num : (0 : ℝ) < 241 ^ 2)).2
  calc
    _ = ∑ j ∈ s, (241 : ℝ) ^ 2 * u j ^ 2 := by rw [← Finset.mul_sum]; ring
    _ ≤ ∑ j ∈ s, (2 * ((j + 120 : ℕ) : ℝ) + 1) ^ 2 * u j ^ 2 := by
      apply Finset.sum_le_sum
      intro j _
      have hd : (241 : ℝ) ≤ 2 * ((j + 120 : ℕ) : ℝ) + 1 := by
        have hj : (0 : ℝ) ≤ (j : ℝ) := Nat.cast_nonneg j
        push_cast
        linarith
      exact mul_le_mul_of_nonneg_right
        (pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 241) hd 2) (sq_nonneg _)
    _ ≤ E := hE

/-- The existing residual-energy caps also bound the *complex* origin
cross-coefficient tail. This includes the phase-phase term that cancellation
removes from the unrotated real coefficients. -/
theorem complexCoeff_tail_at_120_le_of_residual_caps
    (hEL : leftTailEnergy 120 ≤ (1174 / 1000 : ℝ))
    (hER : rightTailEnergy 120 ≤ (1176 / 1000 : ℝ)) :
    (∑' j : ℕ, ‖scalarPairCoeff FLp GLp (j + 120)‖) ≤ (63 / 25000 : ℝ) := by
  apply Real.tsum_le_of_sum_range_le (fun _ => norm_nonneg _)
  intro K
  let s := Finset.range K
  let a : ℕ → ℂ := fun j => chargeOneCoeff FLp (j + 120)
  let b : ℕ → ℂ := fun j => chargeOneCoeff GLp (j + 120)
  let a0 : ℕ → ℂ := fun j => f 0 * chargeOneCoeff Grothe.Haag.phaseLp (j + 120)
  let b0 : ℕ → ℂ := fun j => g 0 * chargeOneCoeff Grothe.Haag.phaseLp (j + 120)
  have hlE : ∑ j ∈ s, (2 * ((j + 120 : ℕ) : ℝ) + 1) ^ 2 *
      ‖chargeOneCoeff fResidualLp (j + 120)‖ ^ 2 ≤ (1174 / 1000 : ℝ) :=
    ((left_weighted_tail_summable 120).sum_le_tsum s
      (fun j _ => by unfold leftEnergyTerm; positivity)).trans hEL
  have hrE : ∑ j ∈ s, (2 * ((j + 120 : ℕ) : ℝ) + 1) ^ 2 *
      ‖chargeOneCoeff gResidualLp (j + 120)‖ ^ 2 ≤ (1176 / 1000 : ℝ) :=
    ((right_weighted_tail_summable 120).sum_le_tsum s
      (fun j _ => by unfold rightEnergyTerm; positivity)).trans hER
  have hl : ∑ j ∈ s, ‖a j - a0 j‖ ^ 2 ≤ (9 / 2000 : ℝ) ^ 2 := by
    have h := sum_sq_le_of_weighted s
      (fun j => ‖chargeOneCoeff fResidualLp (j + 120)‖) _ hlE
    have hnum : (1174 / 1000 : ℝ) / 241 ^ 2 ≤ (9 / 2000 : ℝ) ^ 2 := by norm_num
    simpa only [a, a0, ← chargeOneCoeff_fResidualLp] using h.trans hnum
  have hr : ∑ j ∈ s, ‖b j - b0 j‖ ^ 2 ≤ (9 / 2000 : ℝ) ^ 2 := by
    have h := sum_sq_le_of_weighted s
      (fun j => ‖chargeOneCoeff gResidualLp (j + 120)‖) _ hrE
    have hnum : (1176 / 1000 : ℝ) / 241 ^ 2 ≤ (9 / 2000 : ℝ) ^ 2 := by norm_num
    simpa only [b, b0, ← chargeOneCoeff_gResidualLp] using h.trans hnum
  have hphase : ∑ j ∈ s, haagCoeff (j + 120) ≤ (1 / 480 : ℝ) := by
    have hs : Summable (fun j : ℕ => haagCoeff (j + 120)) :=
      (summable_nat_add_iff 120).mpr summable_haagCoeff.of_abs
    calc
      _ ≤ ∑' j : ℕ, haagCoeff (j + 120) :=
        hs.sum_le_tsum s (fun j _ => haagCoeff_nonneg _)
      _ = ∑' j : ℕ, haagCoeff (120 + j) := by
        congr 1
        funext j
        rw [Nat.add_comm]
      _ ≤ 1 / (4 * (120 : ℝ)) := HaagerupWallis.tail_le_one_div_four 120 (by norm_num)
      _ = 1 / 480 := by norm_num
  have hg0 : ‖g 0‖ = 1 := norm_g_eq_one 0 (by norm_num)
  have ha0 : ∑ j ∈ s, ‖a0 j‖ ^ 2 = ∑ j ∈ s, haagCoeff (j + 120) := by
    apply Finset.sum_congr rfl
    intro j _
    simp only [a0, norm_mul, norm_f_zero, one_mul, phase_chargeOneCoeff_energy]
  have hb0 : ∑ j ∈ s, ‖b0 j‖ ^ 2 = ∑ j ∈ s, haagCoeff (j + 120) := by
    apply Finset.sum_congr rfl
    intro j _
    simp only [b0, norm_mul, hg0, one_mul, phase_chargeOneCoeff_energy]
  have hp : ∑ j ∈ s, ‖conj (a0 j) * b0 j‖ =
      ∑ j ∈ s, haagCoeff (j + 120) := by
    apply Finset.sum_congr rfl
    intro j _
    simp only [a0, b0, norm_mul, Complex.norm_conj, norm_f_zero, hg0,
      one_mul, ← pow_two, phase_chargeOneCoeff_energy]
  have hroot : Real.sqrt (1 / 480 : ℝ) ≤ (23 / 500 : ℝ) := by
    apply Real.sqrt_le_iff.mpr
    norm_num
  have hrootA : Real.sqrt (∑ j ∈ s, ‖a0 j‖ ^ 2) ≤ (23 / 500 : ℝ) := by
    rw [ha0]
    exact (Real.sqrt_le_sqrt hphase).trans hroot
  have hrootB : Real.sqrt (∑ j ∈ s, ‖b0 j‖ ^ 2) ≤ (23 / 500 : ℝ) := by
    rw [hb0]
    exact (Real.sqrt_le_sqrt hphase).trans hroot
  have hpert := origin_coefficients_perturbation s a b a0 b0 (9 / 2000)
    (by norm_num) hl hr
  change ∑ j ∈ s, ‖conj (a j) * b j‖ ≤ (63 / 25000 : ℝ)
  calc
    _ ≤ ∑ j ∈ s, (‖conj (a j) * b j - conj (a0 j) * b0 j‖ +
        ‖conj (a0 j) * b0 j‖) := by
      apply Finset.sum_le_sum
      intro j _
      have h := norm_add_le (conj (a j) * b j - conj (a0 j) * b0 j)
        (conj (a0 j) * b0 j)
      simpa only [sub_add_cancel] using h
    _ = (∑ j ∈ s, ‖conj (a j) * b j - conj (a0 j) * b0 j‖) +
        ∑ j ∈ s, ‖conj (a0 j) * b0 j‖ := by rw [Finset.sum_add_distrib]
    _ ≤ (9 / 2000 : ℝ) * (Real.sqrt (∑ j ∈ s, ‖a0 j‖ ^ 2) +
        Real.sqrt (∑ j ∈ s, ‖b0 j‖ ^ 2)) + (9 / 2000 : ℝ) ^ 2 + 1 / 480 :=
      add_le_add hpert (by rw [hp]; exact hphase)
    _ ≤ _ := by nlinarith [hrootA, hrootB]

/-- Rotation preserves the existing mode-120 tail budget up to an explicit
linear phase penalty, using only the same two residual-energy caps. -/
theorem rotatedCoeff_tail_at_120_le_of_residual_caps
    (ζ : ℂ) (hζ : ‖ζ‖ ≤ 1)
    (hEL : leftTailEnergy 120 ≤ (1174 / 1000 : ℝ))
    (hER : rightTailEnergy 120 ≤ (1176 / 1000 : ℝ)) :
    (∑' j : ℕ, |rotatedCoeff ζ (j + 120)|) ≤
      (6457 / 25000000 : ℝ) + |ζ.im| * (63 / 25000 : ℝ) :=
  (rotatedCoeff_tail_le ζ hζ 120).trans <|
    add_le_add (coeff_tail_at_120_le_of_residual_caps hEL hER)
      (mul_le_mul_of_nonneg_left
        (complexCoeff_tail_at_120_le_of_residual_caps hEL hER) (abs_nonneg _))

end
end Grothe.HJM.Origin
