/-
ABANDONWARE: text removed from `Grothe/Upper/Bivariate.lean` by the cleanup of 4 November 2026 (PR #301, task #291).
Kept for reference only: this folder is outside every Lake library, is not imported by any root
and is never built or checked. The lines below are the removed lines of the diff against master
b886bb574, verbatim (they are not a self-contained module: imports, namespaces and context are in the
original file at that commit).
-/

lemma abs_coeff_termOf_le {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (p : ℕ × ℕ) (j : ℕ) :
    |(termOf P Q p).coeff j| ≤ 1 :=
  (abs_coeff_le_l1 _ j).trans (l1_termOf_le_one hP hQ p)

/-- **`ℓ¹` perturbation of the table.** -/
theorem head_perturbation (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (S : Finset (ℕ × ℕ))
    (μ ν : ℕ × ℕ → ℝ) (K : ℕ) :
    ∑ j ∈ range K, |∑ p ∈ S, μ p * (termOf P Q p).coeff j - ∑ p ∈ S, ν p * (termOf P Q p).coeff j|
      ≤ ∑ p ∈ S, |μ p - ν p| := by
  simpa only [one_mul] using
    head_perturbation_weighted P Q S μ ν K (fun _ => 1)
      (fun p _ => (sum_abs_coeff_le_l1 _ _).trans (l1_termOf_le_one hP hQ p))

