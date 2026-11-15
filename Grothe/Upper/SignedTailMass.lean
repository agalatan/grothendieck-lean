-- Grothe/Upper/SignedTailMass.lean
import Grothe.Upper.SignedTail
import Mathlib.Analysis.Real.Sqrt

/-!
# Mass-sensitive signed-reference tails

Retaining the total mass `A` of the positive reference improves the linear
bound `S + E/2` to the square bound `L² ≤ A * (2*S - A + E)`, where `L` is
the absolute coefficient mass and `S` its signed mass. The quadratic-error
budget proves convergence. The certificate interface uses only arithmetic
and a nonnegative candidate bound, with no square roots to evaluate.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.Upper

open Finset

noncomputable section

private lemma quadratic_div_identity {a k : ℝ} (ha : 0 < a) :
    k ^ 2 / a = 2 * k - a + (k - a) ^ 2 / a := by
  field_simp [ha.ne']
  ring

private lemma centered_abs_quadratic_nonneg {a k : ℝ} (ha : 0 < a) (t : ℝ) :
    0 ≤ k ^ 2 / a - 2 * t * |k| + t ^ 2 * a := by
  have heq : (|k| - t * a) ^ 2 / a =
      |k| ^ 2 / a - 2 * t * |k| + t ^ 2 * a := by
    field_simp [ha.ne']
    ring
  rw [sq_abs] at heq
  rw [← heq]
  exact div_nonneg (sq_nonneg _) ha.le

/-- The weighted Cauchy--Schwarz estimate with its signed moment expansion.
The assumptions themselves imply absolute summability of the coefficients.
The index type may be empty. -/
theorem tsum_abs_sq_le_reference_mass {ι : Type*} {a k : ι → ℝ}
    (ha : ∀ i, 0 < a i) (hs : Summable a)
    (he : Summable fun i => (k i - a i) ^ 2 / a i) :
    (∑' i, |k i|) ^ 2 ≤ (∑' i, a i) *
      (2 * (∑' i, k i) - (∑' i, a i) + (∑' i, (k i - a i) ^ 2 / a i)) := by
  classical
  have hk := summable_abs_of_reference_quadratic ha hs he
  have hq : Summable fun i => k i ^ 2 / a i := by
    exact (((hk.of_abs.mul_left 2).sub hs).add he).congr
      (fun i => (quadratic_div_identity (ha i)).symm)
  have hqid : (∑' i, k i ^ 2 / a i) =
      2 * (∑' i, k i) - (∑' i, a i) + (∑' i, (k i - a i) ^ 2 / a i) := by
    calc
      _ = ∑' i, (2 * k i - a i + (k i - a i) ^ 2 / a i) :=
        tsum_congr fun i => quadratic_div_identity (ha i)
      _ = _ := by
        rw [((hk.of_abs.mul_left 2).sub hs).tsum_add he,
          (hk.of_abs.mul_left 2).tsum_sub hs, tsum_mul_left]
  have hquad (t : ℝ) : 0 ≤ (∑' i, k i ^ 2 / a i) -
      2 * t * (∑' i, |k i|) + t ^ 2 * (∑' i, a i) := by
    have hnonneg : 0 ≤ ∑' i, (k i ^ 2 / a i - 2 * t * |k i| + t ^ 2 * a i) :=
      tsum_nonneg (fun i => centered_abs_quadratic_nonneg (k := k i) (ha i) t)
    rw [(hq.sub (hk.mul_left (2 * t))).tsum_add (hs.mul_left (t ^ 2)),
      hq.tsum_sub (hk.mul_left (2 * t)), tsum_mul_left, tsum_mul_left] at hnonneg
    exact hnonneg
  cases isEmpty_or_nonempty ι with
  | inl hempty =>
      let := hempty
      simp
  | inr hne =>
      obtain ⟨i⟩ := hne
      have hA : 0 < ∑' i, a i := hs.tsum_pos (fun j => (ha j).le) i (ha i)
      have hscaled := hquad ((∑' i, |k i|) / (∑' i, a i))
      have hid : (∑' i, k i ^ 2 / a i) -
          2 * ((∑' i, |k i|) / (∑' i, a i)) * (∑' i, |k i|) +
          ((∑' i, |k i|) / (∑' i, a i)) ^ 2 * (∑' i, a i) =
          (∑' i, k i ^ 2 / a i) - (∑' i, |k i|) ^ 2 / (∑' i, a i) := by
        field_simp [hA.ne']
        ring
      rw [hid] at hscaled
      have hdiv : (∑' i, |k i|) ^ 2 / (∑' i, a i) ≤ (∑' i, k i ^ 2 / a i) := by
        linarith
      have hmul := (div_le_iff₀ hA).mp hdiv
      rw [hqid] at hmul
      nlinarith only [hmul]

/-- The mass-sensitive square-root form of the reference bound. -/
theorem tsum_abs_le_sqrt_reference_mass {ι : Type*} {a k : ι → ℝ}
    (ha : ∀ i, 0 < a i) (hs : Summable a)
    (he : Summable fun i => (k i - a i) ^ 2 / a i) :
    (∑' i, |k i|) ≤ Real.sqrt ((∑' i, a i) *
      (2 * (∑' i, k i) - (∑' i, a i) + (∑' i, (k i - a i) ^ 2 / a i))) :=
  Real.le_sqrt_of_sq_le (tsum_abs_sq_le_reference_mass ha hs he)

/-- Finite partial quadratic budgets imply the mass-sensitive square bound. -/
theorem tsum_abs_sq_le_mass_of_quadratic_budget {a k : ℕ → ℝ} {E : ℝ}
    (ha : ∀ n, 0 < a n) (hs : Summable a)
    (hE : ∀ J, ∑ n ∈ range J, (k n - a n) ^ 2 / a n ≤ E) :
    (∑' n, |k n|) ^ 2 ≤ (∑' n, a n) *
      (2 * (∑' n, k n) - (∑' n, a n) + E) := by
  have hn (n : ℕ) : 0 ≤ (k n - a n) ^ 2 / a n :=
    div_nonneg (sq_nonneg _) (ha n).le
  have he := summable_of_sum_range_le hn hE
  have hbudget := Real.tsum_le_of_sum_range_le hn hE
  exact (tsum_abs_sq_le_reference_mass ha hs he).trans
    (mul_le_mul_of_nonneg_left (by linarith)
      (tsum_nonneg fun n => (ha n).le))

/-- A square-root-free certificate for the absolute coefficient mass. -/
theorem tsum_abs_le_of_mass_quadratic_budget {a k : ℕ → ℝ} {E S T : ℝ}
    (ha : ∀ n, 0 < a n) (hs : Summable a)
    (hE : ∀ J, ∑ n ∈ range J, (k n - a n) ^ 2 / a n ≤ E)
    (hS : (∑' n, k n) ≤ S) (hT : 0 ≤ T)
    (hcert : (∑' n, a n) * (2 * S - (∑' n, a n) + E) ≤ T ^ 2) :
    (∑' n, |k n|) ≤ T := by
  have hA : 0 ≤ ∑' n, a n := tsum_nonneg fun n => (ha n).le
  have hmass := tsum_abs_sq_le_mass_of_quadratic_budget ha hs hE
  have hmono : (∑' n, a n) * (2 * (∑' n, k n) - (∑' n, a n) + E) ≤
      (∑' n, a n) * (2 * S - (∑' n, a n) + E) :=
    mul_le_mul_of_nonneg_left (by linarith) hA
  have hL : 0 ≤ ∑' n, |k n| := tsum_nonneg fun _ => abs_nonneg _
  nlinarith

/-- Direct tail-certificate interface: positivity is required only beyond `N`.
`S` may be any certified upper bound on the signed tail. -/
theorem signed_tail_le_of_mass_quadratic_budget
    (a k : ℕ → ℝ) (N : ℕ) (E S T : ℝ)
    (ha : ∀ n, 0 < a (n + N)) (hs : Summable fun n => a (n + N))
    (hE : ∀ J, ∑ n ∈ range J,
      (k (n + N) - a (n + N)) ^ 2 / a (n + N) ≤ E)
    (hS : (∑' n, k (n + N)) ≤ S) (hT : 0 ≤ T)
    (hcert : (∑' n, a (n + N)) *
      (2 * S - (∑' n, a (n + N)) + E) ≤ T ^ 2) :
    (∑' n, |k (n + N)|) ≤ T :=
  tsum_abs_le_of_mass_quadratic_budget ha hs hE hS hT hcert

/-- The improvement over the old squared allowance is exactly a square. -/
theorem mass_bound_defect_identity (A S E : ℝ) :
    (S + E / 2) ^ 2 - A * (2 * S - A + E) = (S - A + E / 2) ^ 2 := by
  ring

/-- The mass-sensitive allowance never exceeds a nonnegative old allowance. -/
theorem sqrt_mass_bound_le_signed_quadratic (A S E : ℝ) (hC : 0 ≤ S + E / 2) :
    Real.sqrt (A * (2 * S - A + E)) ≤ S + E / 2 := by
  apply Real.sqrt_le_iff.mpr
  refine ⟨hC, ?_⟩
  nlinarith only [sq_nonneg (S - A + E / 2), mass_bound_defect_identity A S E]

/-- For actual reference data the improved bound is always at most the earlier
signed-quadratic allowance; its required nonnegativity follows from the data. -/
theorem sqrt_reference_mass_le_signed_quadratic {ι : Type*} {a k : ι → ℝ}
    (ha : ∀ i, 0 < a i) (hs : Summable a)
    (he : Summable fun i => (k i - a i) ^ 2 / a i) :
    Real.sqrt ((∑' i, a i) * (2 * (∑' i, k i) - (∑' i, a i) +
      (∑' i, (k i - a i) ^ 2 / a i))) ≤
      (∑' i, k i) + (∑' i, (k i - a i) ^ 2 / a i) / 2 := by
  apply sqrt_mass_bound_le_signed_quadratic
  exact (tsum_nonneg fun i => abs_nonneg (k i)).trans
    (tsum_abs_le_signed_add_quadratic ha hs he)

end

end Grothe.Upper
