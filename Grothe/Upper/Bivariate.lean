import Grothe.ListPoly

/-!
# Two-coordinate kernels

A two-coordinate rounding has the correlation kernel `H(t) = Σ_{n,m} μ[n,m] ρ(t)^n σ(t)^m` with
`ρ(t) = t·P(t²)`, `σ(t) = t·Q(t²)` and a table `μ` supported on `n + m` odd.  Writing `X = t²`,
its radial coefficient sequence is the coefficient sequence of

  `B(X) = Σ_{(n,m)} μ[n,m] · X^{⌊n/2⌋ + ⌊m/2⌋} · P^n · Q^m`,

an infinite sum of polynomials (`bivarKernel`).

* `summable_abs_bivarKernel`, `tsum_abs_bivarKernel_le`: when `‖P‖_𝒜, ‖Q‖_𝒜 ≤ 1` and `Σ|μ| < ∞`,
  the kernel has summable coefficients, of total at most `Σ|μ|`; with `bivarKernel_sub` the
  kernels of two tables differ by at most their `ℓ¹` distance;
* `bivarKernel_eq_head`: when `Q` is divisible by `X` (so `σ` vanishes to third order), the radial
  coefficient `j` with `2j + 1 ≤ N` only involves the indices `headIdx N = {n + 3m ≤ N}`;
* `head_residual_le`: hence the head of the residual of the kernel of `μ` is the head computed
  from any other table `ν` plus the `ℓ¹` distance of the two tables on `headIdx N`.
-/

namespace Grothe.Upper

open Polynomial Finset

noncomputable section

/-- `∑_{k<K} |coeff p k| ≤ ‖p‖_𝒜`. -/
lemma sum_abs_coeff_le_l1 (p : ℝ[X]) (K : ℕ) : ∑ k ∈ range K, |p.coeff k| ≤ l1 p := by
  rw [l1_eq_sum_range p (N := max K (p.natDegree + 1)) (by omega)]
  apply sum_le_sum_of_subset_of_nonneg
  · intro k hk; exact mem_range.2 (lt_of_lt_of_le (mem_range.1 hk) (le_max_left _ _))
  · intro k _ _; exact abs_nonneg _

/-! ### The terms -/

/-- The index shift `⌊n/2⌋ + ⌊m/2⌋` (`= (n+m−1)/2` for `n+m` odd). -/
def shiftOf (p : ℕ × ℕ) : ℕ := p.1 / 2 + p.2 / 2

/-- The polynomial `X^{shift} · P^n · Q^m` of an index pair. -/
def termOf (P Q : ℝ[X]) (p : ℕ × ℕ) : ℝ[X] := X ^ shiftOf p * (P ^ p.1 * Q ^ p.2)

lemma l1_termOf_le (P Q : ℝ[X]) (p : ℕ × ℕ) : l1 (termOf P Q p) ≤ l1 P ^ p.1 * l1 Q ^ p.2 := by
  unfold termOf
  have hX : l1 (X ^ shiftOf p) ≤ 1 := (l1_pow_le X _).trans (by rw [l1_X, one_pow])
  have hPp : l1 (P ^ p.1) ≤ l1 P ^ p.1 := l1_pow_le P _
  have hQp : l1 (Q ^ p.2) ≤ l1 Q ^ p.2 := l1_pow_le Q _
  calc l1 (X ^ shiftOf p * (P ^ p.1 * Q ^ p.2))
      ≤ l1 (X ^ shiftOf p) * (l1 (P ^ p.1) * l1 (Q ^ p.2)) :=
        (l1_mul_le _ _).trans (mul_le_mul_of_nonneg_left (l1_mul_le _ _) (l1_nonneg _))
    _ ≤ 1 * (l1 P ^ p.1 * l1 Q ^ p.2) :=
        mul_le_mul hX (mul_le_mul hPp hQp (l1_nonneg _) (pow_nonneg (l1_nonneg _) _))
          (mul_nonneg (l1_nonneg _) (l1_nonneg _)) zero_le_one
    _ = _ := one_mul _

lemma pow_mul_pow_le_one {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (n m : ℕ) :
    l1 P ^ n * l1 Q ^ m ≤ 1 :=
  calc l1 P ^ n * l1 Q ^ m ≤ 1 * 1 :=
        mul_le_mul (pow_le_one₀ (l1_nonneg _) hP) (pow_le_one₀ (l1_nonneg _) hQ)
          (pow_nonneg (l1_nonneg _) _) zero_le_one
    _ = 1 := one_mul _

lemma l1_termOf_le_one {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (p : ℕ × ℕ) :
    l1 (termOf P Q p) ≤ 1 :=
  (l1_termOf_le P Q p).trans (pow_mul_pow_le_one hP hQ _ _)

lemma abs_coeff_termOf_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (p : ℕ × ℕ) (j : ℕ) :
    |(termOf P Q p).coeff j| ≤ 1 := by
  have h1 : |(termOf P Q p).coeff j| ≤ l1 (termOf P Q p) := by
    have := sum_abs_coeff_le_l1 (termOf P Q p) (j + 1)
    refine le_trans ?_ this
    exact single_le_sum (f := fun k => |(termOf P Q p).coeff k|) (fun k _ => abs_nonneg _)
      (mem_range.2 (Nat.lt_succ_self j))
  exact h1.trans (l1_termOf_le_one hP hQ p)

/-- **Locality.**  If `Q` is divisible by `X`, the term of `(n, m)` is divisible by
`X^{⌊n/2⌋ + ⌊m/2⌋ + m}`. -/
lemma coeff_termOf_eq_zero (P Q : ℝ[X]) (hQ : Q.coeff 0 = 0) (p : ℕ × ℕ) {j : ℕ}
    (hj : j < shiftOf p + p.2) : (termOf P Q p).coeff j = 0 := by
  obtain ⟨R, rfl⟩ := X_dvd_iff.2 hQ
  have e : termOf P (X * R) p = X ^ (shiftOf p + p.2) * (P ^ p.1 * R ^ p.2) := by
    unfold termOf
    rw [mul_pow, pow_add]
    ring
  rw [e, coeff_X_pow_mul']
  exact ite_eq_right (by omega)

/-! ### The kernel -/

/-- The radial coefficient sequence of the kernel of the table `μ`:
`Σ'_{p} μ p · [X^j] termOf p`. -/
def bivarKernel (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (j : ℕ) : ℝ := ∑' p, μ p * (termOf P Q p).coeff j

lemma summable_kernel_term (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (j : ℕ) : Summable fun p => μ p * (termOf P Q p).coeff j := by
  refine Summable.of_norm_bounded hμ fun p => ?_
  rw [Real.norm_eq_abs, abs_mul]
  exact mul_le_of_le_one_right (abs_nonneg _) (abs_coeff_termOf_le P Q hP hQ p j)

/-- The partial sums of the kernel are at most `Σ|μ|`. -/
lemma sum_abs_bivarKernel_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (J : ℕ) :
    ∑ j ∈ range J, |bivarKernel P Q μ j| ≤ ∑' p, |μ p| := by
  have hk : ∀ j, |bivarKernel P Q μ j| ≤ ∑' p, |μ p| * |(termOf P Q p).coeff j| := by
    intro j
    unfold bivarKernel
    have := norm_tsum_le_tsum_norm (f := fun p => μ p * (termOf P Q p).coeff j)
      (by simpa [Real.norm_eq_abs, abs_mul] using (summable_kernel_term P Q hP hQ μ hμ j).norm)
    simpa only [Real.norm_eq_abs, abs_mul] using this
  have hterm : ∀ j, Summable fun p => |μ p| * |(termOf P Q p).coeff j| := fun j => by
    simpa [abs_mul] using (summable_kernel_term P Q hP hQ μ hμ j).norm
  calc ∑ j ∈ range J, |bivarKernel P Q μ j|
      ≤ ∑ j ∈ range J, ∑' p, |μ p| * |(termOf P Q p).coeff j| := sum_le_sum fun j _ => hk j
    _ = ∑' p, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j| := by
        rw [← Summable.tsum_finsetSum fun j _ => hterm j]
        exact tsum_congr fun p => by rw [mul_sum]
    _ ≤ ∑' p, |μ p| := by
        have hle : ∀ p, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j| ≤ |μ p| := fun p =>
          mul_le_of_le_one_right (abs_nonneg _) ((sum_abs_coeff_le_l1 _ _).trans
            (l1_termOf_le_one hP hQ p))
        exact Summable.tsum_le_tsum hle
          (Summable.of_nonneg_of_le (fun p => by positivity) hle hμ) hμ

/-- The kernel is absolutely summable. -/
theorem summable_abs_bivarKernel (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) : Summable fun j => |bivarKernel P Q μ j| :=
  summable_of_sum_range_le (c := ∑' p, |μ p|) (fun _ => abs_nonneg _)
    (sum_abs_bivarKernel_le P Q hP hQ μ hμ)

/-- **`ℓ¹` contraction**: `Σ_j |kernel_j| ≤ Σ|μ|`. -/
theorem tsum_abs_bivarKernel_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) : ∑' j, |bivarKernel P Q μ j| ≤ ∑' p, |μ p| :=
  Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _) (sum_abs_bivarKernel_le P Q hP hQ μ hμ)

/-- The kernel is linear in the table. -/
theorem bivarKernel_sub (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ ν : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (hν : Summable fun p => |ν p|) (j : ℕ) :
    bivarKernel P Q (fun p => μ p - ν p) j = bivarKernel P Q μ j - bivarKernel P Q ν j := by
  unfold bivarKernel
  rw [← Summable.tsum_sub (summable_kernel_term P Q hP hQ μ hμ j)
    (summable_kernel_term P Q hP hQ ν hν j)]
  exact tsum_congr fun p => by ring

/-! ### The head -/

/-- The indices that can contribute to the degrees `≤ N` (in `t`): `n + 3m ≤ N`. -/
def headIdx (N : ℕ) : Finset (ℕ × ℕ) :=
  (range (N + 1) ×ˢ range (N + 1)).filter fun p => p.1 + 3 * p.2 ≤ N

lemma mem_headIdx {N : ℕ} {p : ℕ × ℕ} : p ∈ headIdx N ↔ p.1 + 3 * p.2 ≤ N := by
  unfold headIdx
  rw [mem_filter, mem_product, mem_range, mem_range]
  constructor
  · exact fun h => h.2
  · exact fun h => ⟨⟨by omega, by omega⟩, h⟩

/-- **The head only involves `headIdx N`.** -/
theorem bivarKernel_eq_head (P Q : ℝ[X]) (hQ : Q.coeff 0 = 0) (μ : ℕ × ℕ → ℝ)
    (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0) {N j : ℕ} (hj : 2 * j + 1 ≤ N) :
    bivarKernel P Q μ j = ∑ p ∈ headIdx N, μ p * (termOf P Q p).coeff j := by
  unfold bivarKernel
  refine tsum_eq_sum fun p hp => ?_
  by_cases hp2 : (p.1 + p.2) % 2 = 0
  · rw [hpar p hp2, zero_mul]
  · rw [mem_headIdx] at hp
    rw [coeff_termOf_eq_zero P Q hQ p (by unfold shiftOf; omega), mul_zero]

/-- **`ℓ¹` perturbation of the table.** -/
theorem head_perturbation (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (S : Finset (ℕ × ℕ))
    (μ ν : ℕ × ℕ → ℝ) (K : ℕ) :
    ∑ j ∈ range K, |∑ p ∈ S, μ p * (termOf P Q p).coeff j - ∑ p ∈ S, ν p * (termOf P Q p).coeff j|
      ≤ ∑ p ∈ S, |μ p - ν p| := by
  calc ∑ j ∈ range K,
        |∑ p ∈ S, μ p * (termOf P Q p).coeff j - ∑ p ∈ S, ν p * (termOf P Q p).coeff j|
      ≤ ∑ j ∈ range K, ∑ p ∈ S, |μ p - ν p| * |(termOf P Q p).coeff j| := by
        refine sum_le_sum fun j _ => ?_
        rw [← sum_sub_distrib]
        refine (abs_sum_le_sum_abs _ _).trans (le_of_eq (sum_congr rfl fun p _ => ?_))
        rw [← sub_mul, abs_mul]
    _ = ∑ p ∈ S, |μ p - ν p| * ∑ j ∈ range K, |(termOf P Q p).coeff j| := by
        rw [sum_comm]
        exact sum_congr rfl fun p _ => by rw [mul_sum]
    _ ≤ ∑ p ∈ S, |μ p - ν p| := sum_le_sum fun p _ =>
        mul_le_of_le_one_right (abs_nonneg _)
          ((sum_abs_coeff_le_l1 _ _).trans (l1_termOf_le_one hP hQ p))

/-- **The head of the residual**: the first `K` radial coefficients (`2K ≤ N + 1`) of the kernel
of `μ`, compared with `c` in degree one, are controlled by those of the kernel of any table `ν`
on `headIdx N` and the `ℓ¹` distance of the tables there. -/
theorem head_residual_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (hQ0 : Q.coeff 0 = 0)
    (μ ν : ℕ × ℕ → ℝ) (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0) {N K : ℕ}
    (hK : 2 * K ≤ N + 1) (c : ℝ) :
    ∑ j ∈ range K, |bivarKernel P Q μ j - if j = 0 then c else 0|
      ≤ ∑ j ∈ range K, |∑ p ∈ headIdx N, ν p * (termOf P Q p).coeff j - if j = 0 then c else 0|
        + ∑ p ∈ headIdx N, |μ p - ν p| := by
  refine le_trans ?_ (add_le_add le_rfl (head_perturbation P Q hP hQ (headIdx N) μ ν K))
  rw [← sum_add_distrib]
  refine sum_le_sum fun j hj => ?_
  rw [bivarKernel_eq_head P Q hQ0 μ hpar (N := N) (by have := mem_range.1 hj; omega)]
  have := abs_add_le (∑ p ∈ headIdx N, ν p * (termOf P Q p).coeff j - if j = 0 then c else 0)
    (∑ p ∈ headIdx N, μ p * (termOf P Q p).coeff j - ∑ p ∈ headIdx N, ν p * (termOf P Q p).coeff j)
  refine le_trans (le_of_eq ?_) this
  congr 1; ring

end

end Grothe.Upper
