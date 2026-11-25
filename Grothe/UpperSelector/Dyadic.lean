import Grothe.UpperSelector.Gaussian

set_option warningAsError true

/-!
# One dyadic phase for all selector frequencies

At slope `17/100` every Fourier phase is an integer power of `exp(-17 I/50)`.
One Taylor estimate encloses that base. Powers of contractions and rounded
geometric recurrences propagate the enclosure with linearly growing error.

Agent-ID: codex-a7c4
-/

namespace Haagerup.AngularSelector

open Finset Complex

/-- Exact argument of the common phase for the `17/100` angular selector. -/
noncomputable def phaseArgument : ℂ := ⟨0, -17/50⟩

/-- Dyadic point in the closed unit disk, rounded toward zero componentwise. -/
noncomputable def phaseDyadic : ℂ :=
  ⟨1086922127456065706 / 2^60, -384484440037949947 / 2^60⟩

theorem norm_phaseDyadic_le_one : ‖phaseDyadic‖ ≤ 1 := by
  have h : Complex.normSq phaseDyadic ≤ 1 := by norm_num [phaseDyadic, Complex.normSq_apply]
  nlinarith [Complex.sq_norm phaseDyadic]

theorem norm_phaseArgument : ‖phaseArgument‖ = 17/50 := by
  have h : Complex.normSq phaseArgument = (17/50 : ℝ)^2 := by
    norm_num [phaseArgument, Complex.normSq_apply]
  nlinarith [Complex.sq_norm phaseArgument, norm_nonneg phaseArgument]

/-- A degree-15 Taylor polynomial encloses the one common phase, including the
rounding error of its two dyadic components. -/
theorem phaseDyadic_error : ‖Complex.exp phaseArgument - phaseDyadic‖ ≤ (1:ℝ) / 2^60 := by
  let P := ∑ m ∈ range 16, phaseArgument ^ m / m.factorial
  have htail : ‖Complex.exp phaseArgument - P‖ ≤ (1:ℝ) / 2^68 := by
    have h := Complex.exp_bound (x := phaseArgument) (by rw [norm_phaseArgument]; norm_num)
      (n := 16) (by decide)
    rw [norm_phaseArgument] at h
    exact h.trans (by norm_num [Nat.factorial_succ])
  have hround : ‖P - phaseDyadic‖ ≤ (255:ℝ) / 2^68 := by
    refine (Complex.norm_le_abs_re_add_abs_im _).trans ?_
    norm_num [P, Finset.sum_range_succ, phaseArgument, phaseDyadic, Nat.factorial_succ,
      pow_succ, Complex.add_re, Complex.add_im, Complex.sub_re, Complex.sub_im,
      Complex.mul_re, Complex.mul_im, Complex.div_ofNat_re, Complex.div_ofNat_im,
      div_one, Complex.zero_re, Complex.zero_im]
  exact (norm_sub_le_norm_sub_add_norm_sub _ P _).trans ((add_le_add htail hround).trans (by norm_num))

/-- Rounded powers of unit-disk elements amplify base error by at most their exponent. -/
theorem norm_pow_sub_pow_le {z a : ℂ} (hz : ‖z‖ ≤ 1) (ha : ‖a‖ ≤ 1) (n : ℕ) :
    ‖z^n - a^n‖ ≤ n * ‖z - a‖ := by
  induction n with
  | zero => simp
  | succ n ih =>
    have he : z^(n+1) - a^(n+1) = (z^n - a^n)*a + z^n*(z-a) := by ring
    calc
      _ ≤ ‖z^n - a^n‖ * ‖a‖ + ‖z‖^n * ‖z-a‖ := by
        rw [he]
        simpa only [norm_mul, norm_pow] using norm_add_le ((z^n-a^n)*a) (z^n*(z-a))
      _ ≤ n * ‖z-a‖ + ‖z-a‖ := add_le_add
        ((mul_le_of_le_one_right (norm_nonneg _) ha).trans ih)
        (mul_le_of_le_one_left (norm_nonneg _) (pow_le_one₀ (norm_nonneg _) hz))
      _ = _ := by push_cast; ring

/-- Exact phase at any grid multiple is an integer power of the common base. -/
theorem geometricFirst_grid (n : ℕ) :
    geometricFirst (n * (17/100 : ℝ)) =
      Complex.exp phaseArgument ^ n / (1 - Complex.I * ((n * (17/100 : ℝ) : ℝ) : ℂ)) ^ 2 := by
  rw [geometricFirst, ← Complex.exp_nat_mul]
  congr 2
  have hz : phaseArgument = (-17/50 : ℂ) * Complex.I := by
    apply Complex.ext <;> norm_num [phaseArgument, Complex.mul_re, Complex.mul_im]
  rw [hz]
  push_cast
  ring

/-- Propagation of arbitrary per-step rounding error in a contractive geometric recurrence.
No restrictions on the norms of the rounded iterates are needed. -/
theorem geometric_rounding_error {c w : ℂ} (hw : ‖w‖ ≤ 1) (v : ℕ → ℂ) {e₀ e : ℝ}
    (h₀ : ‖c - v 0‖ ≤ e₀) (hstep : ∀ n, ‖v n*w - v (n+1)‖ ≤ e) (n : ℕ) :
    ‖c * w^n - v n‖ ≤ e₀ + n*e := by
  induction n with
  | zero => simpa using h₀
  | succ n ih =>
    have he : c*w^(n+1) - v (n+1) = (c*w^n-v n)*w + (v n*w-v (n+1)) := by ring
    calc
      _ ≤ ‖c*w^n-v n‖*‖w‖ + ‖v n*w-v (n+1)‖ := by
        rw [he]
        simpa only [norm_mul] using norm_add_le ((c*w^n-v n)*w) (v n*w-v (n+1))
      _ ≤ (e₀+n*e)+e := add_le_add ((mul_le_of_le_one_right (norm_nonneg _) hw).trans ih) (hstep n)
      _ = _ := by push_cast; ring


/-- Rational complex starting coefficient for frequency index `m`; the only phase
appearing in this expression is the dyadic point inside the unit disk. -/
noncomputable def gridStart (m : ℕ) : ℂ :=
  phaseDyadic ^ m / (1 - Complex.I * ((m * (17/100 : ℝ) : ℝ) : ℂ)) ^ 2

theorem gridStart_error (m : ℕ) :
    ‖geometricFirst (m * (17/100 : ℝ)) - gridStart m‖ ≤ m / 2^60 := by
  let t := (m : ℝ) * (17/100)
  have hden : 1 ≤ ‖(1 - Complex.I * (t : ℂ)) ^ 2‖ := by
    rw [norm_pow, ← normSq_eq_norm_sq]
    simp [normSq_apply, mul_self_nonneg]
  have hbase : ‖Complex.exp phaseArgument‖ ≤ 1 := by
    simp [Complex.norm_exp, phaseArgument]
  rw [geometricFirst_grid, gridStart, ← sub_div, norm_div]
  refine (div_le_self (norm_nonneg _) hden).trans ?_
  rw [div_eq_mul_inv]
  simpa only [one_div] using
    (norm_pow_sub_pow_le hbase norm_phaseDyadic_le_one m).trans
      (mul_le_mul_of_nonneg_left phaseDyadic_error (Nat.cast_nonneg _))

/-- Pointwise Fourier-coefficient enclosure from rounded complex iterates and a final
real output rounding. The base phase contributes once with its frequency multiplier. -/
theorem gridCoefficient_error (m j : ℕ) (v : ℕ → ℂ) (output : ℝ) {e₀ e η : ℝ}
    (h₀ : ‖gridStart m - v 0‖ ≤ e₀)
    (hstep : ∀ n, ‖v n * geometricRatio (m * (17/100 : ℝ)) - v (n+1)‖ ≤ e)
    (hout : |(v j).re - output| ≤ η) :
    |(geometricFirst (m * (17/100 : ℝ)) * geometricRatio (m * (17/100 : ℝ)) ^ j).re - output| ≤
      (m / 2^60 + e₀) + j*e + η := by
  let t := (m : ℝ) * (17/100)
  have hi : ‖geometricFirst t - v 0‖ ≤ m / 2^60 + e₀ :=
    (norm_sub_le_norm_sub_add_norm_sub _ (gridStart m) _).trans (add_le_add (gridStart_error m) h₀)
  have h := geometric_rounding_error (norm_geometricRatio_lt_one t).le v hi hstep j
  calc
    _ ≤ |(geometricFirst t * geometricRatio t ^ j).re - (v j).re| + |(v j).re - output| :=
      abs_sub_le _ _ _
    _ ≤ _ := add_le_add ((Complex.abs_re_le_norm _).trans h) hout

end Haagerup.AngularSelector
