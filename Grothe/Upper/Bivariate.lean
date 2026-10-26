import Grothe.ListPoly
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Tactic.Ring

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

/-! ### The terms -/

/-- The index shift `⌊n/2⌋ + ⌊m/2⌋` (`= (n+m−1)/2` for `n+m` odd). -/
def shiftOf (p : ℕ × ℕ) : ℕ := p.1 / 2 + p.2 / 2

/-- The polynomial `X^{shift} · P^n · Q^m` of an index pair. -/
def termOf (P Q : ℝ[X]) (p : ℕ × ℕ) : ℝ[X] := X ^ shiftOf p * (P ^ p.1 * Q ^ p.2)

lemma l1_termOf_le_one {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (p : ℕ × ℕ) :
    l1 (termOf P Q p) ≤ 1 := by
  have h : ∀ (R : ℝ[X]) (k : ℕ), l1 R ≤ 1 → l1 (R ^ k) ≤ 1 := fun R k hR =>
    (l1_pow_le R k).trans (pow_le_one₀ (l1_nonneg R) hR)
  refine (l1_mul_le _ _).trans ((mul_le_mul (h _ _ l1_X.le) ((l1_mul_le _ _).trans ?_)
    (l1_nonneg _) zero_le_one).trans (one_mul 1).le)
  exact (mul_le_mul (h _ _ hP) (h _ _ hQ) (l1_nonneg _) zero_le_one).trans (one_mul 1).le

lemma abs_coeff_termOf_le {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (p : ℕ × ℕ) (j : ℕ) :
    |(termOf P Q p).coeff j| ≤ 1 :=
  (abs_coeff_le_l1 _ j).trans (l1_termOf_le_one hP hQ p)

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

lemma summable_kernel_term {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) {μ : ℕ × ℕ → ℝ}
    (hμ : Summable fun p => |μ p|) (j : ℕ) : Summable fun p => μ p * (termOf P Q p).coeff j := by
  refine Summable.of_norm_bounded hμ fun p => ?_
  rw [Real.norm_eq_abs, abs_mul]
  exact mul_le_of_le_one_right (abs_nonneg _) (abs_coeff_termOf_le hP hQ p j)

/-- The partial sums of the kernel are at most `Σ|μ|`. -/
lemma sum_abs_bivarKernel_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (J : ℕ) :
    ∑ j ∈ range J, |bivarKernel P Q μ j| ≤ ∑' p, |μ p| := by
  exact sum_abs_tsum_le (range J) (fun p j => μ p * (termOf P Q p).coeff j)
    (fun j _ => (summable_kernel_term hP hQ hμ j).norm) hμ fun p => by
      simp only [abs_mul, ← mul_sum]
      exact mul_le_of_le_one_right (abs_nonneg _) ((sum_abs_coeff_le_l1 _ _).trans
        (l1_termOf_le_one hP hQ p))

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
  rw [← Summable.tsum_sub (summable_kernel_term hP hQ hμ j)
    (summable_kernel_term hP hQ hν j)]
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

/-- The coefficient cost of each block can be retained in the perturbation
bound. The same finite kernel head is used on both sides. -/
theorem head_perturbation_weighted (P Q : ℝ[X]) (S : Finset (ℕ × ℕ))
    (μ ν : ℕ × ℕ → ℝ) (K : ℕ) (w : (ℕ × ℕ) → ℝ)
    (hw : ∀ p ∈ S, ∑ j ∈ range K, |(termOf P Q p).coeff j| ≤ w p) :
    ∑ j ∈ range K, |∑ p ∈ S, μ p * (termOf P Q p).coeff j -
      ∑ p ∈ S, ν p * (termOf P Q p).coeff j| ≤ ∑ p ∈ S, w p * |μ p - ν p| := by
  calc
    _ ≤ ∑ j ∈ range K, ∑ p ∈ S, |μ p - ν p| * |(termOf P Q p).coeff j| := by
      refine sum_le_sum fun j _ => ?_
      rw [← sum_sub_distrib]
      refine (abs_sum_le_sum_abs _ _).trans (le_of_eq (sum_congr rfl fun p _ => ?_))
      rw [← sub_mul, abs_mul]
    _ = ∑ p ∈ S, (∑ j ∈ range K, |(termOf P Q p).coeff j|) * |μ p - ν p| := by
      rw [sum_comm]
      exact sum_congr rfl fun p _ => by rw [sum_mul]; apply sum_congr rfl; intro j _; ring
    _ ≤ _ := sum_le_sum fun p hp =>
      mul_le_mul_of_nonneg_right (hw p hp) (abs_nonneg _)

/-- **`ℓ¹` perturbation of the table.** -/
theorem head_perturbation (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (S : Finset (ℕ × ℕ))
    (μ ν : ℕ × ℕ → ℝ) (K : ℕ) :
    ∑ j ∈ range K, |∑ p ∈ S, μ p * (termOf P Q p).coeff j - ∑ p ∈ S, ν p * (termOf P Q p).coeff j|
      ≤ ∑ p ∈ S, |μ p - ν p| := by
  simpa only [one_mul] using
    head_perturbation_weighted P Q S μ ν K (fun _ => 1)
      (fun p _ => (sum_abs_coeff_le_l1 _ _).trans (l1_termOf_le_one hP hQ p))

/-- A weighted version of the finite-head residual comparison. -/
theorem head_residual_le_weighted (P Q : ℝ[X]) (hQ0 : Q.coeff 0 = 0)
    (μ ν : ℕ × ℕ → ℝ) (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0)
    {N K : ℕ} (hK : 2 * K ≤ N + 1) (c : ℝ) (w : (ℕ × ℕ) → ℝ)
    (hw : ∀ p ∈ headIdx N, ∑ j ∈ range K, |(termOf P Q p).coeff j| ≤ w p) :
    ∑ j ∈ range K, |bivarKernel P Q μ j - if j = 0 then c else 0| ≤
      ∑ j ∈ range K, |∑ p ∈ headIdx N, ν p * (termOf P Q p).coeff j - if j = 0 then c else 0| +
        ∑ p ∈ headIdx N, w p * |μ p - ν p| := by
  refine le_trans ?_ (add_le_add le_rfl (head_perturbation_weighted P Q (headIdx N) μ ν K w hw))
  rw [← sum_add_distrib]
  refine sum_le_sum fun j hj => ?_
  rw [bivarKernel_eq_head P Q hQ0 μ hpar (N := N) (by have := mem_range.1 hj; omega)]
  have := abs_add_le (∑ p ∈ headIdx N, ν p * (termOf P Q p).coeff j - if j = 0 then c else 0)
    (∑ p ∈ headIdx N, μ p * (termOf P Q p).coeff j - ∑ p ∈ headIdx N, ν p * (termOf P Q p).coeff j)
  refine le_trans (le_of_eq ?_) this
  congr 1; ring

/-- **The head of the residual**: the first `K` radial coefficients (`2K ≤ N + 1`) of the kernel
of `μ`, compared with `c` in degree one, are controlled by those of the kernel of any table `ν`
on `headIdx N` and the `ℓ¹` distance of the tables there. -/
theorem head_residual_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (hQ0 : Q.coeff 0 = 0)
    (μ ν : ℕ × ℕ → ℝ) (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0) {N K : ℕ}
    (hK : 2 * K ≤ N + 1) (c : ℝ) :
    ∑ j ∈ range K, |bivarKernel P Q μ j - if j = 0 then c else 0|
      ≤ ∑ j ∈ range K, |∑ p ∈ headIdx N, ν p * (termOf P Q p).coeff j - if j = 0 then c else 0|
        + ∑ p ∈ headIdx N, |μ p - ν p| := by
  simpa only [one_mul] using
    head_residual_le_weighted P Q hQ0 μ ν hpar hK c (fun _ => 1)
      (fun p _ => (sum_abs_coeff_le_l1 _ _).trans (l1_termOf_le_one hP hQ p))

end

end Grothe.Upper
