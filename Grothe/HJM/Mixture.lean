import Grothe.Transfer

/-!
# Mixtures of dominated radial kernels (HJM, Lemmas 3.2 and 3.6)

Heilman–Jones–Malavolta mix several rounding schemes: branch `r` is selected with probability `|w_r|/M` and its
output orientation absorbs the sign of `w_r`. In terms of kernels, domination is preserved by combinations whose
absolute weights sum to at most one (`DominatedKernel.mixture`). For radial kernels the coefficients add
(`radialKernel_mixture`). With the transfer inequality this gives the mixture bound

    K_G^ℂ ≤ M / (q̂₀ − Σ_{k≥1} |q̂_k|),   q̂ = Σ_r w_r h_r,   M ≥ Σ_r |w_r|          (`mixture_bound`)

(HJM, Section 6.1; the inverse-series repair of Lemma 3.6 is the transfer inequality's residual estimate).
-/

open scoped ComplexConjugate

namespace Grothe

noncomputable section

variable {ι : Type*}

/-- Kernels that agree on the closed unit disc are dominated together. -/
lemma DominatedKernel.congr {Q₁ Q₂ : ℂ → ℂ} (h : DominatedKernel Q₁) (he : ∀ z : ℂ, ‖z‖ ≤ 1 → Q₁ z = Q₂ z) :
    DominatedKernel Q₂ := by
  intro m n A κ _ x y hx hy
  have hz : ∀ i j, ‖inner ℂ (x i) (y j)‖ ≤ 1 := fun i j => by
    calc ‖inner ℂ (x i) (y j)‖ ≤ ‖x i‖ * ‖y j‖ := norm_inner_le_norm _ _
      _ = 1 := by rw [hx i, hy j, one_mul]
  have := h m n A κ x y hx hy
  simpa only [he _ (hz _ _)] using this

/-- **Domination is preserved by combinations with absolute weight sum at most one.** -/
theorem DominatedKernel.mixture (s : Finset ι) (w : ι → ℝ) (K : ι → ℂ → ℂ)
    (hK : ∀ r ∈ s, DominatedKernel (K r)) (hw : ∑ r ∈ s, |w r| ≤ 1) :
    DominatedKernel fun z => ∑ r ∈ s, (w r : ℂ) * K r z := by
  intro m n A κ _ x y hx hy
  have h1 : ∀ i, ∑ j, A i j * ∑ r ∈ s, (w r : ℂ) * K r (inner ℂ (x i) (y j)) =
      ∑ r ∈ s, (w r : ℂ) * ∑ j, A i j * K r (inner ℂ (x i) (y j)) := by
    intro i
    simp only [Finset.mul_sum]
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun r _ => Finset.sum_congr rfl fun j _ => by ring
  have e : ∑ i, ∑ j, A i j * ∑ r ∈ s, (w r : ℂ) * K r (inner ℂ (x i) (y j)) =
      ∑ r ∈ s, (w r : ℂ) * ∑ i, ∑ j, A i j * K r (inner ℂ (x i) (y j)) := by
    simp only [h1]
    rw [Finset.sum_comm]
    simp only [Finset.mul_sum]
  rw [e]
  calc ‖∑ r ∈ s, (w r : ℂ) * ∑ i, ∑ j, A i j * K r (inner ℂ (x i) (y j))‖
      ≤ ∑ r ∈ s, ‖(w r : ℂ) * ∑ i, ∑ j, A i j * K r (inner ℂ (x i) (y j))‖ := norm_sum_le _ _
    _ ≤ ∑ r ∈ s, |w r| * scalarOpt A := by
        refine Finset.sum_le_sum fun r hr => ?_
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
        exact mul_le_mul_of_nonneg_left (hK r hr m n A κ x y hx hy) (abs_nonneg _)
    _ = (∑ r ∈ s, |w r|) * scalarOpt A := by rw [Finset.sum_mul]
    _ ≤ 1 * scalarOpt A := mul_le_mul_of_nonneg_right hw (scalarOpt_nonneg A)
    _ = scalarOpt A := one_mul _

lemma summable_radial_term {h : ℕ → ℝ} (hs : Summable fun n => |h n|) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    Summable fun n => (h n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n)) := by
  refine Summable.of_norm_bounded hs fun n => ?_
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, norm_mul, norm_pow, Complex.norm_real, norm_norm]
  have h1 : ‖z‖ * ‖z‖ ^ (2 * n) ≤ 1 :=
    calc ‖z‖ * ‖z‖ ^ (2 * n) ≤ 1 * 1 :=
          mul_le_mul hz (pow_le_one₀ (norm_nonneg _) hz) (by positivity) zero_le_one
      _ = 1 := one_mul 1
  exact mul_le_of_le_one_right (abs_nonneg _) h1

/-- **Radial kernels are linear in their coefficients** (on the closed unit disc). -/
lemma radialKernel_mixture (s : Finset ι) (w : ι → ℝ) (h : ι → ℕ → ℝ)
    (hs : ∀ r ∈ s, Summable fun n => |h r n|) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ∑ r ∈ s, (w r : ℂ) * radialKernel (h r) z = radialKernel (fun n => ∑ r ∈ s, w r * h r n) z := by
  simp only [radialKernel]
  have e : (fun n => ((∑ r ∈ s, w r * h r n : ℝ) : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))) =
      fun n => ∑ r ∈ s, (w r : ℂ) * ((h r n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))) := by
    ext n; push_cast; rw [Finset.sum_mul]; refine Finset.sum_congr rfl fun r _ => ?_; ring
  rw [e, Summable.tsum_finsetSum (fun r hr => (summable_radial_term (hs r hr) hz).mul_left (w r : ℂ))]
  refine Finset.sum_congr rfl fun r _ => ?_
  rw [tsum_mul_left]

/-- **The mixture bound** `K ≤ M / (q̂₀ − Σ_{k≥1} |q̂_k|)` for `q̂ = Σ_r w_r h_r` with dominated radial branches. -/
theorem mixture_bound (s : Finset ι) (w : ι → ℝ) (h : ι → ℕ → ℝ)
    (hs : ∀ r ∈ s, Summable fun n => |h r n|) (hdom : ∀ r ∈ s, DominatedKernel (radialKernel (h r)))
    {M : ℝ} (hM0 : 0 < M) (hM : ∑ r ∈ s, |w r| ≤ M)
    (hres : ∑' n, |∑ r ∈ s, w r * h r (n + 1)| < ∑ r ∈ s, w r * h r 0) :
    IsGrothendieckBound (M / (∑ r ∈ s, w r * h r 0 - ∑' n, |∑ r ∈ s, w r * h r (n + 1)|)) := by
  set q : ℕ → ℝ := fun n => ∑ r ∈ s, w r * h r n with hq
  have hqs : Summable fun n => |q n| := by
    refine Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun n => ?_)
      (summable_sum fun r hr => ((hs r hr).mul_left |w r|))
    rw [hq]
    refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
    refine Finset.sum_congr rfl fun r _ => ?_
    rw [abs_mul]
  -- normalize by `M`
  set h' : ℕ → ℝ := fun n => q n / M with hh'
  have hs' : Summable fun n => |h' n| := by
    simpa [hh', abs_div, abs_of_pos hM0, div_eq_mul_inv] using hqs.mul_right M⁻¹
  have hdom' : DominatedKernel (radialKernel h') := by
    have hmix := DominatedKernel.mixture s (fun r => w r / M) (fun r => radialKernel (h r)) hdom (by
      calc ∑ r ∈ s, |w r / M| = (∑ r ∈ s, |w r|) / M := by
            rw [Finset.sum_div]; exact Finset.sum_congr rfl fun r _ => by rw [abs_div, abs_of_pos hM0]
        _ ≤ 1 := (div_le_one hM0).2 hM)
    refine hmix.congr fun z hz => ?_
    rw [radialKernel_mixture s (fun r => w r / M) h hs hz]
    congr 1; ext n; simp only [hh', hq, Finset.sum_div]; exact Finset.sum_congr rfl fun r _ => by ring
  have hres' : |h' 0 - q 0 / M| + ∑' n, |h' (n + 1)| ≤ (∑' n, |q (n + 1)|) / M := by
    simp only [hh', sub_self, abs_zero, zero_add, abs_div, abs_of_pos hM0]
    rw [tsum_div_const]
  have hlt : (∑' n, |q (n + 1)|) / M < q 0 / M := (div_lt_div_iff_of_pos_right hM0).2 hres
  have hT := transfer h' hs' hdom' hlt hres'
  have e : 1 / (q 0 / M - (∑' n, |q (n + 1)|) / M) = M / (q 0 - ∑' n, |q (n + 1)|) := by
    have hne : q 0 - ∑' n, |q (n + 1)| ≠ 0 := by linarith
    field_simp
  rw [e] at hT
  exact hT

end

end Grothe
